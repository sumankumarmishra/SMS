﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SMS.BLL.Contracts;
using SMS.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SMS.App.Controllers
{
    public class AttendancesController : Controller
    {
        private readonly IAttendanceManager _attendanceManager;
        private readonly IStudentManager _studentManager;
        private readonly IEmployeeManager _employeeManager;
        private readonly UserManager<ApplicationUser> _userManager;

        public AttendancesController(IAttendanceManager attendanceManager, IStudentManager studentManager, IEmployeeManager employeeManager, UserManager<ApplicationUser> userManager)
        {
            _attendanceManager = attendanceManager;
            _studentManager = studentManager;
            _employeeManager = employeeManager;
            _userManager = userManager;
        }
        // GET: AttendancesController
        public async Task<ActionResult> Index()
        {
            var allAttendances = await _attendanceManager.GetAllAsync();
            return View(allAttendances);
        }

        // GET: AttendancesController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: AttendancesController/Create
        public ActionResult Create()
        {
            var allUser = _userManager.Users;
            ViewBag.ApplicationUserId = new SelectList(allUser, "Id", "UserName");
            return View();
        }

        // POST: AttendancesController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Attendance model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    model.CreatedAt = DateTime.Now;
                    model.CreatedBy = HttpContext.Session.GetString("UserId");

                    await _attendanceManager.AddAsync(model);
                    return RedirectToAction("Index");
                }
                catch (Exception)
                {

                    throw;
                }
                
            }
            return View();
        }

        // GET: AttendancesController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: AttendancesController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: AttendancesController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: AttendancesController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}