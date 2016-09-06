USE [ShoppingSite]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Object		: StoredProcedure [dbo].[OrderIdGet]
-- Author		: Rahul Kumar
-- Create date	: 1 Sep 2016
-- Description	: Query to insert order details into DB and return corresponding OrderId.
-- =============================================
CREATE PROCEDURE [dbo].[OrderIdGet]
	-- Add the parameters for the stored procedure here
	@uSId [bigint]
AS

DECLARE @orderId bigint;

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRAN
	
		SELECT @orderId= (SELECT IsNull((SELECT TOP(1) OrderId
			FROM OrderTable
			ORDER BY OrderId DESC)+1, 1));

		INSERT INTO OrderTable( OrderId, DateCreated, UserShippingId )
			VALUES ( @orderId, GETDATE(), @uSId );

	COMMIT

	RETURN @orderId
END
