﻿using SMS.DAL.Contracts.Base;
using SMS.Entities;
using SMS.Entities.AdditionalModels;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SMS.DAL.Contracts
{
    public interface IStudentPaymentRepository : IRepository<StudentPayment>
    {
        Task<IReadOnlyCollection<StudentPayment>> GetAllByStudentIdAsync(int id);
        Task<List<StudentPaymentSummeryVM>> GetPaymentSummeryByMonthYear(string monthYear);
        Task<List<StudentPaymentSummeryVM>> GetPaymentSummeryByDate(string date);
        Task<List<StudentPaymentScheduleVM>> GetStudentPaymentSchedule(int studId);
        Task<List<StudentPaymentSchedulePaidVM>> GetStudentPaymentSchedulePaid(int studId);
        Task<List<StudentPaymentSummerySMS_VM>> GetStudentPaymentSummerySMS_VMsAsync(DateTime date);
    }
}
