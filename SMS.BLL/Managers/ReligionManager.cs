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
    public class ReligionManager : Manager<Religion>, IReligionManager
    {
        public ReligionManager(IReligionRepository religionRepository) : base(religionRepository)
        {

        }
    }
}
