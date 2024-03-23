USE [SMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_get_attendance_by_date]    Script Date: 23-Mar-24 1:07:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
		-- Author: GHPalash
		-- Create date: 18 Aug 2022
		-- Description:	Getting data for attendance report
		-- =============================================
		ALTER   PROCEDURE [dbo].[sp_get_attendance_by_date]
			@attendanceFor VARCHAR(10), --Employee/Student
			@date DateTime,
			@attendanceType VARCHAR(10), --attended/absent/all
			@aSessionId INT = null,
			@aClassId INT = null
		AS
		BEGIN
			IF @attendanceFor = 'employees'
				BEGIN
					IF @attendanceType = 'attended'
						BEGIN
							select Convert(varchar,e.Id)[CardNo],
							e.EmployeeName[Name],
							d.DesignationName[Class_Designation],
							e.Phone,
							(case
								when a.PunchTime is NULL 
								then 'absent'
								else RIght(Convert(varchar,a.PunchTime),8)
								end) as PunchTime,
							Convert(varchar,e.NomineePhone)[GuardianPhone]
							from (select * from Employee where Status=1) e
							full join (
							select v.*
							from vw_rpt_Employee_Attendance v
							inner join(
								select t1.CardNo,min(t1.Tran_MachineRawPunchId)[Tran_MachineRawPunchId] from vw_rpt_Employee_Attendance t1 where Convert(date,t1.PunchTime) = Convert(date,@date) group by t1.CardNo
							) as m on v.Tran_MachineRawPunchId = m.Tran_MachineRawPunchId
							) as a on e.Id = a.CardNo
							inner join Designation d on e.DesignationId = d.Id
							where Convert(varchar,PunchTime) <> 'absent'
						END
					ELSE IF @attendanceType = 'absent'
						BEGIN
							select Convert(varchar,e.Id)[CardNo],
							e.EmployeeName[Name],
							d.DesignationName[Class_Designation],
							e.Phone,
							(case
								when a.PunchTime is NULL 
								then 'absent'
								else RIght(Convert(varchar,a.PunchTime),8)
								end) as PunchTime,
							Convert(varchar,e.NomineePhone)[GuardianPhone]
							from (select * from Employee where Status=1) e
							full join (
							select v.*
							from vw_rpt_Employee_Attendance v
							inner join(
								select t1.CardNo,min(t1.Tran_MachineRawPunchId)[Tran_MachineRawPunchId] from vw_rpt_Employee_Attendance t1 where Convert(date,t1.PunchTime) = Convert(date,@date) group by t1.CardNo
							) as m on v.Tran_MachineRawPunchId = m.Tran_MachineRawPunchId
							) as a on e.Id = a.CardNo
							inner join Designation d on e.DesignationId = d.Id
							where Convert(varchar,PunchTime) is null							
						END	
					ELSE
						BEGIN
							select Convert(varchar,e.Id)[CardNo],
							e.EmployeeName[Name],
							d.DesignationName[Class_Designation],
							e.Phone,
							(case
								when a.PunchTime is NULL 
								then 'absent'
								else RIght(Convert(varchar,a.PunchTime),8)
								end) as PunchTime,
							Convert(varchar,e.NomineePhone)[GuardianPhone]
							from (select * from Employee where Status=1) e
							full join (
							select v.*
							from vw_rpt_Employee_Attendance v
							inner join(
								select t1.CardNo,min(t1.Tran_MachineRawPunchId)[Tran_MachineRawPunchId] from vw_rpt_Employee_Attendance t1 where Convert(date,t1.PunchTime) = Convert(date,@date) group by t1.CardNo
							) as m on v.Tran_MachineRawPunchId = m.Tran_MachineRawPunchId
							) as a on e.Id = a.CardNo
							inner join Designation d on e.DesignationId = d.Id
						END
				END
			ELSE
				BEGIN
					IF @attendanceType = 'attended'
						BEGIN							
							select cast(s.ClassRoll as varchar)[CardNo],v.Name[Name],v.Class_Designation,v.Phone,
							(CASE
								WHEN v.PunchTime IS NULL 
								THEN 'absent'
								ELSE RIGHT(Convert(varchar,v.PunchTime),8)
								END) as PunchTime,
							v.GuardianPhone from Student s
