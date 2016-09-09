USE [ShoppingSite]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Object		: StoredProcedure [dbo].[ProductGet]
-- Author		: Rahul Kumar
-- Create date	: 23 Aug 2016
-- Description	: To query the list of products in a particular category
-- =============================================
CREATE PROCEDURE [dbo].[ProductGet]
	-- Add the parameters for the stored procedure here
	@Category [smallint] = 1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ProductId, ProductName, ProductPrice, ProductImage
		FROM [dbo].[Product]
		WHERE CategoryId = @Category
END

GO
