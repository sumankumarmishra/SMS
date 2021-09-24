﻿using BLL.Managers.Base;
using SMS.BLL.Contracts;
using SMS.DAL.Contracts;
using SMS.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMS.BLL.Managers
{
    public class ClassFeeListManager : Manager<ClassFeeList>, IClassFeeListManager
    {
        private readonly IClassFeeListRepository classFeeListRepository;
        public ClassFeeListManager(IClassFeeListRepository classFeeListRepository) :base(classFeeListRepository)
        {

        }

        public async Task<ClassFeeList> GetByClassIdAndFeeHeadIdAsync(int classId, int feeHeadId)
        {
            return await classFeeListRepository.GetByClassIdAndFeeHeadIdAsync(classId, feeHeadId);
        }
    }
}