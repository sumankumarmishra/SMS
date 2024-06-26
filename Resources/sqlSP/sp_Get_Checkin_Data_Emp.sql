USE [SMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Checkin_Data_Emp]    Script Date: 1/21/2024 7:27:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GH Palash
-- Create date: 18 Nov 2022
-- Description:	This procedure for Employees Checkin attendance
-- =============================================
ALTER PROCEDURE [dbo].[sp_Get_Checkin_Data_Emp] 
	@date varchar(10)
AS
BEGIN
	select * from(
	select *, ROW_NUMBER() over(partition by CardNo order by CardNo) rN
	from Tran_MachineRawPunch
	where Format(PunchDatetime,'dd-MM-yyyy') = @date
	) a
	where rN = 1 and len(CardNo) = 4
END
