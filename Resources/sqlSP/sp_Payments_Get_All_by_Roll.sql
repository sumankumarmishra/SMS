USE [SMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Payments_Get_All_by_Roll]    Script Date: 04-May-23 7:52:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dbo].[sp_Payments_Get_All_by_Roll] 
	@classRoll int,
	@fromDate varchar(10),
	@toDate varchar(10)
AS
BEGIN
	select v.ReceiptNo,
	v.PaidDate,
	v.PaymentType[PaymentTypeName],
	v.TotalPayment,
	v.Remarks
	from vw_rpt_payments_all v
	where v.ClassRoll = @classRoll and
	CONVERT(date,v.PaidDate) between @fromDate and @toDate
END
