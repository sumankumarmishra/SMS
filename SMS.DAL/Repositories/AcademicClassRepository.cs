﻿using SMS.Entities;
using SMS.DB;
using SMS.DAL.Repositories.Base;
using SMS.DAL.Contracts;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace SMS.DAL.Repositories
{
    public class AcademicClassRepository:Repository<AcademicClass>, IAcademicClassRepository
    {
        private readonly ApplicationDbContext _db;

        public AcademicClassRepository(ApplicationDbContext db):base(db)
        {
            _db = db;
        }


        public async Task<AcademicClass> GetByNameAsync(string entityName)
        {
            var aClass =await _db.AcademicClass.Where(ac => ac.Name.Trim() == entityName.Trim()).FirstOrDefaultAsync();
            return aClass;
        }
        public override async Task<IReadOnlyCollection<AcademicClass>> GetAllAsync()
        {
            var aClassList = await _db.AcademicClass
                .OrderBy(a => a.ClassSerial)
                .Include(s => s.Students)
                .Include(s => s.AcademicSubjects)
                .OrderBy(s => s.ClassSerial)
                .ToListAsync();
            return aClassList;
        }
    }
}
