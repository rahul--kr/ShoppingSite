USE [ShoppingSite]

CREATE TABLE [dbo].[Product](
	[ProductId] [bigint] IDENTITY(1, 1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDesc] [varchar](max) NOT NULL,
	[ProductPrice] [money] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[ProductImage] [varchar](max) NULL,
	[ProductShippingCost] [money] NOT NULL,
	[CategoryId] [smallint] FOREIGN KEY REFERENCES Category(CategoryId) NOT NULL,
	[ManufacturerId] [int] FOREIGN KEY REFERENCES Manufacturer(ManufacturerId) NOT NULL,
 CONSTRAINT [PK_Product_1] PRIMARY KEY CLUSTERED
(	[ProductId] ))

CREATE TABLE [dbo].[UserShippingDetail](
	[UserShippingId] [bigint] IDENTITY(1, 1) NOT NULL,
	[UserId] [bigint] FOREIGN KEY REFERENCES UserDetail(UserId) NOT NULL,
	[AddressId] [bigint] FOREIGN KEY REFERENCES ShippingAddress(AddressId) NOT NULL,
 CONSTRAINT [PK_UserShippingDetail_1] PRIMARY KEY CLUSTERED
(	[UserShippingId] ))

CREATE TABLE [dbo].[OrderTable](
	[OrderId] [bigint] NOT NULL,
	[DateCreated] [date] NOT NULL,
	[UserShippingId] [bigint] FOREIGN KEY REFERENCES UserShippingDetail(UserShippingId) NOT NULL,
 CONSTRAINT [PK_OrderTable_1] PRIMARY KEY CLUSTERED 
(	[OrderId] ))

CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] FOREIGN KEY REFERENCES Product(ProductId) NOT NULL,
	[OrderId] [bigint] FOREIGN KEY REFERENCES OrderTable(OrderId) NOT NULL,
	[ProductQuantity] [smallint] NOT NULL,
 CONSTRAINT [PK_OrderDetail_1] PRIMARY KEY CLUSTERED
(	[OrderDetailId] ))

CREATE TABLE [dbo].[Cart](
	[UserId] [bigint] FOREIGN KEY REFERENCES UserDetail(UserId) NOT NULL,
	[ProductId] [bigint] FOREIGN KEY REFERENCES Product(ProductId) NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_Cart_1] PRIMARY KEY
( [UserId], [ProductId] ))

