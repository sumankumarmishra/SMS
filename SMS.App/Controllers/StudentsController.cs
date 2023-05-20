﻿using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NodaTime;
using SMS.App.Utilities.MACIPServices;
using SMS.App.Utilities.Pagination;
using SMS.App.Utilities.ShortMessageService;
using SMS.App.ViewModels;
using SMS.App.ViewModels.Students;
using SMS.BLL.Contracts;
using SMS.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace SchoolManagementSystem.Controllers
{
    [Authorize]
    public class StudentsController : Controller
    {
        #region Initialization
        private readonly IWebHostEnvironment _host;
        private readonly IStudentManager _studentManager;
        private readonly IAcademicClassManager _academicClassManager;
        private readonly IMapper _mapper;
        private readonly IAcademicSessionManager _academicSessionManager;
        private readonly IStudentPaymentManager _studentPaymentManager;
        private readonly IDivisionManager _divisionManager;
        private readonly IDistrictManager _districtManager;
        private readonly IUpazilaManager _upazilaManager;
        private readonly IAcademicSectionManager _academicSectionManager;
        private readonly IBloodGroupManager _bloodGroupManager;
        private readonly INationalityManager _nationalityManager;
        private readonly IGenderManager _genderManager;
        private readonly IReligionManager _religionManager;
        private readonly IStudentFeeHeadManager _studentFeeHeadManager;
        private readonly IClassFeeListManager _classFeeListManager;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IPhoneSMSManager _phoneSMSManager;
        private readonly IAttendanceMachineManager _attendanceMachineManager;
        private readonly IInstituteManager _instituteManager;
        private readonly IStudentActivateHistManager _studentActivateHistManager;
        #endregion

        #region Constructor
        public StudentsController(IStudentManager studentManager, IAcademicClassManager academicClassManager, IWebHostEnvironment host, IMapper mapper, IAcademicSessionManager academicSessionManager, IStudentPaymentManager studentPaymentManager, IDistrictManager districtManager, IUpazilaManager upazilaManager, IAcademicSectionManager academicSectionManager, IBloodGroupManager bloodGroupManager, IDivisionManager divisionManager, INationalityManager nationalityManager, IGenderManager genderManager, IReligionManager religionManager, IStudentFeeHeadManager studentFeeHeadManager, IClassFeeListManager classFeeListManager, UserManager<ApplicationUser> userManager, IPhoneSMSManager phoneSMSManager, IAttendanceMachineManager attendanceMachineManager, IInstituteManager instituteManager, IStudentActivateHistManager studentActivateHistManager)
        {
            _academicClassManager = academicClassManager;
            _host = host;
            _studentManager = studentManager;
            _academicSessionManager = academicSessionManager;
            _mapper = mapper;
            _studentPaymentManager = studentPaymentManager;
            _districtManager = districtManager;
            _upazilaManager = upazilaManager;
            _academicSectionManager = academicSectionManager;
            _bloodGroupManager = bloodGroupManager;
            _divisionManager = divisionManager;
            _nationalityManager = nationalityManager;
            _genderManager = genderManager;
            _religionManager = religionManager;
            _studentFeeHeadManager = studentFeeHeadManager;
            _classFeeListManager = classFeeListManager;
            _userManager = userManager;
            _phoneSMSManager = phoneSMSManager;
            _attendanceMachineManager = attendanceMachineManager;
            _instituteManager = instituteManager;
            _studentActivateHistManager = studentActivateHistManager;
        }
        #endregion

        #region Index
        [Authorize(Roles = "SuperAdmin, Admin,Teacher")]
        public async Task<IActionResult> Index(int? academicSessionid, int? academicClassId,int?academicSectionId, string aStatus, string sortOrder, string searchString, int? pageNumber, int? pageSize)
        {
            ViewData["rollSortParam"] = String.IsNullOrEmpty(sortOrder) ? "roll_desc" : "";
            ViewData["academicClassSortParam"] = sortOrder == "academicClass" ? "class_desc" : "academicClass";
            ViewData["CurrentFilter"] = searchString;
            ViewData["academicClassId"] = academicClassId;

            var students = await _studentManager.GetCurrentStudentListAsync(academicClassId,academicSectionId);
            
            if (!String.IsNullOrEmpty(searchString))
            {
                students = students.Where(s => s.StudentName.Contains(searchString) || s.PhoneNo.Contains(searchString)).ToList();
            }


            if (aStatus == "0" || aStatus == "1")
            {
                bool isActive = aStatus == "1" ? true : false;
                students = students.Where(s => s.Status == isActive).ToList();
            }
            int totalFound = ViewBag.totalFound = students.Count();            

            List<IsActiveVM> isActiveVMs = new List<IsActiveVM>();
            IsActiveVM status1 = new IsActiveVM();
            status1.Id = 0;
            status1.sName = "Inactive";
            isActiveVMs.Add(status1);

            IsActiveVM status2 = new IsActiveVM();
            status2.Id = 1;
            status2.sName = "Active";
            isActiveVMs.Add(status2);

            IsActiveVM status3 = new IsActiveVM();
            status3.Id = 2;
            status3.sName = "All";
            isActiveVMs.Add(status3);

            switch(sortOrder)
            {
                case "roll_desc":
                    students = students.OrderByDescending(s => s.ClassRoll).ToList();
                    break;
                case "academicClass":
                    students = students.OrderBy(s => s.ClassSerial).ToList();
                    break;
                case "class_desc":
                    students = students.OrderByDescending(s => s.ClassSerial).ToList();
                    break;
                default:
                    students = students.OrderBy(s => s.ClassRoll).ToList();
                    break;
            }

            var sectionList = await _academicSectionManager.GetAllAsync();
            ViewBag.academicSessionId = new SelectList(await _academicSessionManager.GetAllAsync(), "Id", "Name",academicSessionid);
            ViewBag.academicClassId = new SelectList(await _academicClassManager.GetAllAsync(), "Id", "Name",academicClassId);

            ViewBag.academicSectionId = new SelectList(sectionList.Where(s => s.AcademicClassId==academicClassId), "Id", "Name", academicSectionId);
            ViewBag.aStatus = new SelectList(isActiveVMs.ToList(), "Id", "sName", aStatus);
            
            int pSize = 30;
            if (pageSize!=null)
            {
                if (pageSize>0)
                {
                    pSize = (int)pageSize;
                }
                else
                {
                    pSize = totalFound;
                }
            }

            ViewData["pageSize"] = pageSize > 0?pageSize:pSize ;
            return View(PaginatedList<SMS.Entities.AdditionalModels.StudentListVM>.Create(students, pageNumber ?? 1, pSize));
        }
        #endregion

        #region Details
        // GET: Students/Details/5
        [Authorize,AllowAnonymous]
        public async Task<IActionResult> Details(int? id)
        {            
            if (id == null)
            {
                return NotFound();
            }

            var user = await _userManager.GetUserAsync(User);
            if (user.UserType == 's')
            {
                if (user.ReferenceId != id)
                {
                    return RedirectToAction("AccessDenied", "Accounts");
                }
            }

            var student =await _studentManager.GetByIdAsync((int)id);
            if (student == null)
            {
                return NotFound();
            }
            var stuPayments = await _studentPaymentManager.GetAllByStudentIdAsync((int)id);

            StudentDetailsVM sd = new();
            sd.StudentPayments = stuPayments;
            sd.Student = student;
             
            sd.TotalDue = await GetTotalDue(student.ClassRoll);
            sd.CurrentDue = await GetCurrntDue(student.ClassRoll);
            ViewBag.districts = await _districtManager.GetAllAsync();
            ViewBag.Upazila = await _upazilaManager.GetAllAsync();

            return View(sd);
        }
        #endregion

        #region Create
        [Authorize(Roles = "SuperAdmin, Admin")]
        public async Task<IActionResult> Create()
        {
            StudentCreateVM student = new();
            student.AcademicSessionList = new SelectList(await _academicSessionManager.GetAllAsync(), "Id", "Name").ToList();
            student.AcademicClassList = new SelectList(await _academicClassManager.GetAllAsync(), "Id", "Name").ToList();
            student.BloodGroupList = new SelectList(await _bloodGroupManager.GetAllAsync(), "Id", "Name").ToList();
            student.GenderList = new SelectList(await _genderManager.GetAllAsync(), "Id", "Name").ToList();
            student.NationalityList = new SelectList(await _nationalityManager.GetAllAsync(), "Id", "Name").ToList();
            student.ReligionList = new SelectList(await _religionManager.GetAllAsync(), "Id", "Name").ToList();
            student.DivisionList = new SelectList(await _divisionManager.GetAllAsync(), "Id", "Name").ToList();

            return View(student);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "SuperAdmin, Admin")]
        public async Task<IActionResult> Create([Bind("Id,Name,NameBangla,ClassRoll,FatherName,MotherName,AdmissionDate,Email,PhoneNo,Photo,DOB,BirthCertificateNo,BirthCertificateImage,ReligionId,GenderId,BloodGroupId,NationalityId,PresentAddressArea,PresentAddressPO,PresentUpazilaId,PresentDistrictId,PresentDivisionId,PermanentAddressArea,PermanentAddressPO,PermanentUpazilaId,PermanentDistrictId,PermanentDivisionId,AcademicSessionId,AcademicClassId,AcademicSectionId,AddressInfo,PreviousSchool,Status,CreatedBy,CreatedAt,EditedBy,EditedAt,GuardianPhone,MACAddress")] StudentCreateVM newStudent, IFormFile sPhoto, IFormFile DOBFile)
        {
            newStudent.ClassRoll = await CreateRoll(newStudent.AcademicSessionId, newStudent.AcademicClassId, newStudent.ClassRoll);
            var rollIsExist = await _studentManager.GetStudentByClassRollAsync(newStudent.ClassRoll);
            if (rollIsExist == null)
            {
                if (ModelState.IsValid)
                {
                    if (sPhoto != null)
                    {
                        string fileExt = Path.GetExtension(sPhoto.FileName);
                        string root = _host.WebRootPath;
                        string folder = "Images/Student/";
                        string sessionYear = (await _academicSessionManager.GetByIdAsync(newStudent.AcademicSessionId)).ToString();
                        string year = sessionYear.Substring(0, 4);
                        string fileName = "S_" + year + "_" + newStudent.ClassRoll + fileExt;
                        string pathCombine = Path.Combine(root, folder, fileName);
                        using (var stream = new FileStream(pathCombine, FileMode.Create))
                        {
                            await sPhoto.CopyToAsync(stream);
                        }
                        newStudent.Photo = fileName;
                    }
                    if (DOBFile != null)
                    {
                        string fileExt = Path.GetExtension(DOBFile.FileName);
                        string root = _host.WebRootPath;
                        string folder = "Images/Student/";
                        string fileName = "S_" + newStudent.DOB.ToString("ddMMyyyy") + "_" + newStudent.ClassRoll + fileExt;
                        string pathCombine = Path.Combine(root, folder, fileName);
                        using (var stream = new FileStream(pathCombine, FileMode.Create))
                        {
                            await sPhoto.CopyToAsync(stream);
                        }
                        newStudent.BirthCertificateImage = fileName;
                    }
                    newStudent.CreatedBy = HttpContext.Session.GetString("UserId");
                    newStudent.CreatedAt = DateTime.Now;
                    

                    var student = _mapper.Map<Student>(newStudent);
                    bool saveStudent = await _studentManager.AddAsync(student);
                    if (saveStudent == true)
                    {
                        StudentActivateHist studentActivateHist = new() {
                            StudentId = student.Id,
                            IsActive = true,
                            ActionDateTime = DateTime.Now,
                            LastAction = "Add",
                            CreatedAt = DateTime.Now,
                            CreatedBy = HttpContext.Session.GetString("UserId"),
                            MACAddress = MACService.GetMAC()
                        };
                        await _studentActivateHistManager.AddAsync(studentActivateHist);

                        TempData["create"] = "Created Successfully";
                        ApplicationUser newStudentUser = new() {
                            UserName = student.ClassRoll.ToString(),
                            Email = student.Email,
                            EmailConfirmed = true,
                            PhoneNumberConfirmed = true,
                            PhoneNumber = student.PhoneNo,
                            NormalizedUserName = student.Name,
                            UserType = 's',
                            ReferenceId = student.Id                            
                        };

                        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                        var random = new Random();
                        string autoGeneratedPassword = new string(Enumerable.Repeat(chars, 6).Select(s => s[random.Next(s.Length)]).ToArray());

                        var result = await _userManager.CreateAsync(newStudentUser, autoGeneratedPassword);
                        if (result.Succeeded)
                        {
                            ApplicationUser user = await _userManager.FindByNameAsync(student.ClassRoll.ToString());
                            var roleAssignResult = await _userManager.AddToRoleAsync(user, "Student");
                            if (roleAssignResult.Succeeded)
                            {
                                string text = "Dear,\n" + student.Name + ",\nYour User: " + user.UserName + "\nPassword:" + autoGeneratedPassword + "\n-Noble Residential School";
                                bool smsSend = await MobileSMS.SendSMS(student.PhoneNo, text);
                                if (smsSend == true)
                                {
                                    PhoneSMS phoneSMS = new() { 
                                        Text = text, 
                                        CreatedAt = DateTime.Now, 
                                        CreatedBy = student.Email, 
                                        MobileNumber = student.PhoneNo,
                                        MACAddress = MACService.GetMAC(),
                                        SMSType = "NewUser"
                                    };
                                    await _phoneSMSManager.AddAsync(phoneSMS);
                                }

                                if (newStudent.Email != null)
                                {

                                }
                            }
                        }
                        return RedirectToAction(nameof(Index));
                    }
                }
            }
            else
            {
                ViewBag.msg = "Roll number is already exist";
            }
            newStudent.AcademicSessionList = new SelectList(await _academicSessionManager.GetAllAsync(), "Id", "Name",newStudent.AcademicSessionId).ToList();
            newStudent.AcademicClassList = new SelectList(await _academicClassManager.GetAllAsync(), "Id", "Name",newStudent.AcademicClassId).ToList();
            newStudent.BloodGroupList = new SelectList(await _bloodGroupManager.GetAllAsync(), "Id", "Name", newStudent.BloodGroupId).ToList();
            newStudent.GenderList = new SelectList(await _genderManager.GetAllAsync(), "Id", "Name",newStudent.GenderId).ToList();
            newStudent.NationalityList = new SelectList(await _nationalityManager.GetAllAsync(), "Id", "Name",newStudent.NationalityId).ToList();
            newStudent.ReligionList = new SelectList(await _religionManager.GetAllAsync(), "Id", "Name",newStudent.ReligionId).ToList();
            newStudent.DivisionList = new SelectList(await _divisionManager.GetAllAsync(), "Id", "Name").ToList();



            return View(newStudent);
        }
        #endregion

        #region Edit
        [HttpGet]
        [Authorize(Roles = "SuperAdmin, Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var student = await _studentManager.GetByIdAsync((int)id);
            if (student == null)
            {
                return NotFound();
            }
            List<AcademicSection> academicSections = (List<AcademicSection>)await _academicSectionManager.GetAllAsync();

            var newStudent = _mapper.Map<StudentEditVM>(student);
            newStudent.AcademicSessionList = new SelectList(await _academicSessionManager.GetAllAsync(), "Id", "Name", newStudent.AcademicSessionId).ToList();
            newStudent.AcademicClassList = new SelectList(await _academicClassManager.GetAllAsync(), "Id", "Name", newStudent.AcademicClassId).ToList();

            newStudent.AcademicSectionList = new SelectList(academicSections.Where(m => m.AcademicClassId==student.AcademicClassId), "Id", "Name", newStudent.AcademicSectionId).ToList();
            newStudent.BloodGroupList = new SelectList(await _bloodGroupManager.GetAllAsync(), "Id", "Name", newStudent.BloodGroupId).ToList();
            newStudent.GenderList = new SelectList(await _genderManager.GetAllAsync(), "Id", "Name", newStudent.GenderId).ToList();
            newStudent.NationalityList = new SelectList(await _nationalityManager.GetAllAsync(), "Id", "Name", newStudent.NationalityId).ToList();
            newStudent.ReligionList = new SelectList(await _religionManager.GetAllAsync(), "Id", "Name", newStudent.ReligionId).ToList();
            newStudent.PresentDivisionList = new SelectList(await _divisionManager.GetAllAsync(), "Id", "Name", newStudent.PresentDivisionId).ToList();
            newStudent.PermanentDivisionList = new SelectList(await _divisionManager.GetAllAsync(), "Id", "Name", newStudent.PermanentDivisionId).ToList();
            ViewData["DistrictList"] = new SelectList(await _districtManager.GetAllAsync(), "Id", "Name", newStudent.PresentDistrictId);
            ViewData["UpazilaList"] = new SelectList(await _upazilaManager.GetAllAsync(), "Id", "Name", newStudent.PresentDistrictId);
            
            return View(newStudent);
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "SuperAdmin, Admin")]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,NameBangla,ClassRoll,FatherName,MotherName,AdmissionDate,Email,PhoneNo,Photo,DOB,BirthCertificateNo,BirthCertificateImage,ReligionId,GenderId,BloodGroupId,NationalityId,PresentAddressArea,PresentAddressPO,PresentUpazilaId,PresentDistrictId,PresentDivisionId,PermanentAddressArea,PermanentAddressPO,PermanentUpazilaId,PermanentDistrictId,PermanentDivisionId,AcademicSessionId,AcademicClassId,AcademicSectionId,AddressInfo,PreviousSchool,CreatedBy,CreatedAt,EditedBy,EditedAt,GuardianPhone,Status,MACAddress")] Student student, IFormFile sPhoto, IFormFile DOBFile)
        {
            if (id != student.Id)
            {
                return NotFound();
            }
            var rollIsExist = await _studentManager.GetStudentByClassRollAsync(id, student.ClassRoll);
            if (rollIsExist ==null)
             {

                if (ModelState.IsValid)
                {
                    bool isUpdated = false;
                    try
                    {
                        if (sPhoto != null)
                        {
                            string fileExt = Path.GetExtension(sPhoto.FileName);
                            string root = _host.WebRootPath;
                            string folder = "Images/Student/";
                            string sessionYear = (await _academicSessionManager.GetByIdAsync(student.AcademicSessionId)).ToString();
                            string year = sessionYear.Substring(0, 4);
                            string fileName = "S_" + year + "_" + student.ClassRoll + fileExt;
                            string pathCombine = Path.Combine(root, folder, fileName);
                            using (var stream = new FileStream(pathCombine, FileMode.Create))
                            {
                                await sPhoto.CopyToAsync(stream);
                            }
                            student.Photo = fileName;
                        }
                        if (DOBFile != null)
                        {
                            string fileExt = Path.GetExtension(DOBFile.FileName);
                            string root = _host.WebRootPath;
                            string folder = "Images/Student/";
                            string fileName = "S_" + student.DOB.ToString("ddMMyyyy") + "_" + student.ClassRoll + fileExt;
                            string pathCombine = Path.Combine(root, folder, fileName);
                            using (var stream = new FileStream(pathCombine, FileMode.Create))
                            {
                                await sPhoto.CopyToAsync(stream);
                            }
                            student.BirthCertificateImage = fileName;
                        }

                        student.EditedBy = HttpContext.Session.GetString("UserId");
                        student.EditedAt = DateTime.Now;
                        student.MACAddress = MACService.GetMAC();

                        isUpdated = await _studentManager.UpdateAsync(student);
                        if (isUpdated ==true)
                        {
                            TempData["edit"] = "Updated Successfully";
                            return RedirectToAction(nameof(Index));
                        }
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        if (!StudentExists(student.Id))
                        {
                            return NotFound();
                        }
                        else
                        {
                            throw;
                        }
                    }
                }
            }
            else
            {
                ViewBag.msg = "Roll Number is already exist";
            }
            var exitStudent = _mapper.Map<StudentEditVM>(student);
            exitStudent.AcademicSessionList = new SelectList(await _academicSessionManager.GetAllAsync(), "Id", "Name", exitStudent.AcademicSessionId).ToList();
            exitStudent.AcademicClassList = new SelectList(await _academicClassManager.GetAllAsync(), "Id", "Name", exitStudent.AcademicClassId).ToList();
            exitStudent.AcademicSectionList = new SelectList(await _academicSectionManager.GetAllAsync(), "Id", "Name", exitStudent.AcademicSectionId).ToList();
            exitStudent.BloodGroupList = new SelectList(await _bloodGroupManager.GetAllAsync(), "Id", "Name", exitStudent.BloodGroupId).ToList();
            exitStudent.GenderList = new SelectList(await _genderManager.GetAllAsync(), "Id", "Name", exitStudent.GenderId).ToList();
            exitStudent.NationalityList = new SelectList(await _nationalityManager.GetAllAsync(), "Id", "Name", exitStudent.NationalityId).ToList();
            exitStudent.ReligionList = new SelectList(await _religionManager.GetAllAsync(), "Id", "Name", exitStudent.ReligionId).ToList();
            exitStudent.PresentDivisionList = new SelectList(await _divisionManager.GetAllAsync(), "Id", "Name", exitStudent.PresentDivisionId).ToList();
            exitStudent.PermanentDivisionList = new SelectList(await _divisionManager.GetAllAsync(), "Id", "Name", exitStudent.PermanentDivisionId).ToList();
            ViewData["UpazilaList"] = new SelectList(await _upazilaManager.GetAllAsync(), "Id", "Name", exitStudent.PresentDistrictId);

            return View(exitStudent);
        }
        #endregion

        #region Delete
        [Authorize(Roles = "SuperAdmin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            int myId = (int)(id);
            var student = await _studentManager.GetByIdAsync(myId);

            if (student == null)
            {
                return NotFound();
            }

            return View(student);
        }


        [Authorize(Roles = "SuperAdmin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var student = await _studentManager.GetByIdAsync(id);
            bool isSaved = await _studentManager.RemoveAsync(student);
            if (isSaved==true)
            {
                TempData["delete"] = "Deleted Successfully.";
                return RedirectToAction(nameof(Index));
            }
            else
            {
                return RedirectToAction("Delete", new { id });
            }
            
        }
        #endregion

        #region Profile
        [Authorize, AllowAnonymous]
        public async Task<IActionResult> Profile(int id)
        {


            var user = await _userManager.GetUserAsync(User);
            if (user.UserType == 's')
            {
                if (user.ReferenceId != id)
                {
                    return RedirectToAction("AccessDenied", "Accounts");
                }
            }
            var student = await _studentManager.GetByIdAsync(id);
            if (student.Status == true)
            {
                var attendance = await _attendanceMachineManager.GetTodaysAttendanceByUserIdAsync(student.ClassRoll);
                if (attendance == null)
                {
                    ViewBag.absent = "You are absent today";
                }
                else
                {
                    var instituteInfo = await _instituteManager.GetFirstOrDefaultAsync();
                    
                    DateTime schoolLateTime = Convert.ToDateTime(instituteInfo.LateTime);
                    if (attendance.PunchDatetime.Hour > schoolLateTime.Hour)
                    {
                        ViewBag.lateAttendance = "You are late today ( "+attendance.PunchDatetime.ToString("hh:mm tt")+")";
                    }
                    else
                    {
                        ViewBag.attendance = "You are attended ("+ attendance.PunchDatetime.ToString("hh:mm tt") + ") today";
                    }
                }
                
            }
            else
            {
                ViewBag.activeStatus = "You are not an active student.";
            }
            return View(student);
        }
        #endregion

        private bool StudentExists(int id)
        {
            var student = _studentManager.GetByIdAsync(id);
            if (student!=null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public async Task<double> DueAmount(int id)
        {
            Student student = await _studentManager.GetByIdAsync(id);

            LocalDate start = new LocalDate(student.AdmissionDate.Year, student.AdmissionDate.Month, student.AdmissionDate.Day);
            LocalDate end = new LocalDate(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            Period period = Period.Between(start, end);
            double months = period.Months;

            var allFee = await _classFeeListManager.GetAllByClassIdAsync(student.AcademicClassId);

            return months;
        }
        private async Task<int> CreateRoll(int sessionId, int ClassId, int providedRoll)
        {
            var admissionSession = await _academicSessionManager.GetByIdAsync(sessionId);
            var admissionClass = await _academicClassManager.GetByIdAsync(ClassId);
            //var totalStudent = await _studentManager.GetStudentsByClassIdAndSessionIdAsync(sessionId, ClassId);
            string year = admissionSession.Name.Substring(admissionSession.Name.Length - 2);
            string aClass = admissionClass.ClassSerial.ToString("d2");
            //string stuCount = (totalStudent.Count+1).ToString("d3");
            string cRoll = providedRoll.ToString("d3");
            int roll = Convert.ToInt32(year+aClass+cRoll);
            return roll;
        }

        public async Task<IActionResult> StudentReport()
        {
            var students = await _studentManager.GetAllAsync();
            
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ChangeStatus(int studentId, string operationDate, bool studentStatus)
        {
            bool existingStatus = await _studentActivateHistManager.IsStudentActive(studentId, operationDate);
            if (existingStatus != studentStatus)
            {
                bool isStudentUpdated = false;
                bool isStatusAdded = false;
                string activeStatus = studentStatus == true ? "Active" : "Inactive";
                Student existingStudent = await _studentManager.GetByIdAsync(studentId);
                if (existingStudent != null)
                {
                    if (existingStudent.AdmissionDate.Date <= Convert.ToDateTime(operationDate).Date)
                    {
                        
                        existingStudent.Status = studentStatus;
                        existingStudent.EditedBy = HttpContext.Session.GetString("UserId");
                        existingStudent.EditedAt = DateTime.Now;
                        existingStudent.MACAddress = MACService.GetMAC();
                        isStudentUpdated = await _studentManager.UpdateAsync(existingStudent);
                    }
                }
                else
                {
                    ViewBag.msg = "Falied to update";
                }
                if (isStudentUpdated)
                {
                    StudentActivateHist studentActivateHist = new StudentActivateHist();
                    studentActivateHist.StudentId = studentId;
                    studentActivateHist.IsActive = studentStatus;
                    studentActivateHist.ActionDateTime = Convert.ToDateTime(operationDate);
                    studentActivateHist.CreatedBy = HttpContext.Session.GetString("UserId");
                    studentActivateHist.CreatedAt = DateTime.Now;
                    studentActivateHist.MACAddress = MACService.GetMAC();
                    studentActivateHist.LastAction = "Add";

                    isStatusAdded = await _studentActivateHistManager.AddAsync(studentActivateHist);

                    if (isStatusAdded)
                    {
                        TempData["edit"] = "Updated Successfully";
                        ViewBag.msg = existingStudent.Name + " is " + activeStatus + " now";
                    }
                }
            }
            else
            {
                TempData["edit"] = "Updated Successfully";
            }
            
            return RedirectToAction("Edit", new {id=studentId });        
        }

        public int StudentCount()
        {
            return 5;
        }

        private async Task<double> GetTotalDue(int stuRoll)
        {

            Student st = await _studentManager.GetStudentByClassRollAsync(stuRoll);
            int admissionYear = st.AdmissionDate.Year;
            int currentYear = DateTime.Now.Year;

            int admissionMonth =admissionYear<currentYear?1:st.AdmissionDate.Month;
            double monthlyFee =await GetFeeAsync(st.AcademicClassId,1); //1=monthlyfee, 2=admissionFee, 3=ExamFee
            double admissionFee = await GetFeeAsync(st.AcademicClassId, 2); //1=monthlyfee, 2=admissionFee, 3=ExamFee
            double totalAmount = ((12 - (admissionMonth-1)) * monthlyFee) + admissionFee;
            double totalPaid =await GetTotalPaid(st.Id);
            double totalDue = totalAmount - totalPaid;
            totalDue = totalDue >= 0 ? totalDue : 0;
            return totalDue;
        }
        
        private async Task<double> GetCurrntDue(int stuRoll)
        {
            Student st = await _studentManager.GetStudentByClassRollAsync(stuRoll);
            int admissionYear = st.AdmissionDate.Year;
            int currentYear = DateTime.Now.Year;

            int admissionMonth = admissionYear < currentYear ? 1 : st.AdmissionDate.Month;
            double monthlyFee = await GetFeeAsync(st.AcademicClassId, 1); //1=monthlyfee, 2=admissionFee, 3=ExamFee
            double admissionFee = await GetFeeAsync(st.AcademicClassId, 2); //1=monthlyfee, 2=admissionFee, 3=ExamFee
            double totalAmount = ((DateTime.Now.Month - (admissionMonth - 1)) * monthlyFee) + admissionFee;
            double totalPaid = await GetTotalPaid(st.Id);
            double totalDue = totalAmount - totalPaid;
            return totalDue;
        }
        private async Task<double> GetFeeAsync(int aClassId, int feeHeadId)
        {
            ClassFeeList classFeeList =await _classFeeListManager.GetByClassIdAndFeeHeadIdAsync(aClassId, feeHeadId);
            if (classFeeList != null)
            {
                return classFeeList.Amount;
            }
            return 0;
        }
        private async Task<double> GetTotalPaid(int stuId)
        {
            List<StudentPayment> studentPayments = (List<StudentPayment>)await _studentPaymentManager.GetAllByStudentIdAsync(stuId);
            double paidAmount = studentPayments.Sum(s => s.TotalPayment);
            return paidAmount;
        }

        [Route("api/Students/getbyclasswithsessionId")]
        [HttpPost]
        public async Task<JsonResult> GetStudentsByClassSessionAsync(int academicClassId, int? academicSessionId)
        {
            try
            {

                if (academicSessionId==null)
                {
                    AcademicSession academicSession = await _academicSessionManager.GetCurrentAcademicSession();
                    academicSessionId = academicSession.Id;
                }
                var studentList = await _studentManager.GetStudentsByClassIdAndSessionIdAsync((int)academicSessionId, academicClassId);
                return Json(studentList);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}