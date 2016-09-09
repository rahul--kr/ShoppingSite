USE [ShoppingSite]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Object		: StoredProcedure [dbo].[OrdersGet]
-- Author		: Rahul Kumar
-- Create date	: 06 Sep 2016
-- Description	: To query the list of orders placed by a particular user
-- =============================================
CREATE PROCEDURE [dbo].[OrdersGet]
	-- Add the parameters for the stored procedure here
	@userId [bigint]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT OrderTable.OrderId, DateCreated, ProductQuantity, ProductName, ProductPrice, ProductImage, ProductShippingCost
		FROM [dbo].[UserShippingDetail] INNER JOIN [dbo].[OrderTable]
			ON OrderTable.UserShippingId = UserShippingDetail.UserShippingId
			INNER JOIN [dbo].[OrderDetail]
				ON OrderTable.OrderId = OrderDetail.OrderId
				INNER JOIN [dbo].[Product]
					ON OrderDetail.ProductId = Product.ProductId
		WHERE UserShippingDetail.UserId = @userId
		ORDER BY OrderId DESC
END

GO
