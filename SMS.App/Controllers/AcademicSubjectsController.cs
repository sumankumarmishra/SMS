﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using SMS.BLL.Contracts;
using SMS.DB;
using SMS.Entities;

namespace SMS.App.Controllers
{
    [Authorize(Roles = "SuperAdmin, Admin")]
    public class AcademicSubjectsController : Controller
    {
        private readonly IAcademicSubjectManager _academicSubjectManager;
        private readonly IAcademicSubjectTypeManager _academicSubjectTypeManager;
        private readonly ILogger<AcademicSubjectsController> logger;

        public AcademicSubjectsController(IAcademicSubjectManager academicSubjectManger, IAcademicSubjectTypeManager academicSubjectTypeManager, ILogger<AcademicSubjectsController> _Logger)
        {
            _academicSubjectManager = academicSubjectManger;
            _academicSubjectTypeManager = academicSubjectTypeManager;
            logger = _Logger;
        }

        // GET: AcademicSubjects
        public async Task<IActionResult> Index()
        {
            var academicSubject =await _academicSubjectManager.GetAllAsync();
            return View(academicSubject);
        }

        // GET: AcademicSubjects/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var academicSubject = await _academicSubjectManager.GetByIdAsync((int)id);
            if (academicSubject == null)
            {
                return NotFound();
            }

            return View(academicSubject);
        }

        // GET: AcademicSubjects/Create
        public async Task<IActionResult> Create()
        {
            ViewData["AcademicSubjectTypeId"] = new SelectList(await _academicSubjectTypeManager.GetAllAsync(), "Id", "SubjectTypeName");
            return View();
        }

        // POST: AcademicSubjects/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,SubjectName,AcademicSubjectTypeId,SubjectCode,SubjectFor,TotalMarks,Status,CreatedBy,CreatedAt,EditedBy,EditedAt")] AcademicSubject academicSubject)
        {
            if (ModelState.IsValid)
            {
                var isSaved = await _academicSubjectManager.AddAsync(academicSubject);
                if (isSaved)
                {
                    TempData["created"] = "Created Successfully";
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    TempData["error"] = "Already Exist";
                }
            }

            ViewData["AcademicSubjectTypeId"] = new SelectList(await _academicSubjectTypeManager.GetAllAsync(), "Id", "SubjectTypeName", academicSubject.AcademicSubjectTypeId);
            return View(academicSubject);
        }

        // GET: AcademicSubjects/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var academicSubject = await _academicSubjectManager.GetByIdAsync((int)id);
            if (academicSubject == null)
            {
                return NotFound();
            }
            ViewData["AcademicSubjectTypeId"] = new SelectList(await _academicSubjectTypeManager.GetAllAsync(), "Id", "SubjectTypeName", academicSubject.AcademicSubjectTypeId);
            return View(academicSubject);
        }

        // POST: AcademicSubjects/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,SubjectName,AcademicSubjectTypeId,SubjectCode,SubjectFor,TotalMarks,Status,CreatedBy,CreatedAt,EditedBy,EditedAt")] AcademicSubject academicSubject)
        {
            if (id != academicSubject.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    TempData["updated"] = "Updated Successfully";
                    await _academicSubjectManager.UpdateAsync(academicSubject);
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AcademicSubjectExists(academicSubject.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["AcademicSubjectTypeId"] = new SelectList(await _academicSubjectTypeManager.GetAllAsync(), "Id", "SubjectTypeId", academicSubject.AcademicSubjectTypeId);
            return View(academicSubject);
        }

        // GET: AcademicSubjects/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var academicSubject = await _academicSubjectManager.GetByIdAsync((int)id);
            if (academicSubject == null)
            {
                return NotFound();
            }

            return View(academicSubject);
        }

        // POST: AcademicSubjects/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var academicSubject =await _academicSubjectManager.GetByIdAsync(id);
            
            await _academicSubjectManager.RemoveAsync(academicSubject);
            TempData["deleted"]= "Deleted Successfully";
            return RedirectToAction(nameof(Index));
        }

        private bool AcademicSubjectExists(int id)
        {
            var academicSubject = _academicSubjectManager.GetByIdAsync(id);
            if (academicSubject != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
