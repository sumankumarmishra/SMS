﻿using Microsoft.EntityFrameworkCore;
using SMS.DAL.Contracts;
using SMS.DAL.Repositories.Base;
using SMS.DB;
using SMS.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMS.DAL.Repositories
{
    public class AcademicExamGroupRepository:Repository<AcademicExamGroup>, IAcademicExamGroupRepository
    {
        private readonly ApplicationDbContext _context;
        public AcademicExamGroupRepository(ApplicationDbContext context):base(context)
        {
            _context = context;
        }
        public override async Task<IReadOnlyCollection<AcademicExamGroup>> GetAllAsync()
        {
            var result = await _context.AcademicExamGroups.Include(s => s.AcademicSession).Include(s => s.academicExamType).ToListAsync();
            return result;
        }
    }
}