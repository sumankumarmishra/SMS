﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMS.Entities
{
    public class NotificationEvent:CommonProps
    {
        public string Name { get; set; }
        public bool Status { get; set; }
    }
}