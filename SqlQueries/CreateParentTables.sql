USE [ShoppingSite]

CREATE TABLE [dbo].[Category](
	[CategoryId] [smallint] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CategoryDesc] [varchar](max) NOT NULL,
	[CategoryImage] [varchar](max) NULL,
 CONSTRAINT [PK_Category_1] PRIMARY KEY CLUSTERED 
(	[CategoryId] ))

CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerId] [int] NOT NULL,
	[ManufacturerName] [varchar](50) NOT NULL,
	[ManufacturerDesc] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Manufacturer_1] PRIMARY KEY CLUSTERED 
(	[ManufacturerId] ))

CREATE TABLE [dbo].[UserDetail](
	[UserId] [bigint] NOT NULL IDENTITY(1, 1),
	[UserName] [varchar](50) NOT NULL,
	[Password] [char](128) NOT NULL,
	[Salt] [char](128) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[EmailId] [varchar](50) NOT NULL UNIQUE,
	[MobileNo] [bigint] NOT NULL UNIQUE,
 CONSTRAINT [PK_UserDetail_1] PRIMARY KEY CLUSTERED 
(	[UserId] ))

CREATE TABLE [dbo].[ShippingAddress](
	[AddressId] [bigint] NOT NULL,
	[HouseNo] [varchar](20) NOT NULL,
	[Street] [varchar](20) NOT NULL,
	[PostalCode] [varchar](6) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ShippingAddress_1] PRIMARY KEY CLUSTERED 
(	[AddressId] ))
