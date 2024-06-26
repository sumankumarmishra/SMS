USE [SMSDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_Checkin_Data]    Script Date: 1/25/2024 12:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GH Palash
-- Create date: 18 Nov 2022
-- Description:	This procedure for Employees Checkin attendance
-- =============================================
ALTER PROCEDURE [dbo].[sp_Get_Checkin_Data] 
	@date varchar(10)
AS
BEGIN
	select * from(
	select *, ROW_NUMBER() over(partition by CardNo order by CardNo) rN
	from Tran_MachineRawPunch
	where Format(PunchDatetime,'dd-MM-yyyy') = @date
	) a
	where rN = 1 and (FORMAT(PunchDatetime,'hh:mm') between (select p.ParamValue from ParamBusConfigs p where p.ParamSL = 1) and (select p.ParamValue from ParamBusConfigs p where p.ParamSL = 2))
END

