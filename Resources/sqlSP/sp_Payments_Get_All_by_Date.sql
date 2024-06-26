USE [SMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Payments_Get_All_by_Date]    Script Date: 18-Sep-23 6:56:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dbo].[sp_Payments_Get_All_by_Date] 
	@fromDate varchar(10),
	@toDate  varchar(10),
	@academicClassId varchar(1),
	@academicSectionId varchar(2)
AS
BEGIN
	declare @dateDiff int;
	set @dateDiff = (select DATEDIFF(day, Convert(date,@fromDate), Convert(date,@toDate)));
	if	@dateDiff > 31
		BEGIN
		set @fromDate = '1900-01-01';
		set @toDate = '1900-01-01';
		END
	
			SELECT v.ClassRoll,v.StudentName,
			 v.AcademicSection,
			 v.PaymentType,
			 v.ReceiptNo,
			 v.Remarks,
			 v.PaidDate,
			 v.TotalPayment,
			 v.AcademicClassId,
			 v.AcademicSectionId,
			 v.AcademicClassName,
			 v.IsResidential
			 from vw_rpt_payments_All v
			 Where (@academicClassId is null OR v.AcademicClassId = @academicClassId)
			 and ( @academicSectionId is null OR v.AcademicSectionId = @academicSectionId)
			 and v.PaidDate between Convert(date,@fromDate) and Convert(date,@toDate)
		
END
