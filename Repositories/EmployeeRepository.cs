﻿using DatabaseContext;
using Microsoft.EntityFrameworkCore;
using Models;
using Repositories.Base;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Repositories
{

    public class EmployeeRepository : Repository<Employee>
    {

        private readonly ApplicationDbContext _context;


        public EmployeeRepository(ApplicationDbContext context):base(context)
        {
            _context = context;
        }
    }
}
