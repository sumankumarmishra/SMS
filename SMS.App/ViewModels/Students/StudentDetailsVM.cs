﻿using SMS.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SMS.App.ViewModels.Students
{
    public class StudentDetailsVM
    {
        public Student Student { get; set; }
        public IReadOnlyCollection<StudentPayment> StudentPayments { get; set; }
        public double TotalDue { get; set; }
        public double CurrentDue { get; set; }
    }
}