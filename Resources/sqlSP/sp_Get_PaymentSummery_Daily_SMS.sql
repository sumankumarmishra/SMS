USE [SMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_PaymentSummery_Daily_SMS]    Script Date: 16-Oct-23 11:17:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GH Palash
-- Create date: 07 Oct 2023
-- Description:	This sms is used to create daily sms of payment summry.
-- =============================================
ALTER PROCEDURE [dbo].[sp_Get_PaymentSummery_Daily_SMS] 
	@date nvarchar(10)
AS
BEGIN
	declare @residentailPayment decimal;
	declare @nonResidentialPayment decimal;

	set @residentailPayment = ISNull((select sum(s.TotalPayment) from StudentPayment s where s.StudentId in (select stu.Id from Student stu where stu.IsResidential=1) and FORMAT(s.PaidDate,'yyyyMMdd')=@date),0);
	set @nonResidentialPayment = IsNull((select sum(s.TotalPayment) from StudentPayment s where s.StudentId in (select stu.Id from Student stu where stu.IsResidential=0) and FORMAT(s.PaidDate,'yyyyMMdd')=@date),0);

    select @residentailPayment[ResidentialPayment],@nonResidentialPayment[NonResidentialPayment];
END

