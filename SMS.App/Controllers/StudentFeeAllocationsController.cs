﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SMS.App.ViewModels.Students;
using SMS.BLL.Contracts;
using System.Data;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Rendering;
using SMS.Entities;
using System;
using SMS.App.Utilities.MACIPServices;

namespace SMS.App.Controllers
{
    [Authorize(Roles = "SuperAdmin, Admin")]
    public class StudentFeeAllocationsController : Controller
    {
        private readonly IStudentFeeAllocationManager _studentFeeAllocationManager;
        private readonly IStudentFeeHeadManager _studentFeeHeadManager;
        private readonly IAcademicClassManager _academicClassManager;
        public StudentFeeAllocationsController(IStudentFeeAllocationManager studentFeeAllocationManager, IStudentFeeHeadManager studentFeeHeadManager, IAcademicClassManager academicClassManager)
        {
            _studentFeeAllocationManager = studentFeeAllocationManager;
            _studentFeeHeadManager = studentFeeHeadManager;
            _academicClassManager = academicClassManager;

        }
        // GET: StudentFeeAllocationsController

        [Authorize(Policy = "IndexStudentFeeAllocationsPolicy")]
        public async Task<ActionResult> Index()
        {
            StudentFeeAllocationVM studentFeeAllocationVM = new StudentFeeAllocationVM();            
            studentFeeAllocationVM.StudentFeeAllocations = (System.Collections.Generic.List<Entities.StudentFeeAllocation>)await _studentFeeAllocationManager.GetAllAsync();
            studentFeeAllocationVM.FeeList = new SelectList(await _studentFeeHeadManager.GetAllAsync(), "Id", "Name");
            studentFeeAllocationVM.AcademicClassList = new SelectList(await _academicClassManager.GetAllAsync(), "Id", "Name");
            
            return View(studentFeeAllocationVM);
        }

        // GET: StudentFeeAllocationsController/Details/5
        [Authorize(Policy = "DetailsStudentFeeAllocationsPolicy")]
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: StudentFeeAllocationsController/Create
        [Authorize(Policy = "CreateStudentFeeAllocationsPolicy")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: StudentFeeAllocationsController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Policy = "CreateStudentFeeAllocationsPolicy")]
        public async Task<ActionResult> Create(StudentFeeAllocationVM studentFeeAllocationVM)
        {
            StudentFeeAllocation studentFeeAllocation = new StudentFeeAllocation();
            studentFeeAllocation = studentFeeAllocationVM.SFAllocation;
            if (ModelState.IsValid)
            {
                studentFeeAllocation.CreatedAt = DateTime.Now;
                studentFeeAllocation.CreatedBy = HttpContext.Session.GetString("UserId");
                studentFeeAllocation.MACAddress = MACService.GetMAC();
                try
                {
                    bool isSaved = await _studentFeeAllocationManager.AddAsync(studentFeeAllocation);
                    if (isSaved)
                    {
                        TempData["created"] = "New Fee allocation added successfully";
                    }
                }
                catch (Exception)
                {
                    throw;
                }
            }
         return RedirectToAction("Index");
           
        }

        // GET: StudentFeeAllocationsController/Edit/5
        [Authorize(Policy = "EditStudentFeeAllocationsPolicy")]
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: StudentFeeAllocationsController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Policy = "EditStudentFeeAllocationsPolicy")]
        public async Task<ActionResult> Edit(int id, StudentFeeAllocationVM studentFeeAllocationVM)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var existingAllocation = await _studentFeeAllocationManager.GetByIdAsync(studentFeeAllocationVM.SFAllocation.Id);
                    if (existingAllocation.Id != studentFeeAllocationVM.SFAllocation.Id)
                    {
                        TempData["error"] = "Data is miss matched";
                        return RedirectToAction("Index");
                    }
                    if (existingAllocation.StudentId == studentFeeAllocationVM.SFAllocation.StudentId && existingAllocation.IsActive == studentFeeAllocationVM.SFAllocation.IsActive && existingAllocation.AllocatedAmount == studentFeeAllocationVM.SFAllocation.AllocatedAmount && existingAllocation.StudentFeeHeadId == studentFeeAllocationVM.SFAllocation.StudentFeeHeadId )
                    {
                        TempData["error"] = "Nothing Change";
                    }
                    else
                    {
                        existingAllocation.EditedAt = DateTime.Now;
                        existingAllocation.EditedBy =  HttpContext.Session.GetString("UserId");
                        existingAllocation.MACAddress = MACService.GetMAC();
                        existingAllocation.StudentId = studentFeeAllocationVM.SFAllocation.StudentId;
                        existingAllocation.IsActive = studentFeeAllocationVM.SFAllocation.IsActive;
                        existingAllocation.AllocatedAmount = studentFeeAllocationVM.SFAllocation.AllocatedAmount;
                        existingAllocation.StudentFeeHeadId = studentFeeAllocationVM.SFAllocation.StudentFeeHeadId;
                        bool isUpdated = await _studentFeeAllocationManager.UpdateAsync(existingAllocation);
                        if (isUpdated)
                        {
                            TempData["updated"] = "Successfully updated";
                        }
                    }
                }
                catch
                {
                    return View();
                }
            }
            return RedirectToAction("index");
        }

        // GET: StudentFeeAllocationsController/Delete/5
        [Authorize(Policy = "DeleteStudentFeeAllocationsPolicy")]
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: StudentFeeAllocationsController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Policy = "DeleteStudentFeeAllocationsPolicy")]
        public async Task<ActionResult> Delete(int id, IFormCollection formCollection)
        {
            //StudentFeeAllocationId
            try
            {
                var existingAllocation = await _studentFeeAllocationManager.GetByIdAsync(Convert.ToInt32(formCollection["StudentFeeAllocationId"]));
                if (existingAllocation.Id != Convert.ToInt32(formCollection["StudentFeeAllocationId"]))
                {
                    TempData["error"] = "Data is miss matched";
                    return RedirectToAction("Index");
                }
                var isDeleted = await _studentFeeAllocationManager.RemoveAsync(existingAllocation);
                if (isDeleted)
                {
                    TempData["deleted"] = "Data Deleted successfully";
                }
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                TempData["error"] = "Exception Occured";
                return RedirectToAction("Index");
            }
        }
    }
}
