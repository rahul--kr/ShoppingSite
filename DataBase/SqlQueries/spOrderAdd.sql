USE [ShoppingSite]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Object		: StoredProcedure [dbo].[OrderAdd]
-- Author		: Rahul Kumar
-- Create date	: 31 Aug 2016
-- Description	: Query to insert order details into DB.
-- =============================================
CREATE PROCEDURE [dbo].[OrderAdd]
	-- Add the parameters for the stored procedure here
	@uSId [bigint]
AS

DECLARE @orderId bigint;

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	EXEC @orderId= OrderIdGet @uSId

	SELECT @orderId AS OrderId;
END

