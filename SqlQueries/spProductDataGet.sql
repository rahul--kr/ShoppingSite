USE [ShoppingSite]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Object		: StoredProcedure [dbo].[ProductDataGet]
-- Author		: Rahul Kumar
-- Create date	: 25 Aug 2016
-- Description	: To query the data of a product by it's ProductId
-- =============================================
CREATE PROCEDURE [dbo].[ProductDataGet]
	-- Add the parameters for the stored procedure here
	@PId [bigint] = 1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ProductId, ProductName, ProductDesc, ProductPrice, UnitsInStock, ProductImage, ProductShippingCost, ManufacturerName
		FROM [dbo].[Product]
		INNER JOIN Manufacturer
		ON Product.ManufacturerId = Manufacturer.ManufacturerId
		WHERE ProductId = @PId
END

GO
