USE [SMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Payments_Get_All_by_Date]    Script Date: 04-May-23 7:52:06 PM ******/
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
	
 SELECT v.ClassRoll,v.StudentName,
 v.AcademicSection,
 v.PaymentType,
 v.ReceiptNo,
 v.Remarks,
 v.PaidDate,
 v.TotalPayment,
 v.AcademicClassId,
 v.AcademicSectionId,
 v.AcademicClassName 
 from vw_rpt_payments_All v
 Where (@academicClassId is null OR v.AcademicClassId = @academicClassId)
 and ( @academicSectionId is null OR v.AcademicSectionId = @academicSectionId)
 and v.PaidDate between Convert(date,@fromDate) and Convert(date,@toDate)
END
