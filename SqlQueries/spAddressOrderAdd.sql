USE [ShoppingSite]
GO
/****** Object:  StoredProcedure [dbo].[AddressOrderAdd]    Script Date: 9/1/2016 5:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Object		: StoredProcedure [dbo].[AddressOrderAdd]
-- Author		: Rahul Kumar
-- Create date	: 1 Sep 2016
-- Description	: Query to insert address and correspondingly order details into DB.
-- =============================================
CREATE PROCEDURE [dbo].[AddressOrderAdd]
	-- Add the parameters for the stored procedure here
	@userId [bigint],
	@houseNo [varchar],
	@street [varchar],
	@postalCode [varchar],
	@city [varchar],
	@state [varchar],
	@country [varchar]
AS

DECLARE @addressId bigint
DECLARE @userShippingId bigint=NULL
DECLARE @orderId bigint

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- check if the address user enterd already exists in DB
	SELECT @addressId=	( SELECT AddressId
							FROM ShippingAddress
							WHERE HouseNo= @houseNo AND Street= @street AND @postalCode= @postalCode
								AND City= @city AND State= @state AND Country= @country )

	-- if address doesn't exist, add the address
	IF @addressId IS NULL
	BEGIN
		INSERT INTO ShippingAddress ( HouseNo, Street, PostalCode, City, State, Country )
			VALUES( @houseNo, @street, @postalCode, @city, @state, @country )

		SELECT @addressId=	@@IDENTITY
	END
	ELSE
		-- check if the address is already mapped to the user
		SELECT @userShippingId=	( SELECT UserShippingId
									FROM UserShippingDetail
									WHERE UserId= @userId AND AddressId= @addressId )
	
	-- if not mapped create a map
	IF @userShippingId IS NULL
	BEGIN
		-- map the address to user in UserShippingDetail table
		INSERT INTO UserShippingDetail ( UserId, AddressId )
			VALUES( @userId, @addressId )

		-- select UserShippingId to pass it to OrderAdd stored procedure
		SELECT @userShippingId=	@@IDENTITY
	END

	-- execute SP OrderAdd using the UserShippingId and get back OrderId
	EXEC @orderId= OrderAdd @userShippingId

	SELECT @orderId AS OrderId
END
