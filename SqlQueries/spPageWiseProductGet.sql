USE [ShoppingSite]
GO
/****** Object:  StoredProcedure [dbo].[ProductGet]    Script Date: 8/25/2016 12:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author		: Rahul Kumar
-- Create date	: 23 Aug 2016
-- Description	: To query the list of products in a particular category; 20 products a/c to page number
-- =============================================
ALTER PROCEDURE [dbo].[ProductGet]
	-- Add the parameters for the stored procedure here
	@Category [smallint] = 1,
	@PageNo [smallint] = 1
AS

DECLARE @Begin integer
DECLARE @End integer

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @Begin= (( @PageNo - 1 ) * 20 ) + 1;

	SELECT @End= @PageNo * 20;

	SELECT ProductId, ProductName, ProductPrice, ProductImage
	FROM [dbo].[Product]
	WHERE CategoryId = @Category
		AND ProductId BETWEEN @Begin AND @End;
END
