﻿using Hangfire;
using Hangfire.Storage;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SMS.App.Utilities.EmailServices;
using SMS.App.Utilities.MACIPServices;
using SMS.App.Utilities.ShortMessageService;
using SMS.BLL.Contracts;
using SMS.Entities;
using SMS.Entities.AdditionalModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SMS.App.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [Authorize]
    public class HangfireController : ControllerBase
    {

        private readonly IStudentManager _studentManager;
        private readonly IAttendanceMachineManager _attendanceMachineManager;
        private readonly IEmployeeManager _employeeManager;
        private readonly IPhoneSMSManager _phoneSMSManager;
        private readonly ISetupMobileSMSManager _setupMobileSMSManager;
        private readonly IOffDayManager _offDayManager;
        private readonly IInstituteManager _instituteManager;
        private readonly IStudentPaymentManager _studentPaymentManager;
        

        #region Constructor Start =================================================
        public HangfireController(IStudentManager studentManager, IAttendanceMachineManager attendanceMachineManager, IEmployeeManager employeeManager, IPhoneSMSManager phoneSMSManager, ISetupMobileSMSManager setupMobileSMSManager, IOffDayManager offDayManager, IInstituteManager instituteManager, IStudentPaymentManager studentPaymentManager)
        {
            _studentManager = studentManager;
            _attendanceMachineManager = attendanceMachineManager;
            _employeeManager = employeeManager;
            _phoneSMSManager = phoneSMSManager;
            _setupMobileSMSManager = setupMobileSMSManager;
            _offDayManager = offDayManager;
            _instituteManager = instituteManager;
            _studentPaymentManager = studentPaymentManager;
        }
        #endregion Constructor Finished xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxX


        [HttpGet]
        public async Task<IActionResult> AttendanceBackgroundJob()
        {
            var jobs = JobStorage.Current.GetConnection().GetRecurringJobs();
            Institute institute = await _instituteManager.GetFirstOrDefaultAsync();
            DateTime instituteStartTime = institute.StartingTime;
            DateTime instituteCloseTime = institute.ClosingTime;
            DateTime instituteLateTime = institute.LateTime;

            var startTimeHr = instituteStartTime.Hour;
            var startTimeMn = instituteStartTime.Minute;
             
            var instituteEndHr = instituteCloseTime.Hour;
            var instituteEndMn = instituteCloseTime.Minute;


            var lateTimeHr = instituteLateTime.Hour;
            var lateTimeMn = instituteLateTime.Minute;

            foreach (var item in jobs)
            {
                BackgroundJob.Delete(item.Id);
                RecurringJob.RemoveIfExists(item.Id);
            }

            SetupMobileSMS setupMobileSMS = await _setupMobileSMSManager.GetByIdAsync(1);
            if (setupMobileSMS != null)
            {
                if (setupMobileSMS.CheckInSMSSummary == true)
                {
                    int smsTimeHr = startTimeHr + 1;
                    var cronEx = "5 " + smsTimeHr + " * * 6-4";
                    RecurringJob.AddOrUpdate(() => SMSSendDailyAttendanceSummary(), cronEx);
                    //At 11:05 AM, Saturday through Thursday
                }
                if (setupMobileSMS.CheckInSMSService == true)
                {
                    int smsStartTime = startTimeHr - 1;
                    int smsEndTime = startTimeHr + 1;
                    RecurringJob.AddOrUpdate(() => SendCheckInSMS(), "*/10 "+smsStartTime+"-"+smsEndTime+" * * 6-4", TimeZoneInfo.Local);
                    //Every 10 minutes, between 08:00 AM and 09:59 AM, Saturday through Thursday
                } 

                if (setupMobileSMS.CheckOutSMSService == true)
                {
                    int smsStartTime = (startTimeHr + instituteEndHr)/2;
                    int smsEndTime = instituteEndHr + 1;
                    RecurringJob.AddOrUpdate(() => SendCheckOutSMS(), "*/10 "+smsStartTime+"-"+smsEndTime+" * * 6-4", TimeZoneInfo.Local);
                    //Every 10 minutes, between 12:00 PM and 03:59 PM, Saturday through Thursday
                }
                if (setupMobileSMS.AbsentNotification == true)
                {
                    int smsTimeHr = startTimeHr + 2;
                    RecurringJob.AddOrUpdate(() => SendAbsentNotificationSMS(), "1 0 "+smsTimeHr+" * * 6-4", TimeZoneInfo.Local);
                    //At 10:00:01 AM, Saturday through Thursday
                }
                if (setupMobileSMS.DailyCollectionSMSService==true)
                {
                    RecurringJob.AddOrUpdate(() => SendDailyCollectionSMS(), "1 0 18 * * 1-4,6-7", TimeZoneInfo.Local);
                    //At 6:00 pm, saturday through Thursday
                    //0 18 ? *SUN,MON,TUE,WED,THU,SAT *
                }
            }
            
            return RedirectToAction("SMSControl", "Setup");
        }

        #region CheckIn SMS Section Start===========================================
        public async Task<string> SendCheckInSMS()
        {
            string msg = string.Empty;
            var currentMonthHolidays = await _offDayManager.GetMonthlyHolidaysAsync(DateTime.Now.ToString("MMyyyy"));
            if (currentMonthHolidays != null && currentMonthHolidays.Count > 0)
            {
                foreach (var holiday in currentMonthHolidays)
                {
                    if (holiday.ToString("ddMMyyyy") == DateTime.Now.ToString("ddMMyyyy"))
                    {
                        msg = "Today is offday";
                        return msg;
                    }
                }
            }


            SetupMobileSMS setupMobileSMS = await _setupMobileSMSManager.GetByIdAsync(1);
            if (setupMobileSMS != null)
            {
                try
                {
                    if (setupMobileSMS.SMSService == true)
                    {
                        if (setupMobileSMS.CheckInSMSService == true)
                        {
                            if (setupMobileSMS.CheckInSMSServiceForEmployees == true)
                            {
                                await CheckInSMSSendDailyAttendanceEmployee();
                            }
                            if (setupMobileSMS.CheckInSMSServiceForGirlsStudent == true)
                            {
                                await CheckInSMSSendDailyAttendanceStudentGirls();
                            }
                            if (setupMobileSMS.CheckInSMSServiceForMaleStudent == true)
                            {
                                await CheckInSMSSendDailyAttendanceStudentBoys();
                            }
                            msg = "CheckIn SMS Service has been started.";
                        }
                    }
                    else
                    {
                        msg = "SMS Service is Off";
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
            return msg;
        }

        private async Task<IActionResult> CheckInSMSSendDailyAttendanceStudentBoys()
        {
            var attendanceSMSSetup = await _setupMobileSMSManager.GetByIdAsync(1);
            if (attendanceSMSSetup.CheckInSMSService == false)
            {
                return Ok("CheckIn SMS Service is Inactive");
            }
            if (attendanceSMSSetup.CheckInSMSServiceForMaleStudent == false)
            {
                return Ok("CheckIn SMS Service for Boys is Inactive");
            }
            if (attendanceSMSSetup.CheckInSMSServiceForMaleStudent == true)
            {
                List<Tran_MachineRawPunch> todaysAllCheckInAttendance = await _attendanceMachineManager.GetAllAttendanceByDateAsync(DateTime.Today);

                try
                {
                    if (todaysAllCheckInAttendance != null || todaysAllCheckInAttendance.Count > 0)
                    {
                        foreach (Tran_MachineRawPunch attendance in todaysAllCheckInAttendance)
                        {
                            Student student = await _studentManager.GetStudentByUniqueIdAsync(attendance.CardNo.Trim());

                            if (student == null || student.GenderId != 1 || student.Status == false || student.SMSService == false)
                            {
                                continue;
                            }
                            else
                            {
                                string smsType = "CheckIn";
                                string phoneNumber = student.GuardianPhone != null ? student.GuardianPhone : student.PhoneNo != null ? student.PhoneNo : string.Empty;
                                if (string.IsNullOrEmpty(phoneNumber))
                                {
                                    continue;
                                }
                                else
                                {
                                    bool isAlreadySMSSent = await _phoneSMSManager.IsSMSSendForAttendance(phoneNumber, smsType, DateTime.Now.ToString("dd-MM-yyyy"));
                                    if (isAlreadySMSSent)
                                    {
                                        continue;
                                    }
                                    else
                                    {
                                        string studentName = !string.IsNullOrEmpty(student.NameBangla) ? student.NameBangla : student.Name;
                                        string smsText = GenerateCheckInSMSText(studentName, attendance.PunchDatetime.ToString("hh:mm tt"));
                                        if (PhoneNumberValidate(phoneNumber) == false)
                                        {
                                            continue;
                                        }

                                        bool isSMSSent = await MobileSMS.SendSMS(phoneNumber, smsText);
                                        if (isSMSSent)
                                        {
                                            PhoneSMS phoneSMS = new PhoneSMS()
                                            {
                                                Text = smsText,
                                                MobileNumber = phoneNumber,
                                                SMSType = smsType,
                                                CreatedBy = "Automation",
                                                CreatedAt = DateTime.Now,
                                                EditedBy = "Automation",
                                                EditedAt = DateTime.Now,
                                                MACAddress = MACService.GetMAC()
                                            };
                                            bool isSave = await _phoneSMSManager.AddAsync(phoneSMS);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                catch (Exception)
                {
                }
            }


            return Ok();
        }

        private async Task<IActionResult> CheckInSMSSendDailyAttendanceStudentGirls()
        {

            var attendanceSMSSetup = await _setupMobileSMSManager.GetByIdAsync(1);
            if (attendanceSMSSetup.CheckInSMSService == false)
            {
                return Ok("CheckIn SMS Service is Inactive");
            }
            if (attendanceSMSSetup.CheckInSMSServiceForGirlsStudent == false)
            {
                return Ok("CheckIn SMS Service for Girls is Inactive");
            }
            if (attendanceSMSSetup.CheckInSMSServiceForGirlsStudent == true)
            {
                var todaysAllCheckInAttendance = await _attendanceMachineManager.GetAllAttendanceByDateAsync(DateTime.Today);
                try
                {
                    if (todaysAllCheckInAttendance != null || todaysAllCheckInAttendance.Count > 0)
                    {
                        foreach (Tran_MachineRawPunch attendance in todaysAllCheckInAttendance)
                        {
                            Student student = await _studentManager.GetStudentByUniqueIdAsync(attendance.CardNo.Trim());

                            if (student == null || student.GenderId != 2 || student.Status == false || student.SMSService != true)
                            {
                                continue;
                            }
                            else
                            {
                                string smsType = "CheckIn";
                                string phoneNumber = student.GuardianPhone ?? (student.PhoneNo != null ? student.PhoneNo : string.Empty);
                                if (string.IsNullOrEmpty(phoneNumber))
                                {
                                    continue;
                                }
                                else
                                {
                                    bool isAlreadySMSSent = await _phoneSMSManager.IsSMSSendForAttendance(phoneNumber, smsType, DateTime.Now.ToString("dd-MM-yyyy"));
                                    if (isAlreadySMSSent)
                                    {
                                        continue;
                                    }
                                    else
                                    {
                                        string studentName = !string.IsNullOrEmpty(student.NameBangla) ? student.NameBangla : student.Name;
                                        string smsText = GenerateCheckInSMSText(studentName, attendance.PunchDatetime.ToString("hh:mm tt"));
                                        if (PhoneNumberValidate(phoneNumber) == false)
                                        {
                                            continue;
                                        }
                                        bool isAlreadySMSSent2nd = await _phoneSMSManager.IsSMSSendForAttendance(phoneNumber, smsType, DateTime.Now.ToString("dd-MM-yyyy"));
                                        if (isAlreadySMSSent2nd) { continue; }  
                                        bool isSMSSent = await MobileSMS.SendSMS(phoneNumber, smsText);
                                        if (isSMSSent)
                                        {
                                            PhoneSMS phoneSMS = new PhoneSMS()
                                            {
                                                Text = smsText,
                                                MobileNumber = phoneNumber,
                                                SMSType = smsType,
                                                CreatedBy = "Automation",
                                                CreatedAt = DateTime.Now,
                                                EditedBy = "Automation",
                                                EditedAt = DateTime.Now,
                                                MACAddress = MACService.GetMAC()
                                            };
                                            bool isSave = await _phoneSMSManager.AddAsync(phoneSMS);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                catch (Exception)
                {
                }
            }
            return Ok();
        }

        private async Task<IActionResult> CheckInSMSSendDailyAttendanceEmployee()
        {
            var attendanceSMSSetup = await _setupMobileSMSManager.GetByIdAsync(1);
            if (attendanceSMSSetup.CheckInSMSService == false)
            {
                return Ok("CheckIn SMS Service is Inactive");
            }
            if (attendanceSMSSetup.CheckInSMSServiceForEmployees == false)
            {
                return Ok("CheckIn SMS Service for Employees is Inactive");
            }
            if (attendanceSMSSetup.CheckInSMSServiceForEmployees == true)
            {
                var todaysAllAttendance = await _attendanceMachineManager.GetEmpCheckinDataByDateAsync(DateTime.Now.ToString("dd-MM-yyyy"));
                
                if (todaysAllAttendance.Count > 0)
                {

                    try
                    {
                        string phoneNumber = string.Empty;
                        string smsText = string.Empty;
                        string smsType = "CheckIn";
                        string employeeName = string.Empty;
                        string attTime = string.Empty;
                        foreach (var att in todaysAllAttendance)
                        {
                            Employee empObject = await _employeeManager.GetByIdAsync(Convert.ToInt32(att.CardNo.Trim()));
                            if (empObject == null)
                            {
                                continue;
                            }
                            if (empObject != null || empObject.Status != false)
                            {
                                phoneNumber = empObject.Phone;

                                bool isSMSAlredySent = await _phoneSMSManager.IsSMSSendForAttendance(phoneNumber, smsType, DateTime.Now.ToString("dd-MM-yyyy"));
                                if (isSMSAlredySent)
                                {
                                    continue;
                                }
                                else
                                {
                                    employeeName = !string.IsNullOrEmpty(empObject.EmployeeNameBangla) ? empObject.EmployeeNameBangla : empObject.EmployeeName;
                                    attTime = att.PunchDatetime.ToString("hh:mm tt");
                                    smsText = GenerateCheckInSMSText(employeeName, attTime);

                                    if (PhoneNumberValidate(phoneNumber) == false)
                                    {
                                        continue;
                                    }
                                    bool isSend = await MobileSMS.SendSMS(phoneNumber, smsText);
                                    if (isSend)
                                    {
                                        PhoneSMS phoneSMS = new PhoneSMS()
                                        {
                                            Text = smsText,
                                            CreatedAt = DateTime.Now,
                                            CreatedBy = "Automation",                                            
                                            EditedAt = DateTime.Now,
                                            EditedBy = "Automation",
                                            MobileNumber = phoneNumber,
                                            MACAddress = MACService.GetMAC(),
                                            SMSType = smsType
                                        };
                                        await _phoneSMSManager.AddAsync(phoneSMS);
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                    return Ok();
                }
            }

            return Ok("No Data");

        }
        #endregion CheckIn SMS Section Finished xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

        #region CheckOut SMS Section Start =========================================
        public async Task<IActionResult> SendCheckOutSMS()
        {
            string msg = string.Empty;
            var currentMonthHolidays = await _offDayManager.GetMonthlyHolidaysAsync(DateTime.Now.ToString("MMyyyy"));
            if (currentMonthHolidays != null && currentMonthHolidays.Count > 0)
            {
                foreach (var holiday in currentMonthHolidays)
                {
                    if (holiday.ToString("ddMMyyyy") == DateTime.Now.ToString("ddMMyyyy"))
                    {
                        msg = "Today is offday";
                        return BadRequest(msg);
                    }
                }
            }

            SetupMobileSMS setupMobileSMS = await _setupMobileSMSManager.GetByIdAsync(1);
            if (setupMobileSMS.CheckOutSMSService == true)
            {
                if (setupMobileSMS.CheckOutSMSServiceForEmployees == true)
                {
                    await CheckOutSMSSendDailyAttendanceEmployees();
                }
                if (setupMobileSMS.CheckOutSMSServiceForGirlsStudent == true)
                {
                    await CheckOutSMSSendDailyAttendanceGirls();
                }
                if (setupMobileSMS.CheckOutSMSServiceForMaleStudent == true)
                {
                    await CheckOutSMSSendDailyAttendanceBoys();
                }
            }
            return Ok("Send Chechout sms completed");
        }
        private async Task<IActionResult> CheckOutSMSSendDailyAttendanceBoys()
        {
            DateTime date = DateTime.Today;
            List<Tran_MachineRawPunch> todaysCheckOutAttendances = new List<Tran_MachineRawPunch>();
            todaysCheckOutAttendances = await _attendanceMachineManager.GetCheckOutDataByDateAsync(date.ToString("dd-MM-yyyy"));
            try
            {
                if (todaysCheckOutAttendances != null || todaysCheckOutAttendances.Count > 0)
                {
                    foreach (Tran_MachineRawPunch attendance in todaysCheckOutAttendances)
                    {
                        if (attendance.CardNo.Length != 8)
                        {
                            continue;
                        }
                        Student student = await _studentManager.GetStudentByClassRollAsync(Convert.ToInt32(attendance.CardNo.Trim()));
                        if (student == null)
                        {
                            continue;
                        }
                        if (student.GenderId == 2 || student.GenderId == 3 || student.Status == false)
                        {
                            continue;
                        }
                        else
                        {
                            string phoneNumber = !string.IsNullOrEmpty(student.GuardianPhone) ? student.GuardianPhone : !string.IsNullOrEmpty(student.PhoneNo) ? student.PhoneNo : string.Empty;
                            if (string.IsNullOrEmpty(phoneNumber))
                            {
                                continue;
                            }
                            else
                            {
                                string smsType = "CheckOut";
                                bool isAlreadySent = await _phoneSMSManager.IsSMSSendForAttendance(phoneNumber, smsType, date.ToString("dd-MM-yyyy"));
                                if (isAlreadySent)
                                {
                                    continue;
                                }
                                else
                                {
                                    string studentName = !string.IsNullOrEmpty(student.NameBangla) ? student.NameBangla : student.Name;
                                    string smsText = GenerateCheckOutSMSText(studentName, attendance.PunchDatetime.ToString("hh:mm tt"));
                                    bool isSMSSent = await MobileSMS.SendSMS(phoneNumber, smsText);
                                    if (isSMSSent)
                                    {
                                        PhoneSMS phoneSMS = new PhoneSMS()
                                        {
                                            Text = smsText,
                                            MobileNumber = phoneNumber,
                                            SMSType = smsType,
                                            CreatedBy = "Automation",
                                            CreatedAt = DateTime.Now,
                                            MACAddress = MACService.GetMAC()
                                        };
                                        bool isSaved = await _phoneSMSManager.AddAsync(phoneSMS);
                                        continue;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {

            }
            return Ok();
        }

        private async Task<IActionResult> CheckOutSMSSendDailyAttendanceGirls()
        {
            DateTime date = DateTime.Today;
            List<Tran_MachineRawPunch> todaysCheckOutAttendances = new List<Tran_MachineRawPunch>();
            todaysCheckOutAttendances = await _attendanceMachineManager.GetCheckOutDataByDateAsync(date.ToString("dd-MM-yyyy"));
            try
            {
                if (todaysCheckOutAttendances != null)
                {
                    foreach (Tran_MachineRawPunch attendance in todaysCheckOutAttendances)
                    {
                        if (attendance.CardNo.Length != 8)
                        {
                            continue;
                        }
                        Student student = await _studentManager.GetStudentByClassRollAsync(Convert.ToInt32(attendance.CardNo.Trim()));
                        if (student == null)
                        {
                            continue;
                        }
                        if (student.GenderId == 1)
                        {
                            continue;
                        }
                        else
                        {
                            string phoneNumber = !string.IsNullOrEmpty(student.GuardianPhone) ? student.GuardianPhone : !string.IsNullOrEmpty(student.PhoneNo) ? student.PhoneNo : string.Empty;
                            if (string.IsNullOrEmpty(phoneNumber))
                            {
                                continue;
                            }
                            else
                            {
                                string smsType = "CheckOut";
                                bool isAlreadySent = await _phoneSMSManager.IsSMSSendForAttendance(phoneNumber, smsType, date.ToString("dd-MM-yyyy"));
                                if (isAlreadySent)
                                {
                                    continue;
                                }
                                else
                                {
                                    string studentName = !string.IsNullOrEmpty(student.NameBangla) ? student.NameBangla : student.Name;
                                    string smsText = GenerateCheckOutSMSText(studentName, attendance.PunchDatetime.ToString("hh:mm tt"));
                                    bool isSMSSent = await MobileSMS.SendSMS(phoneNumber, smsText);
                                    if (isSMSSent)
                                    {
                                        PhoneSMS phoneSMS = new PhoneSMS()
                                        {
                                            Text = smsText,
                                            MobileNumber = phoneNumber,
                                            SMSType = smsType,
                                            CreatedBy = "Automation",
                                            CreatedAt = DateTime.Now,
                                            MACAddress = MACService.GetMAC()
                                        };
                                        bool isSaved = await _phoneSMSManager.AddAsync(phoneSMS);
                                        continue;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
            return Ok();
        }

        private async Task<IActionResult> CheckOutSMSSendDailyAttendanceEmployees()
        {
            DateTime date = DateTime.Today;
            List<Tran_MachineRawPunch> todaysCheckOutAttendances = new List<Tran_MachineRawPunch>();
            todaysCheckOutAttendances = await _attendanceMachineManager.GetCheckOutDataByDateAsync(date.ToString("dd-MM-yyyy"));
            try
            {
                if (todaysCheckOutAttendances != null || todaysCheckOutAttendances.Count > 0)
                {
                    foreach (Tran_MachineRawPunch attendance in todaysCheckOutAttendances)
                    {
                        Employee objEmployee = await _employeeManager.GetByIdAsync(Convert.ToInt32(attendance.CardNo.Trim()));

                        if (objEmployee == null || objEmployee.Status !=true)
                        {
                            continue;
                        }
                        else
                        {
                            string phoneNumber = objEmployee.Phone;
                            string smsType = "CheckOut";
                            bool isAlreadySent = await _phoneSMSManager.IsSMSSendForAttendance(phoneNumber, smsType, date.ToString("dd-MM-yyyy"));
                            if (isAlreadySent)
                            {
                                continue;
                            }
                            else
                            {
                                string empName = !string.IsNullOrEmpty(objEmployee.EmployeeNameBangla) ? objEmployee.EmployeeNameBangla : objEmployee.EmployeeName;
                                string smsText = GenerateCheckOutSMSText(empName, attendance.PunchDatetime.ToString("hh:mm tt"));
                                bool isSent = await MobileSMS.SendSMS(phoneNumber, smsText);
                                if (isSent)
                                {
                                    PhoneSMS phoneSMS = new PhoneSMS()
                                    {
                                        Text = smsText,
                                        MobileNumber = phoneNumber,
                                        SMSType = smsType,
                                        CreatedBy = "Automation",
                                        CreatedAt = DateTime.Now,
                                        MACAddress = MACService.GetMAC()
                                    };
                                    bool isSaved = await _phoneSMSManager.AddAsync(phoneSMS);
                                    continue;
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {


            }

            return Ok();
        }
        #endregion CheckOut SMS Finished XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

        #region Summary SMS Region Start Here ======================================

        public async Task<IActionResult> SMSSendDailyAttendanceSummary()
        {
            var currentMonthHolidays = await _offDayManager.GetMonthlyHolidaysAsync(DateTime.Now.ToString("MMyyyy"));
            if (currentMonthHolidays != null && currentMonthHolidays.Count>0)
            {
                foreach (var holiday in currentMonthHolidays)
                {
                    if (holiday.ToString("ddMMyyyy") == DateTime.Now.ToString("ddMMyyyy"))
                    {
                        return BadRequest("Today is offday");
                    }
                }
            }

            SetupMobileSMS setupMobileSMS = await _setupMobileSMSManager.GetByIdAsync(1);
            if (setupMobileSMS.CheckInSMSSummary == false)
            {
                return BadRequest();
            }
            if (setupMobileSMS.CheckInSMSSummary == true)
            {
                int totalEmployee = 0;
                int totalStudent = 0;
                int totalGirlsStudent = 0;
                int totalBoysStudent = 0;


                try
                {
                    DateTime tDate = DateTime.Today;
                    var allCheckInAttendance = await _attendanceMachineManager.GetCheckinDataByDateAsync(tDate.ToString("dd-MM-yyyy"));
                    if (allCheckInAttendance != null || allCheckInAttendance.Count() > 0)
                    {
                        var students = await _studentManager.GetAllAsync();
                        var employees = await _employeeManager.GetAllAsync();

                        totalGirlsStudent = (from a in allCheckInAttendance
                                             join s in students.Where(s => s.Status == true) on a.CardNo.Trim() equals s.UniqueId.Trim()
                                             where s.GenderId == 2
                                             select a).Count();



                        totalBoysStudent = (from a in allCheckInAttendance
                                            join s in students.Where(s => s.Status == true) on a.CardNo.Trim() equals s.UniqueId.Trim()
                                            where s.GenderId == 1
                                            select a).Count();

                        totalStudent = totalBoysStudent + totalGirlsStudent;


                        totalEmployee = (from a in allCheckInAttendance
                                         join e in employees on a.CardNo.Trim() equals e.Id.ToString().Trim()
                                         select a).Count();
                        string msgText = string.Empty;
                        var instituteInfo = await _instituteManager.GetAllAsync();
                        msgText = $"Attendance Summary ({DateTime.Today.ToString("dd MMM yyyy")}):\n" +
                            $"Employees: {totalEmployee} \n" +
                            $"Students:({totalBoysStudent}+{totalGirlsStudent})= {totalStudent} \n" +
                            $"-"+instituteInfo.FirstOrDefault().ShortName;

                        if (totalStudent <= 0)
                        {
                            msgText = "Your attendance machine is off or disconnected!";
                        }

                        //Email Send
                        string[] toEmail = { "golamhabibpalash@gmail.com", instituteInfo.FirstOrDefault().Email };
                        //string toEmail = "golamhabibpalash@gmail.com";
                        string emailSubject = "Todays attended report summary";
                        string mailBody = msgText;
                        int i = 0;
                        foreach (var item in toEmail)
                        {
                            EmailService.SendEmail(toEmail[i], emailSubject, mailBody);
                            i++;
                        }

                        //Phone SMS Send
                        string[] phoneNumber = { "01717678134",instituteInfo.FirstOrDefault().Phone1 };
                        string smsType = "CheckIn Summary";
                        foreach (var num in phoneNumber)
                        {
                            bool isAlreadySent = await _phoneSMSManager.IsSMSSendForAttendance(num, smsType, DateTime.Today.ToString("dd-MM-yyyy"));
                            if (isAlreadySent)
                            {
                                continue;
                            }
                            bool isSend = await MobileSMS.SendSMS(num, msgText);
                            if (isSend)
                            {
                                PhoneSMS phoneSMS = new()
                                {
                                    Text = msgText,
                                    CreatedAt = DateTime.Now,
                                    CreatedBy = "Automation",
                                    EditedBy = "Automation",
                                    EditedAt = DateTime.Now,
                                    MobileNumber = num,
                                    MACAddress = MACService.GetMAC(),
                                    SMSType = smsType
                                };
                                try
                                {
                                    await _phoneSMSManager.AddAsync(phoneSMS);
                                }
                                catch (Exception)
                                {
                                    throw;
                                }
                            }
                        }
                    }
                }
                catch (Exception)
                {
                    throw;
                }

            }

            return Ok();

        }
        #endregion Summary SMS Region Finished Here XXXXXXXXXXXXXXXXXXXXXXX


        #region Absent Student Notification by SMS Start here ======================
        public async Task<IActionResult> SendAbsentNotificationSMS()
        {

            string msg = string.Empty;
            var currentMonthHolidays = await _offDayManager.GetMonthlyHolidaysAsync(DateTime.Now.ToString("MMyyyy"));
            if (currentMonthHolidays != null && currentMonthHolidays.Count > 0)
            {
                foreach (var holiday in currentMonthHolidays)
                {
                    if (holiday.ToString("ddMMyyyy") == DateTime.Now.ToString("ddMMyyyy"))
                    {
                        msg = "Today is offday";
                        return BadRequest(msg);
                    }
                }
            }

            DateTime tDate = DateTime.Today;
            var allCheckInAttendance = await _attendanceMachineManager.GetCheckinDataByDateAsync(tDate.ToString("dd-MM-yyyy"));
            
            if (allCheckInAttendance != null && allCheckInAttendance.Count > 10)
            {
                SetupMobileSMS setupMobileSMS = await _setupMobileSMSManager.GetByIdAsync(1);
                if (setupMobileSMS.AbsentNotification == true)
                {
                    if (setupMobileSMS.AbsentNotificationStudent==true)
                    {
                        await AbsentStudentSendSMS();
                    }
                    if (setupMobileSMS.AbsentNotificationEmployee == true)
                    {
                        await AbsentEmployeeSendSMS();
                    }
                }
            }
            return Ok(msg);
        }

        private async Task<IActionResult> AbsentStudentSendSMS()
        {
            string date = DateTime.Now.ToString("dd-MM-yyyy");
            List<Student> absentStudents = await _attendanceMachineManager.GetTodaysAbsentStudentAsync(date);
            List<Student> totalStudent = (List<Student>)await _studentManager.GetAllAsync();
            //if (absentStudents.Count>=Convert.ToInt32(totalStudent.Where(s => s.Status==true).Count/2))
            //{
            //    return null;
            //}
            if (absentStudents == null || absentStudents.Count <= 0)
            {
                return null;
            }
            else
            {
                try
                {
                    foreach (Student student in absentStudents)
                    {
                        if (student.Status == false)
                        {
                            continue;
                        }
                        string phoneNumber = student.GuardianPhone != null ? student.GuardianPhone : student.PhoneNo != null ? student.PhoneNo : string.Empty;

                        if (string.IsNullOrEmpty(phoneNumber))
                        {
                            continue;
                        }
                        string studentName = student.NameBangla != null ? student.NameBangla : student.Name != null ? student.Name : string.Empty;
                        string smsType = "absent";
                        bool isAlreadySMSSent = await _phoneSMSManager.IsSMSSendForAttendance(phoneNumber, smsType, date);
                        if (isAlreadySMSSent)
                        {
                            continue;
                        }
                        string smsText = GenerateAbsentNotificationText(studentName,"student", 1);
                        bool isSMSSent = await MobileSMS.SendSMS(phoneNumber, smsText);
                        if (isSMSSent)
                        {
                            PhoneSMS phoneSMS = new PhoneSMS()
                            {
                                Text = smsText,
                                CreatedAt = DateTime.Now,
                                CreatedBy = "Automation",
                                MobileNumber = phoneNumber,
                                MACAddress = MACService.GetMAC(),
                                SMSType = smsType
                            };
                            await _phoneSMSManager.AddAsync(phoneSMS);
                        }
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
            return Ok();
        }
        #endregion Absent Student Notification by SMS Finished here xxxxxxxxxxxxxxxxxxx
        
        #region Absent Employee Notification
        private async Task<IActionResult> AbsentEmployeeSendSMS()
        {
            string date = DateTime.Now.ToString("dd-MM-yyyy");
            List<Employee> absentEmployees = await _attendanceMachineManager.GetTodaysAbsentEmployeeAsync(date);
            if (absentEmployees==null || absentEmployees.Count<=0)
            {
                return null;
            }
            else
            {
                try
                {
                    foreach (var employee in absentEmployees)
                    {
                        if (employee.Status!=true)
                        {
                            continue;
                        }

                        string phoneNumber = employee.Phone;
                        if (string.IsNullOrEmpty(phoneNumber))
                        {
                            continue;
                        }
                        string employeeName = employee.EmployeeName;
                        if (string.IsNullOrEmpty(employeeName))
                        {
                            continue;
                        }
                        string smsType = "absent";
                        bool isAlreadySMSSent = await _phoneSMSManager.IsSMSSendForAttendance(phoneNumber, smsType, date);
                        if (isAlreadySMSSent)
                        {
                            continue;
                        }
                        string smsText = GenerateAbsentNotificationText(employeeName,"employee", 1);
                        bool isSMSSent = await MobileSMS.SendSMS(phoneNumber, smsText);
                        if (isSMSSent)
                        {
                            PhoneSMS phoneSMS = new PhoneSMS()
                            {
                                Text = smsText,
                                CreatedAt = DateTime.Now,
                                CreatedBy = "Automation",
                                MobileNumber = phoneNumber,
                                MACAddress = MACService.GetMAC(),
                                SMSType = smsType
                            };
                            await _phoneSMSManager.AddAsync(phoneSMS);
                        }
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
            return Ok();
        }
        #endregion Absent Employee Notification

        #region SMS Generate Section Start Here ====================================
        private string GenerateCheckInSMSText(string name, string attendanceTime)
        {
            string msg = string.Empty;
            if (!string.IsNullOrEmpty(attendanceTime) && !string.IsNullOrEmpty(name))
            {
                try
                {
                    msg = name + " আজ " + attendanceTime + " মিনিটে স্কুলে উপস্থিত হয়েছে। -নোবেল ।";
                    var tLength = msg.Length;
                }
                catch (Exception)
                {

                    throw;
                }
            }
            return msg;
        }
        private string GenerateCheckOutSMSText(string name, string attendanceTime)
        {
            string msg = string.Empty;
            if (!string.IsNullOrEmpty(attendanceTime) && !string.IsNullOrEmpty(name))
            {
                try
                {
                    msg = name + " স্কুল থেকে " + attendanceTime + " মিনিটে প্রস্থান করেছে। -নোবেল ।";
                }
                catch (Exception)
                {

                    throw;
                }
            }
            return msg;
        }

        private string GenerateAbsentNotificationText(string name, string smsFor, int absentDayCount)
        {
            string msg = string.Empty;
            if (absentDayCount == 1)
            {
                string dateTime = DateTime.Now.ToString("dd MMM yyyy");
                if (smsFor=="employee")
                {
                    msg = name+" is not in school today.";
                }
                else
                {
                    msg = name + " আজ (" + dateTime + ") স্কুলে আসেনি । -নোবেল।";
                }
            }
            if (absentDayCount > 1)
            {
                msg = name + "গত " + absentDayCount + " দিন থেকে স্কুলে আসছে না । -নোবেল।";
            }

            return msg;
        }
        #endregion SMS Generate Section Finished Here XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

        private bool PhoneNumberValidate(string phoneNumber)
        {
            long pNumber = Convert.ToInt64(phoneNumber.Trim());
            if (pNumber >= 01300000000 && pNumber <= 01999999999)
            {
                return true;
            }
            return false;
        }

        #region Income SMS===========================================================
        #region Daily Student Collection ============================================
       
        public async Task<IActionResult> SendDailyCollectionSMS()
        {
            var currentMonthHolidays = await _offDayManager.GetMonthlyHolidaysAsync(DateTime.Now.ToString("MMyyyy"));
            if (currentMonthHolidays != null && currentMonthHolidays.Count > 0)
            {
                foreach (var holiday in currentMonthHolidays)
                {
                    if (holiday.ToString("ddMMyyyy") == DateTime.Now.ToString("ddMMyyyy"))
                    {
                        return BadRequest("Today is offday");
                    }
                }
            }

            SetupMobileSMS setupMobileSMS = await _setupMobileSMSManager.GetByIdAsync(1);
            if (setupMobileSMS.DailyCollectionSMSService == false)
            {
                return BadRequest();
            }
            try
            {

                if (setupMobileSMS.DailyCollectionSMSService)
                {
                    var paymentsSummery = await _studentPaymentManager.GetStudentPaymentSummerySMS_VMsAsync(DateTime.Today);
                    if (paymentsSummery != null)
                    {
                        StudentPaymentSummerySMS_VM studentPaymentSummerySMS_VM = paymentsSummery.FirstOrDefault();
                        var instituteInfo = await _instituteManager.GetAllAsync();

                        string[] phoneNumber = { "01717678134",instituteInfo.FirstOrDefault().Phone1 };
                        string smsType = "Collection_sum";
                        string smsText = $"Payment Collection ({DateTime.Today.ToString("dd MMM yyyy")}):\n" +
                            $"Residential: {studentPaymentSummerySMS_VM.ResidentialPayment}\n" +
                            $"Non-Residential:{studentPaymentSummerySMS_VM.NonResidentialPayment} \n" +
                            $"Total = {studentPaymentSummerySMS_VM.ResidentialPayment + studentPaymentSummerySMS_VM.NonResidentialPayment}\n" +
                            $"-"+instituteInfo.FirstOrDefault().Name;

                        foreach (var num in phoneNumber)
                        {
                            bool isAlreadySent = await _phoneSMSManager.IsSMSSendForAttendance(num, smsType, DateTime.Today.ToString("dd-MM-yyyy"));
                            if (!isAlreadySent)
                            {
                                bool isSend = await MobileSMS.SendSMS(num, smsText);
                                if (isSend)
                                {
                                    PhoneSMS phoneSMS = new()
                                    {
                                        Text = smsText,
                                        CreatedAt = DateTime.Now,
                                        CreatedBy = "Automation",
                                        MobileNumber = num,
                                        MACAddress = MACService.GetMAC(),
                                        SMSType = smsType
                                    };
                                    await _phoneSMSManager.AddAsync(phoneSMS);
                                }
                            }
                        }

                    }
                }

            }
            catch (Exception)
            {

                throw;
            }
            
            return null;
        }
        #endregion Daily Student Collection XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        #endregion Income SMS XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

        #region Expense SMS =========================================================
        #endregion Expense SMS XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    }
}