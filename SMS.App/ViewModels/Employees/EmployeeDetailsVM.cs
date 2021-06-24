﻿using SMS.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SMS.App.ViewModels.Employees
{
    public class EmployeeDetailsVM
    {
        public int Id { get; set; }

        [Display(Name = "Employee Name"), Required, StringLength(40)]
        public string EmployeeName { get; set; }

        [DataType(DataType.Date)]
        [Required, Display(Name = "Date of Birth")]
        public DateTime DOB { get; set; }

        public string Image { get; set; }

        [Display(Name = "Gender")]
        public int GenderId { get; set; }

        [Display(Name = "Religion")]
        public int ReligionId { get; set; }

        [Display(Name = "Nationality")]
        public int NationalityId { get; set; }

        [Display(Name = "National ID")]
        [Range(100000000, 999999999999999999)]
        public long NIDNo { get; set; }

        public string NIDCard { get; set; }

        [Range(01300000000, 01999999999)]
        public long Phone { get; set; }

        [EmailAddress]
        public string Email { get; set; }

        [Display(Name = "Nominee Name")]
        public string Nominee { get; set; }

        [Range(01300000000, 01999999999)]
        public long NomineePhone { get; set; }

        [Display(Name = "Employee Type")]
        public int EmpTypeId { get; set; }

        [Display(Name = "Designation Name")]
        public int DesignationId { get; set; }

        [DataType(DataType.Date)]
        [Display(Name = "Joining Date")]
        public DateTime JoiningDate { get; set; }

        [Display(Name = "Present Address")]
        public string PresentAddress { get; set; }

        [Display(Name = "Upazila")]
        public int PresentUpazilaId { get; set; }

        [Display(Name = "District")]
        public int PresentDistrictId { get; set; }

        [Display(Name = "Division")]
        public int PresentDivisionId { get; set; }

        [Display(Name = "Permanent Address")]
        public string PermanentAddress { get; set; }

        [Display(Name = "Upazila")]
        public int PermanentUpazilaId { get; set; }

        [Display(Name = "District")]
        public int PermanentDistrictId { get; set; }

        [Display(Name = "Division")]
        public int PermanentDivisionId { get; set; }

        public ICollection<AttachDoc> Documents { get; set; }

        [Display(Name = "Created By")]
        public string CreatedBy { get; set; }

        [Display(Name = "Created At")]
        public DateTime CreatedAt { get; set; }

        [Display(Name = "Updated By")]
        public string EditedBy { get; set; }

        [Display(Name = "Updated At")]
        public DateTime EditedAt { get; set; }

        [Display(Name = "Active/Inactive")]
        public bool Status { get; set; }

        [Display(Name = "Blood Group")]
        public int BloodGroupId { get; set; }
    }
}
