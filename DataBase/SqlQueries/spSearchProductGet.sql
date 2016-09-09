USE [ShoppingSite]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Object		: StoredProcedure [dbo].[SearchProductGet]
-- Author		: Rahul Kumar
-- Create date	: 09 Sep 2016
-- Description	: To query the list of products by the query text
-- =============================================
CREATE PROCEDURE [dbo].[SearchProductGet]
	-- Add the parameters for the stored procedure here
	@searchText[varchar](800)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ProductId, ProductName, ProductPrice, ProductImage
		FROM FREETEXTTABLE( dbo.Product, (ProductName, ProductDesc), @searchText ) AS T
			INNER JOIN dbo.Product P
			ON T.[Key] = P.[ProductId]
		ORDER BY T.[RANK] DESC

END

GO
