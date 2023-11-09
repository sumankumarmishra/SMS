﻿using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SchoolManagementSystem;
using SMS.App.Utilities.MACIPServices;
using SMS.App.ViewModels.AcademicVM;
using SMS.App.ViewModels.ExamVM;
using SMS.BLL.Contracts;
using SMS.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SMS.App.Controllers
{
    [Authorize(Roles = "SuperAdmin, Admin")]
    public class AcademicExamGroupController : Controller
    {
        private readonly IAcademicExamGroupManager _examGroupManager;
        private readonly IAcademicSessionManager _academicSessionManager;
        private readonly IAcademicExamTypeManager _academicExamTypeManager;
        private readonly IAcademicExamManager _academicExamManager;
        private readonly IMapper _mapper;
        private readonly IExamResultManager _examResultManager;
        public AcademicExamGroupController(IAcademicExamGroupManager examGroupManager, IAcademicSessionManager academicSessionManager, IAcademicExamTypeManager academicExamTypeManager, IAcademicExamManager academicExamManager, IMapper mapper, IExamResultManager examResultManager)
        {
            _examGroupManager = examGroupManager;
            _academicSessionManager = academicSessionManager;
            _academicExamTypeManager = academicExamTypeManager;
            _academicExamManager = academicExamManager;
            _mapper = mapper;
            _examResultManager = examResultManager;

        }
        // GET: AcademicExamGroupController
        [Authorize(Policy = "IndexAcademicExamGroupPolicy")]
        public async Task<ActionResult> Index()
        {
            List<AcademicExamGroup> examGroupList = new List<AcademicExamGroup>();
            AcademicExamGroupVM academicExamGroupVM = new AcademicExamGroupVM();
            try
            {
                examGroupList = (List<AcademicExamGroup>)await _examGroupManager.GetAllAsync();
                foreach (var item in examGroupList)
                {
                    AcademicExamGroupIndexVM e = new AcademicExamGroupIndexVM();
                    e = _mapper.Map<AcademicExamGroupIndexVM>(item);
                    int resultProcessed = 0;
                    foreach (var exa in item.AcademicExams)
                    {
                        bool isExamExist = _examResultManager.IsResultProcessedAsync(e.Id, exa.AcademicClassId);
                        if (isExamExist)
                        {
                            resultProcessed++;
                        }
                    }
                    e.NumberOfProcessResults = resultProcessed;
                    academicExamGroupVM.AcademicExamGroupIndexVMList.Add(e);
                }

                academicExamGroupVM.AcademicSessionList = new SelectList(await _academicSessionManager.GetAllAsync(), "Id", "Name").ToList();
                academicExamGroupVM.ExamTypeList = new SelectList(await _academicExamTypeManager.GetAllAsync(), "Id", "ExamTypeName").ToList();
            }
            catch (System.Exception)
            {
                throw;
            }
            return View(academicExamGroupVM);
        }

        // GET: AcademicExamGroupController/Details/5
        [Authorize(Policy = "DetailsAcademicExamGroupPolicy")]
        public async Task<ActionResult> Details(int id)
        {
            if (TempData["failed"]!=null)
            {
                TempData["failed"] = TempData["failed"].ToString();
            }
            if (TempData["success"] != null)
            {
                TempData["created"] = TempData["success"].ToString();
            }
            ViewBag.ScrollPosition = HttpContext.Session.GetInt32("ScrollPosition");
            if (ViewBag.ScrollPosition == null)
            {
                ViewBag.ScrollPosition = 0;
            }
            GlobalUI.PageTitle = "Exam Group Details";

            AcademicExamGroup academicExamGroup = await _examGroupManager.GetByIdAsync(id);
            AcademicExamGroupIndexVM academicExamGroupIndexVM = _mapper.Map<AcademicExamGroupIndexVM>(academicExamGroup);
            return View(academicExamGroupIndexVM);
        }

        // POST: AcademicExamGroupController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Policy = "CreateAcademicExamGroupPolicy")]
        public async Task<ActionResult> Create(AcademicExamGroup academicExamGroup)
        {
            if (!ModelState.IsValid)
            {
                TempData["error"] = "Something wrong";
                AcademicExamGroupVM academicExamGroupVM = new AcademicExamGroupVM();
                //academicExamGroupVM.AcademicExamGroups = (List<AcademicExamGroup>)await _examGroupManager.GetAllAsync();
                academicExamGroupVM.ExamGroupName = academicExamGroup.ExamGroupName;
                academicExamGroupVM.academicExamTypeId = academicExamGroup.academicExamTypeId;
                academicExamGroupVM.ExamMonthId = academicExamGroup.ExamMonthId;
                return RedirectToAction("index");
            }

            ViewData["AcademicSessionList"] = new SelectList(await _academicSessionManager.GetAllAsync(), "Id", "Name", academicExamGroup.AcademicSessionId);
            ViewData["AcademicExamTypeList"] = new SelectList(await _academicExamTypeManager.GetAllAsync(), "Id", "ExamTypeName", academicExamGroup.academicExamTypeId);

            var allExamGroup = await _examGroupManager.GetAllAsync();
            AcademicExamGroup existingExamGroup = allExamGroup.FirstOrDefault(s => s.ExamGroupName == academicExamGroup.ExamGroupName && s.AcademicSessionId == academicExamGroup.AcademicSessionId && s.academicExamTypeId == academicExamGroup.academicExamTypeId);
            try
            {
                if (existingExamGroup != null)
                {
                    TempData["error"] = "This Exam Group is already exist.";
                    return RedirectToAction("index", academicExamGroup);
                }
                if (string.IsNullOrEmpty(academicExamGroup.ExamGroupName))
                {
                    TempData["error"] = "Group Name should not empty.";
                    return RedirectToAction("index",academicExamGroup);
                }
                academicExamGroup.CreatedAt = DateTime.Now;
                academicExamGroup.CreatedBy = HttpContext.Session.GetString("UserId");
                academicExamGroup.MACAddress = MACService.GetMAC();
                bool isSaved = await _examGroupManager.AddAsync(academicExamGroup);
                if (!isSaved)
                {
                    TempData["error"] = "Something during save time";
                }
                else
                {
                    TempData["created"] = "Alhamdulillah! Exam Group Successfully Created";
                }
            }
            catch
            {
                throw;
            }

            return RedirectToAction("Index");
        }

        // GET: AcademicExamGroupController/Edit/5
        [Authorize(Policy = "EditAcademicExamGroupPolicy")]
        public async Task<ActionResult> Edit(int id)
        {
            AcademicExamGroup academicExamGroup = await _examGroupManager.GetByIdAsync(id);
            if (academicExamGroup != null)
            {
                ViewData["AcademicSessionList"] = new SelectList(await _academicSessionManager.GetAllAsync(), "Id", "Name", academicExamGroup.AcademicSessionId);
                ViewData["AcademicExamTypeList"] = new SelectList(await _academicExamTypeManager.GetAllAsync(), "Id", "ExamTypeName", academicExamGroup.academicExamTypeId);
                return View(academicExamGroup);
            }
            else
            {
                TempData["error"] = "Data not found";
                return RedirectToAction("Index");
            }
        }

        // POST: AcademicExamGroupController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Policy = "EditAcademicExamGroupPolicy")]
        public async Task<ActionResult> Edit(int id, AcademicExamGroup academicExamGroup)
        {
            if (id!=academicExamGroup.Id)
            {
                TempData["error"]="Data Not matched";
                return View(academicExamGroup);
            }

            var allExamGroup = await _examGroupManager.GetAllAsync();
            AcademicExamGroup existingExamGroup = allExamGroup.FirstOrDefault(s => s.ExamGroupName == academicExamGroup.ExamGroupName && s.AcademicSessionId == academicExamGroup.AcademicSessionId && s.academicExamTypeId == academicExamGroup.academicExamTypeId);

            ViewData["AcademicSessionList"] = new SelectList(await _academicSessionManager.GetAllAsync(), "Id", "Name", academicExamGroup.AcademicSessionId);
            ViewData["AcademicExamTypeList"] = new SelectList(await _academicExamTypeManager.GetAllAsync(), "Id", "ExamTypeName", academicExamGroup.academicExamTypeId);
            try
            {
                if (existingExamGroup != null && id!=existingExamGroup.Id)
                {
                    TempData["error"] = "This Exam Group is already exist.";
                    return RedirectToAction("index");
                }
                academicExamGroup.EditedAt = DateTime.Now;
                academicExamGroup.EditedBy = HttpContext.Session.GetString("UserId");
                academicExamGroup.MACAddress = MACService.GetMAC();
                bool isUpdated = await _examGroupManager.UpdateAsync(academicExamGroup);
                if (isUpdated)
                {
                    TempData["updated"] = "Exam Group Updated Successfully";
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    TempData["error"] = "Update failed. Something wrong";
                }
            }
            catch(Exception ex)
            {
                TempData["error"] = "Exception: "+ex.Message;
                return RedirectToAction("Index");
            }
            return RedirectToAction("index");
        }

        // GET: AcademicExamGroupController/Delete/5
        [HttpPost]
        [Authorize(Policy = "DeleteAcademicExamGroupPolicy")]
        public async Task<ActionResult> Delete(int id)
        {
            AcademicExamGroup academicExamGroup = await _examGroupManager.GetByIdAsync(id);
            try
            {
                if (academicExamGroup!=null)
                {
                    var examList = await _academicExamManager.GetAllAsync();
                    if (examList!=null)
                    {
                        AcademicExam existingExam = examList.FirstOrDefault(s => s.AcademicExamGroupId == id);
                        if (existingExam!=null)
                        {
                            TempData["error"] = "Existing Exam available in this group.";
                            return RedirectToAction("index");
                        }
                    }
                    bool isDeleted = await _examGroupManager.RemoveAsync(academicExamGroup);
                    if (isDeleted)
                    {
                        TempData["created"]= "Deleted Successfully.";
                    }
                    else
                    {
                        TempData["error"] = "Failed! Something wrong.";
                    }
                }
            }
            catch (Exception ex)
            {
                TempData["error"] = "Exception: " + ex.Message;
            }

            return RedirectToAction("index");
        }

        public async Task<JsonResult> GetExamGroups(int monthId, int examTypeId)
        {
            List<AcademicExamGroup> examGroup = new List<AcademicExamGroup>();
            try
            {
                examGroup = (List<AcademicExamGroup>)await _examGroupManager.GetByMonthExamType(monthId, examTypeId);
            }
            catch (Exception)
            {

                throw;
            }
            return Json(examGroup);
        }
    }
}
