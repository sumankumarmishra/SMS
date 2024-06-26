﻿using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SMS.DAL.Contracts;
using SMS.DAL.Repositories.Base;
using SMS.DB;
using SMS.Entities;
using SMS.Entities.AdditionalModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SMS.DAL.Repositories
{
    public class ClassFeeListRepository : Repository<ClassFeeList>, IClassFeeListRepository
    {
        public ClassFeeListRepository(ApplicationDbContext context) : base(context)
        {

        }
        public override async Task<IReadOnlyCollection<ClassFeeList>> GetAllAsync()
        {
            var feeLists = await _context
                .ClassFeeList
                .Include(cf => cf.AcademicClass)
                .Include(cf => cf.AcademicSession)
                .Include(cf => cf.StudentFeeHead)
                .ToListAsync();
            return feeLists;
        }
        public override async Task<ClassFeeList> GetByIdAsync(int id)
        {
            return await _context.ClassFeeList.Include(s => s.AcademicClass).Include(c => c.StudentFeeHead).FirstOrDefaultAsync(s => s.Id == id);
        }
        public async Task<List<ClassFeeList>> GetAllByClassIdAsync(int classId)
        {
            var result = await _context.ClassFeeList.Include(c => c.StudentFeeHead).Where(c => c.AcademicClassId == classId).ToListAsync();
            return result;
        }
        public async Task<ClassFeeList> GetByClassIdAndFeeHeadIdAsync(int classId, int feeHeadId, int sessionId)
        {
            var feeListExist = await _context.ClassFeeList
                .FirstOrDefaultAsync(s => s.AcademicClassId == classId && s.StudentFeeHeadId == feeHeadId && s.AcademicSessionId == sessionId);

            return feeListExist;
        }
        public async Task<List<ClassFeeList>> GetClassFeeListByClassIdFeeHeadIdSessionIdAsync(int classId, int feeHeadId, int sessionId)
        {
            List<ClassFeeList> results = new List<ClassFeeList>();
            try
            {
                results = await _context.ClassFeeList
                .Where(s => s.AcademicClassId == classId &&
                s.AcademicSessionId == sessionId &&
                s.StudentFeeHeadId == feeHeadId)
                .ToListAsync();
            }
            catch (Exception)
            {
                throw;
            }

            return results;
        }
        public async Task<double> GetFeeAmountByFeeListSL(string uniquId, int sl)
        {
            var feeAmountParam = new SqlParameter("@FeeAmount", SqlDbType.Float)
            {
                Direction = ParameterDirection.Output
            };

            await _context.Database.ExecuteSqlRawAsync(
                $"exec sp_get_amount_by_classFee_sl @uniqueId, @sl, @FeeAmount OUTPUT",
                new SqlParameter("@uniqueId", uniquId),
                new SqlParameter("@sl", sl),
                feeAmountParam);

            double feeAmount = Convert.ToDouble(feeAmountParam.Value);
            return feeAmount;
        }

        public async Task<List<ClassFeeList>> GetByClassIdSessionIdStudentIdAsync(int classId, int sessionId, int studentId)
        {
            List<ClassFeeList> results = new();
            try
            {
                results =await (from t in _context.ClassFeeList
                          join h in _context.StudentFeeHead on t.StudentFeeHeadId equals h.Id into joinFeedHead
                          from h in joinFeedHead.DefaultIfEmpty()
                          join s in _context.Student on t.AcademicClassId equals s.AcademicClassId
                          where s.Id == studentId && h.IsResidential == s.IsResidential && t.AcademicSessionId == s.AcademicSessionId
                          select t).ToListAsync();                          
            }
            catch (Exception)
            {
                throw;
            }
            return results;
        }
    }
}
