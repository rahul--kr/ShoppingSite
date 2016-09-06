USE [ShoppingSite]

DECLARE @addressId bigint;
DECLARE @userId bigint= 1;
DECLARE @userShippingId bigint;

-- check if the address user enterd already exists in DB
SELECT @addressId=	(SELECT TOP(1) AddressId
						FROM ShippingAddress
						WHERE PostalCode='751124')

-- if address doesn't exist, add the address
IF @addressId=NULL
BEGIN
	-- to check if the table is empty and get address is accordingly
	SELECT @addressId=	( SELECT ISNULL( (SELECT TOP(1) AddressId
							FROM ShippingAddress
							ORDER BY AddressId DESC)+1, 1 ))

	INSERT INTO ShippingAddress
		VALUES( 5, 'a', 'a', 'a', 'a', 'a', 'a' )
END

SELECT @userShippingId=	(SELECT UserShippingId
	FROM UserShippingDetail
	WHERE UserId= @userId AND AddressId= @addressId)

IF @userShippingId=NULL
BEGIN
	-- map the address to user in UserShippingDetail table
	INSERT INTO UserShippingDetail ( UserId, AddressId )
		VALUES( @userId, @addressId )

	-- select UserShippingId to pass it to OrderAdd stored procedure
	SELECT UserShippingId
		FROM UserShippingDetail
		WHERE UserId= @userId AND AddressId= @addressId
END