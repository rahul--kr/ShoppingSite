USE [ShoppingSite]
GO
/****** Object:  StoredProcedure [dbo].[CategoryGet]    Script Date: 8/23/2016 2:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: Rahul Kumar
-- Create date	: 18 Aug 2016
-- Description	: To query the list of categoriesin the DB
-- =============================================
CREATE PROCEDURE [dbo].[CategoryGet]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CategoryId, CategoryName, CategoryImage
	FROM [dbo].[Category]
	ORDER BY CategoryName
END