inner join vw_rpt_student_attendance v on cast(s.UniqueId as int)=cast(v.CardNo as int)
							join
							(select t.CardNo, min(t.PunchTime)[PunchTime],min(t.Tran_MachineRawPunchId)[Tran_MachineRawPunchId] from vw_rpt_student_attendance t
							where convert(date,t.PunchTime) = CONVERT(date,@date)
							group by t.CardNo) as g on cast(v.CardNo as int) = cast(g.CardNo as int) and v.PunchTime=g.PunchTime and v.Tran_MachineRawPunchId =g.Tran_MachineRawPunchId and (@aClassId IS NULL OR s.AcademicClassId=@aClassId) 

						END
					ELSE IF @attendanceType = 'absent'
						BEGIN
							SELECT cast(s.ClassRoll as varchar) [CardNo], 
							s.Name[Name], 
							aClass.Name[Class_Designation],
							s.GuardianPhone[GuardianPhone],
							s.PhoneNo[Phone],
							'Absent'[PunchTime] FROM Student s
							LEFT JOIN AcademicClass aClass ON s.AcademicClassId = aClass.Id	
							WHERE s.Status = 1 and cast(s.UniqueId as int) not in (
							SELECT DISTINCT (CONVERT(int,t.CardNo)) FROM Tran_MachineRawPunch t
							WHERE FORMAT(t.PunchDatetime, 'yyyy-MM-dd') = @date) 
							and(@aSessionId IS NULL OR s.AcademicSessionId=@aSessionId)
							and(@aClassId IS NULL OR s.AcademicClassId=@aClassId)
							ORDER BY aClass.ClassSerial
						END
					ELSE
						BEGIN
							
							SELECT stu.* FROM (
							SELECT CONVERT(varchar,s.ClassRoll)[CardNo], 
							s.Name[Name], 
							aClass.Name[Class_Designation],
							s.GuardianPhone[GuardianPhone],
							s.PhoneNo[Phone],
							FORMAT(t.Punchtime,'hh:mm tt')[PunchTime] FROM Student s
							LEFT JOIN AcademicClass aClass ON s.AcademicClassId = aClass.Id
							LEFT JOIN (
								SELECT 
								CONVERT(int,tm.CardNo)[CardNo],
								MIN(tm.PunchDatetime)[Punchtime] 
								FROM Tran_MachineRawPunch tm 
								WHERE FORMAT(tm.PunchDatetime, 'yyyy-MM-dd')=@date 
								GROUP BY CONVERT(int,tm.CardNo)
								) t ON cast(s.UniqueId as int) = CONVERT(int,t.CardNo)
							WHERE s.Status = 1 and cast(s.UniqueId as int) in (
							SELECT DISTINCT (CONVERT(int,t.CardNo)) FROM Tran_MachineRawPunch t
							WHERE FORMAT(t.PunchDatetime, 'yyyy-MM-dd') = @date) 
							and(@aSessionId IS NULL OR s.AcademicSessionId=@aSessionId)
							and(@aClassId IS NULL OR s.AcademicClassId=@aClassId)					
							UNION
							SELECT CONVERT(varchar,s.ClassRoll) [CardNo], 
							s.Name[Name], 
							aClass.Name[Class_Designation],
							s.GuardianPhone[GuardianPhone],
							s.PhoneNo[Phone],
							'Absent'[PunchTime] FROM Student s
							LEFT JOIN AcademicClass aClass ON s.AcademicClassId = aClass.Id	
							WHERE s.Status = 1 and cast(s.UniqueId as int) not in (
							SELECT DISTINCT (CONVERT(int,t.CardNo)) FROM Tran_MachineRawPunch t
							WHERE FORMAT(t.PunchDatetime, 'yyyy-MM-dd') = @date ) 
							and(@aSessionId IS NULL OR s.AcademicSessionId=@aSessionId)
							and(@aClassId IS NULL OR s.AcademicClassId=@aClassId)
							) stu ORDER BY stu.Class_Designation,stu.CardNo
						END			
				END
		END

