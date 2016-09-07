USE [ShoppingSite]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Object		: StoredProcedure [dbo].[CartAdd]
-- Author		: Rahul Kumar
-- Create date	: 07 Sep 2016
-- Description	: To add the items in cart into the DB for registered users
-- =============================================
CREATE PROCEDURE [dbo].[CartAdd]
	-- Add the parameters for the stored procedure here
	@userId [bigint],
	@productId [bigint],
	@quantity [smallint] = 1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRAN
		IF EXISTS(
			SELECT Quantity FROM Cart
				WHERE UserId=@userId AND ProductId=@productId )
			BEGIN
				IF( @quantity < 1 )
					DELETE FROM Cart
						WHERE UserId=@userId AND ProductId=@productId
				ELSE
					UPDATE Cart
						SET Quantity=@quantity
						WHERE UserId=@userId AND ProductId=@productId
			END
		ELSE
			BEGIN
				INSERT INTO Cart
					VALUES( @userId, @productId, @quantity )
			END
	COMMIT TRAN
END

GO
