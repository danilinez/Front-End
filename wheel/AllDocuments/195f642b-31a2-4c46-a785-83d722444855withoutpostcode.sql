USE [MedicolegalDB]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Speciality](
	[iSpecialityID] [int] IDENTITY(1,1) NOT NULL,
	[sTitle] [varchar](500) NULL,
	[iContactID] [int] NULL,
	[iUserTypeID] [int] NULL,
	[dtCreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[iSpecialityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Speciality] ON
INSERT [dbo].[Speciality] ([iSpecialityID], [sTitle], [iContactID], [iUserTypeID], [dtCreatedDate]) VALUES (60, N'Msc Doctor', 8, 2, CAST(0x0000A1A800000000 AS DateTime))
INSERT [dbo].[Speciality] ([iSpecialityID], [sTitle], [iContactID], [iUserTypeID], [dtCreatedDate]) VALUES (67, N'Msc Math', 8, 2, CAST(0x0000A1A800000000 AS DateTime))
INSERT [dbo].[Speciality] ([iSpecialityID], [sTitle], [iContactID], [iUserTypeID], [dtCreatedDate]) VALUES (71, N'msc english', 8, 2, CAST(0x0000A1A800000000 AS DateTime))
INSERT [dbo].[Speciality] ([iSpecialityID], [sTitle], [iContactID], [iUserTypeID], [dtCreatedDate]) VALUES (95, N'Msc homeconomics', 8, 2, CAST(0x0000A1A800000000 AS DateTime))
INSERT [dbo].[Speciality] ([iSpecialityID], [sTitle], [iContactID], [iUserTypeID], [dtCreatedDate]) VALUES (96, N'Msc stat', 8, 2, CAST(0x0000A1A800000000 AS DateTime))
INSERT [dbo].[Speciality] ([iSpecialityID], [sTitle], [iContactID], [iUserTypeID], [dtCreatedDate]) VALUES (97, N'Msc math from Usa', 8, 2, CAST(0x0000A1A800000000 AS DateTime))
INSERT [dbo].[Speciality] ([iSpecialityID], [sTitle], [iContactID], [iUserTypeID], [dtCreatedDate]) VALUES (101, N'Msc IA', 8, 2, CAST(0x0000A1A800000000 AS DateTime))
INSERT [dbo].[Speciality] ([iSpecialityID], [sTitle], [iContactID], [iUserTypeID], [dtCreatedDate]) VALUES (115, N'msc doctiriate', 8, 2, CAST(0x0000A1A900000000 AS DateTime))
INSERT [dbo].[Speciality] ([iSpecialityID], [sTitle], [iContactID], [iUserTypeID], [dtCreatedDate]) VALUES (116, N'msc doctiriate', 7, 2, CAST(0x0000A1A900000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Speciality] OFF
/****** Object:  Table [dbo].[UserType]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserType](
	[iUserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[sTypeName] [varchar](500) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[iUserTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserType] ON
INSERT [dbo].[UserType] ([iUserTypeID], [sTypeName]) VALUES (1, N'Administrator')
INSERT [dbo].[UserType] ([iUserTypeID], [sTypeName]) VALUES (2, N'Doctor')
INSERT [dbo].[UserType] ([iUserTypeID], [sTypeName]) VALUES (3, N'Pharmacist')
INSERT [dbo].[UserType] ([iUserTypeID], [sTypeName]) VALUES (4, N'Patient')
SET IDENTITY_INSERT [dbo].[UserType] OFF
/****** Object:  Table [dbo].[CompanyType]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyType](
	[iCompanyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[sTypeName] [varchar](500) NULL,
	[iAdminCompanyID] [int] NULL,
 CONSTRAINT [PK_CompanyType] PRIMARY KEY CLUSTERED 
(
	[iCompanyTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyType] ON
INSERT [dbo].[CompanyType] ([iCompanyTypeID], [sTypeName], [iAdminCompanyID]) VALUES (1, N'Hospital', 1)
INSERT [dbo].[CompanyType] ([iCompanyTypeID], [sTypeName], [iAdminCompanyID]) VALUES (7, N'Pharmacist', 1)
SET IDENTITY_INSERT [dbo].[CompanyType] OFF
/****** Object:  UserDefinedFunction [dbo].[FindDistance]    Script Date: 05/03/2013 11:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FindDistance]
( 
@lat1 decimal(8,4), 
@long1 decimal(8,4), 
@lat2 decimal(8,4), 
@long2 decimal(8,4)
) 

RETURNS decimal(28,10)
AS
BEGIN

DECLARE @d decimal(28,10) 

SET @d = 3956.55 * ( Atan(Sqrt(1 - power(((Sin(@lat1/57.2958) * Sin(@lat2/57.2958)) + (Cos(@lat1/57.2958) * Cos(@lat2/57.2958) * Cos((@long2/57.2958) - (@long1/57.2958)))), 2)) / ((Sin(@lat1/57.2958) * Sin(@lat2/57.2958)) + (Cos(@lat1/57.2958) * Cos(@lat2/57.2958) * Cos((@long2/57.2958) - (@long1/57.2958))))))

RETURN @d

END
GO
/****** Object:  Table [dbo].[AdminCompanies]    Script Date: 05/03/2013 11:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminCompanies](
	[iAdminCompanyID] [int] IDENTITY(1,1) NOT NULL,
	[sCompanyName] [varchar](500) NULL,
	[sEmail] [varchar](500) NULL,
	[sAddress] [varchar](500) NULL,
	[sPostCode] [varchar](500) NULL,
	[dtCreatedDate] [datetime] NULL,
	[iUserID] [int] NULL,
	[btIsAdmin] [bit] NULL,
	[btIActive] [bit] NULL,
 CONSTRAINT [PK_UserCompanies] PRIMARY KEY CLUSTERED 
(
	[iAdminCompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AdminCompanies] ON
INSERT [dbo].[AdminCompanies] ([iAdminCompanyID], [sCompanyName], [sEmail], [sAddress], [sPostCode], [dtCreatedDate], [iUserID], [btIsAdmin], [btIActive]) VALUES (1, N'WHCS', N'whcs@gmail.com', N'newyark city.', N'10001', CAST(0x0000A18300000000 AS DateTime), 1, 1, 1)
INSERT [dbo].[AdminCompanies] ([iAdminCompanyID], [sCompanyName], [sEmail], [sAddress], [sPostCode], [dtCreatedDate], [iUserID], [btIsAdmin], [btIActive]) VALUES (2, N'Searup', N'searup@gmail.com', N'asa', N'24', CAST(0x0000A18300000000 AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[AdminCompanies] OFF
/****** Object:  StoredProcedure [dbo].[_ExecuteSQL]    Script Date: 05/03/2013 11:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[_ExecuteSQL]
 
@query varchar(MAX)
As
Begin

Exec(@query)
END
GO
/****** Object:  Table [dbo].[DoctorDocuments]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DoctorDocuments](
	[iDoctorDocumentID] [int] IDENTITY(1,1) NOT NULL,
	[sTitle] [varchar](500) NULL,
	[sDescription] [varchar](max) NULL,
	[dtDateCreated] [datetime] NULL,
	[iAdminCompanyID] [int] NULL,
	[iContactID] [int] NULL,
	[sDocumentPath] [varchar](max) NULL,
 CONSTRAINT [PK_DoctorDocuments] PRIMARY KEY CLUSTERED 
(
	[iDoctorDocumentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DoctorDocuments] ON
INSERT [dbo].[DoctorDocuments] ([iDoctorDocumentID], [sTitle], [sDescription], [dtDateCreated], [iAdminCompanyID], [iContactID], [sDocumentPath]) VALUES (1, N'CV', N'My CV', CAST(0x0000A1B2013FC818 AS DateTime), 1, 7, N'03fd4b42-f3fb-4931-8760-093cf384ea79doodadsQuickRefCSharp.pdf')
INSERT [dbo].[DoctorDocuments] ([iDoctorDocumentID], [sTitle], [sDescription], [dtDateCreated], [iAdminCompanyID], [iContactID], [sDocumentPath]) VALUES (2, N'CV', N'My CV', CAST(0x0000A1B201415ECA AS DateTime), 1, 7, N'b87ad2a7-411e-46a6-8535-bb3145f4eb5cdoodadsQuickRefCSharp.pdf')
INSERT [dbo].[DoctorDocuments] ([iDoctorDocumentID], [sTitle], [sDescription], [dtDateCreated], [iAdminCompanyID], [iContactID], [sDocumentPath]) VALUES (3, N'CV', N'My documents', CAST(0x0000A1B300A0CA21 AS DateTime), 1, 8, N'b0af7793-3777-41d6-9999-b8bb736525c6hammad')
INSERT [dbo].[DoctorDocuments] ([iDoctorDocumentID], [sTitle], [sDescription], [dtDateCreated], [iAdminCompanyID], [iContactID], [sDocumentPath]) VALUES (4, N'CV', N'cv', CAST(0x0000A1B300A78611 AS DateTime), 1, 7, N'2db05745-ae8f-472e-919f-3c8c791fa3acdoodadsQuickRefCSharp.pdf')
INSERT [dbo].[DoctorDocuments] ([iDoctorDocumentID], [sTitle], [sDescription], [dtDateCreated], [iAdminCompanyID], [iContactID], [sDocumentPath]) VALUES (5, N'CV', N'cv', CAST(0x0000A1B300A8566C AS DateTime), 1, 7, N'178383c1-f18c-4d20-9664-f95ed6880218doodadsQuickRefCSharp.pdf')
INSERT [dbo].[DoctorDocuments] ([iDoctorDocumentID], [sTitle], [sDescription], [dtDateCreated], [iAdminCompanyID], [iContactID], [sDocumentPath]) VALUES (6, N'CV', N'cv', CAST(0x0000A1B300A86C2D AS DateTime), 1, 7, N'36822dcc-a80b-4134-88e3-8e23e1ed1d31doodadsQuickRefCSharp.pdf')
INSERT [dbo].[DoctorDocuments] ([iDoctorDocumentID], [sTitle], [sDescription], [dtDateCreated], [iAdminCompanyID], [iContactID], [sDocumentPath]) VALUES (7, N'My cases', N'History of my all cases', CAST(0x0000A1B300BB24DE AS DateTime), 1, 7, N'8776e8a5-ed50-4913-8a8f-11681a9e1cc6doodadsQuickRefCSharp.pdf')
INSERT [dbo].[DoctorDocuments] ([iDoctorDocumentID], [sTitle], [sDescription], [dtDateCreated], [iAdminCompanyID], [iContactID], [sDocumentPath]) VALUES (8, N'My cases', N'History of my all cases', CAST(0x0000A1B300BB3741 AS DateTime), 1, 7, N'82b72c41-56cf-4e4b-9a9a-9baad2ce9a67doodadsQuickRefCSharp.pdf')
SET IDENTITY_INSERT [dbo].[DoctorDocuments] OFF
/****** Object:  StoredProcedure [dbo].[proc_PharmsistUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PharmsistUpdate]
(
	@iPharamID int,
	@sCompanyName varchar(500) = NULL,
	@sEmail varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@sFirstName varchar(500) = NULL,
	@sLastName varchar(500) = NULL,
	@sPostCode varchar(500) = NULL,
	@iUserID int = NULL,
	@dtCreatedDate datetime = NULL,
	@iAdminCompanyID int = NULL,
	@iCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Pharmsist]
	SET
		[sCompanyName] = @sCompanyName,
		[sEmail] = @sEmail,
		[sAddress] = @sAddress,
		[sFirstName] = @sFirstName,
		[sLastName] = @sLastName,
		[sPostCode] = @sPostCode,
		[iUserID] = @iUserID,
		[dtCreatedDate] = @dtCreatedDate,
		[iAdminCompanyID] = @iAdminCompanyID,
		[iCompanyID] = @iCompanyID
	WHERE
		[iPharamID] = @iPharamID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PharmsistLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PharmsistLoadByPrimaryKey]
(
	@iPharamID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iPharamID],
		[sCompanyName],
		[sEmail],
		[sAddress],
		[sFirstName],
		[sLastName],
		[sPostCode],
		[iUserID],
		[dtCreatedDate],
		[iAdminCompanyID],
		[iCompanyID]
	FROM [Pharmsist]
	WHERE
		([iPharamID] = @iPharamID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PharmsistLoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PharmsistLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iPharamID],
		[sCompanyName],
		[sEmail],
		[sAddress],
		[sFirstName],
		[sLastName],
		[sPostCode],
		[iUserID],
		[dtCreatedDate],
		[iAdminCompanyID],
		[iCompanyID]
	FROM [Pharmsist]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PharmsistInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PharmsistInsert]
(
	@iPharamID int = NULL output,
	@sCompanyName varchar(500) = NULL,
	@sEmail varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@sFirstName varchar(500) = NULL,
	@sLastName varchar(500) = NULL,
	@sPostCode varchar(500) = NULL,
	@iUserID int = NULL,
	@dtCreatedDate datetime = NULL,
	@iAdminCompanyID int = NULL,
	@iCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Pharmsist]
	(
		[sCompanyName],
		[sEmail],
		[sAddress],
		[sFirstName],
		[sLastName],
		[sPostCode],
		[iUserID],
		[dtCreatedDate],
		[iAdminCompanyID],
		[iCompanyID]
	)
	VALUES
	(
		@sCompanyName,
		@sEmail,
		@sAddress,
		@sFirstName,
		@sLastName,
		@sPostCode,
		@iUserID,
		@dtCreatedDate,
		@iAdminCompanyID,
		@iCompanyID
	)

	SET @Err = @@Error

	SELECT @iPharamID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PharmsistDelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PharmsistDelete]
(
	@iPharamID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Pharmsist]
	WHERE
		[iPharamID] = @iPharamID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CustomersUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CustomersUpdate]
(
	@iCustomerID int,
	@iUserID int = NULL,
	@sFirstName varchar(500) = NULL,
	@sLastName varchar(500) = NULL,
	@sEmail varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@sPostcode varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@iAdminCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Customers]
	SET
		[iUserID] = @iUserID,
		[sFirstName] = @sFirstName,
		[sLastName] = @sLastName,
		[sEmail] = @sEmail,
		[sAddress] = @sAddress,
		[sPostcode] = @sPostcode,
		[dtCreatedDate] = @dtCreatedDate,
		[iAdminCompanyID] = @iAdminCompanyID
	WHERE
		[iCustomerID] = @iCustomerID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CustomersLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CustomersLoadByPrimaryKey]
(
	@iCustomerID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iCustomerID],
		[iUserID],
		[sFirstName],
		[sLastName],
		[sEmail],
		[sAddress],
		[sPostcode],
		[dtCreatedDate],
		[iAdminCompanyID]
	FROM [Customers]
	WHERE
		([iCustomerID] = @iCustomerID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CustomersLoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CustomersLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iCustomerID],
		[iUserID],
		[sFirstName],
		[sLastName],
		[sEmail],
		[sAddress],
		[sPostcode],
		[dtCreatedDate],
		[iAdminCompanyID]
	FROM [Customers]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CustomersInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CustomersInsert]
(
	@iCustomerID int = NULL output,
	@iUserID int = NULL,
	@sFirstName varchar(500) = NULL,
	@sLastName varchar(500) = NULL,
	@sEmail varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@sPostcode varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@iAdminCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Customers]
	(
		[iUserID],
		[sFirstName],
		[sLastName],
		[sEmail],
		[sAddress],
		[sPostcode],
		[dtCreatedDate],
		[iAdminCompanyID]
	)
	VALUES
	(
		@iUserID,
		@sFirstName,
		@sLastName,
		@sEmail,
		@sAddress,
		@sPostcode,
		@dtCreatedDate,
		@iAdminCompanyID
	)

	SET @Err = @@Error

	SELECT @iCustomerID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CustomersDelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CustomersDelete]
(
	@iCustomerID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Customers]
	WHERE
		[iCustomerID] = @iCustomerID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[MyAppointments]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MyAppointments]
  @query varchar(MAX) 
AS
BEGIN
 Exec(@query)
END
GO
/****** Object:  StoredProcedure [dbo].[MyAppointment]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MyAppointment]
  @query varchar(MAX) 
AS
BEGIN
 Exec(@query)
END
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[iOrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[sStatus] [varchar](500) NULL,
	[iAdminCompanyID] [int] NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[iOrderStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON
INSERT [dbo].[OrderStatus] ([iOrderStatusID], [sStatus], [iAdminCompanyID]) VALUES (1, N'Filling At Pharmacy', 1)
INSERT [dbo].[OrderStatus] ([iOrderStatusID], [sStatus], [iAdminCompanyID]) VALUES (2, N'Ready to be shipped', 1)
INSERT [dbo].[OrderStatus] ([iOrderStatusID], [sStatus], [iAdminCompanyID]) VALUES (3, N'Pharmacy Hold', 1)
INSERT [dbo].[OrderStatus] ([iOrderStatusID], [sStatus], [iAdminCompanyID]) VALUES (4, N'Void By Customer Service', 1)
INSERT [dbo].[OrderStatus] ([iOrderStatusID], [sStatus], [iAdminCompanyID]) VALUES (5, N'Black Listed', 1)
INSERT [dbo].[OrderStatus] ([iOrderStatusID], [sStatus], [iAdminCompanyID]) VALUES (6, N'Un Curable', 1)
INSERT [dbo].[OrderStatus] ([iOrderStatusID], [sStatus], [iAdminCompanyID]) VALUES (7, N'Black List', 1)
INSERT [dbo].[OrderStatus] ([iOrderStatusID], [sStatus], [iAdminCompanyID]) VALUES (8, N'Complete', 1)
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
/****** Object:  StoredProcedure [dbo].[PostCodeExists]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PostCodeExists]
@MyPostCode as varchar(500)
as 
Begin

declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)

set @Latitude = 0
set @Longitude = 0
--set @MyPostCode = 'E2M5S9'

DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END
IF((SELECT COUNT(*) FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode) <> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
END
IF((SELECT COUNT(*) FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode) <> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
set @Longitude =(SELECT top 1 nLongitude FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode))= @MyPostCode)
END
ELSE
BEGIN
set @Temp='0'
END

select @MyPostCode sPostCode,@Latitude nLat,@Longitude nLong


end
GO
/****** Object:  StoredProcedure [dbo].[proc_DoctorDocumentsUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DoctorDocumentsUpdate]
(
	@iDoctorDocumentID int,
	@sTitle varchar(500) = NULL,
	@sDescription varchar(MAX) = NULL,
	@dtDateCreated datetime = NULL,
	@iAdminCompanyID int = NULL,
	@iContactID int = NULL,
	@sDocumentPath varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DoctorDocuments]
	SET
		[sTitle] = @sTitle,
		[sDescription] = @sDescription,
		[dtDateCreated] = @dtDateCreated,
		[iAdminCompanyID] = @iAdminCompanyID,
		[iContactID] = @iContactID,
		[sDocumentPath] = @sDocumentPath
	WHERE
		[iDoctorDocumentID] = @iDoctorDocumentID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_DoctorDocumentsLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DoctorDocumentsLoadByPrimaryKey]
(
	@iDoctorDocumentID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iDoctorDocumentID],
		[sTitle],
		[sDescription],
		[dtDateCreated],
		[iAdminCompanyID],
		[iContactID],
		[sDocumentPath]
	FROM [DoctorDocuments]
	WHERE
		([iDoctorDocumentID] = @iDoctorDocumentID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_DoctorDocumentsLoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DoctorDocumentsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iDoctorDocumentID],
		[sTitle],
		[sDescription],
		[dtDateCreated],
		[iAdminCompanyID],
		[iContactID],
		[sDocumentPath]
	FROM [DoctorDocuments]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_DoctorDocumentsInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DoctorDocumentsInsert]
(
	@iDoctorDocumentID int = NULL output,
	@sTitle varchar(500) = NULL,
	@sDescription varchar(MAX) = NULL,
	@dtDateCreated datetime = NULL,
	@iAdminCompanyID int = NULL,
	@iContactID int = NULL,
	@sDocumentPath varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DoctorDocuments]
	(
		[sTitle],
		[sDescription],
		[dtDateCreated],
		[iAdminCompanyID],
		[iContactID],
		[sDocumentPath]
	)
	VALUES
	(
		@sTitle,
		@sDescription,
		@dtDateCreated,
		@iAdminCompanyID,
		@iContactID,
		@sDocumentPath
	)

	SET @Err = @@Error

	SELECT @iDoctorDocumentID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_DoctorDocumentsDelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DoctorDocumentsDelete]
(
	@iDoctorDocumentID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DoctorDocuments]
	WHERE
		[iDoctorDocumentID] = @iDoctorDocumentID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_AdminCompaniesUpdate]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_AdminCompaniesUpdate]
(
	@iAdminCompanyID int,
	@sCompanyName varchar(500) = NULL,
	@sEmail varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@sPostCode varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@iUserID int = NULL,
	@btIsAdmin bit = NULL,
	@btIActive bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [AdminCompanies]
	SET
		[sCompanyName] = @sCompanyName,
		[sEmail] = @sEmail,
		[sAddress] = @sAddress,
		[sPostCode] = @sPostCode,
		[dtCreatedDate] = @dtCreatedDate,
		[iUserID] = @iUserID,
		[btIsAdmin] = @btIsAdmin,
		[btIActive] = @btIActive
	WHERE
		[iAdminCompanyID] = @iAdminCompanyID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_AdminCompaniesLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_AdminCompaniesLoadByPrimaryKey]
(
	@iAdminCompanyID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iAdminCompanyID],
		[sCompanyName],
		[sEmail],
		[sAddress],
		[sPostCode],
		[dtCreatedDate],
		[iUserID],
		[btIsAdmin],
		[btIActive]
	FROM [AdminCompanies]
	WHERE
		([iAdminCompanyID] = @iAdminCompanyID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_AdminCompaniesLoadAll]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_AdminCompaniesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iAdminCompanyID],
		[sCompanyName],
		[sEmail],
		[sAddress],
		[sPostCode],
		[dtCreatedDate],
		[iUserID],
		[btIsAdmin],
		[btIActive]
	FROM [AdminCompanies]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_AdminCompaniesInsert]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_AdminCompaniesInsert]
(
	@iAdminCompanyID int = NULL output,
	@sCompanyName varchar(500) = NULL,
	@sEmail varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@sPostCode varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@iUserID int = NULL,
	@btIsAdmin bit = NULL,
	@btIActive bit = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [AdminCompanies]
	(
		[sCompanyName],
		[sEmail],
		[sAddress],
		[sPostCode],
		[dtCreatedDate],
		[iUserID],
		[btIsAdmin],
		[btIActive]
	)
	VALUES
	(
		@sCompanyName,
		@sEmail,
		@sAddress,
		@sPostCode,
		@dtCreatedDate,
		@iUserID,
		@btIsAdmin,
		@btIActive
	)

	SET @Err = @@Error

	SELECT @iAdminCompanyID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_AdminCompaniesDelete]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_AdminCompaniesDelete]
(
	@iAdminCompanyID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [AdminCompanies]
	WHERE
		[iAdminCompanyID] = @iAdminCompanyID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CompanyTypeUpdate]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CompanyTypeUpdate]
(
	@iCompanyTypeID int,
	@sTypeName varchar(500) = NULL,
	@iAdminCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CompanyType]
	SET
		[sTypeName] = @sTypeName,
		[iAdminCompanyID] = @iAdminCompanyID
	WHERE
		[iCompanyTypeID] = @iCompanyTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CompanyTypeLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CompanyTypeLoadByPrimaryKey]
(
	@iCompanyTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iCompanyTypeID],
		[sTypeName],
		[iAdminCompanyID]
	FROM [CompanyType]
	WHERE
		([iCompanyTypeID] = @iCompanyTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CompanyTypeLoadAll]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CompanyTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iCompanyTypeID],
		[sTypeName],
		[iAdminCompanyID]
	FROM [CompanyType]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CompanyTypeInsert]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CompanyTypeInsert]
(
	@iCompanyTypeID int = NULL output,
	@sTypeName varchar(500) = NULL,
	@iAdminCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CompanyType]
	(
		[sTypeName],
		[iAdminCompanyID]
	)
	VALUES
	(
		@sTypeName,
		@iAdminCompanyID
	)

	SET @Err = @@Error

	SELECT @iCompanyTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CompanyTypeDelete]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CompanyTypeDelete]
(
	@iCompanyTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CompanyType]
	WHERE
		[iCompanyTypeID] = @iCompanyTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[distance_lat_lon]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[distance_lat_lon]
@MyPostCode as varchar(500)
as 
Begin

declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)

set @Latitude = 0
set @Longitude = 0
--set @MyPostCode = 'E2M5S9'

DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END
IF((SELECT COUNT(*) FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode) <> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
END
IF((SELECT COUNT(*) FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode) <> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
set @Longitude =(SELECT top 1 nLongitude FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode))= @MyPostCode)
END
ELSE
BEGIN
set @Temp='0'
END

select @MyPostCode sPostCode,@Latitude nLat,@Longitude nLong


end
GO
/****** Object:  Table [dbo].[Company]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[iCompanyID] [int] IDENTITY(1,1) NOT NULL,
	[iUserID] [int] NULL,
	[sCompanyName] [varchar](500) NULL,
	[sEmail] [varchar](500) NULL,
	[sAddress] [varchar](500) NULL,
	[sPostcode] [varchar](500) NULL,
	[sCountry] [varchar](500) NULL,
	[dtCreatedDate] [datetime] NULL,
	[btIsActive] [bit] NULL,
	[iAdminCompanyID] [int] NULL,
	[iCompanyTypeID] [int] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[iCompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (1, 1, N'Jinah Hospital', N'zia@gmail.com', N'abc', N'23423', N'United States', CAST(0x0000A19B01039EE9 AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (2, 1, N'Fazal Din Pharmacy', N'FazalDin@gmail.com', N'123 Main Gulberg 999', N'E2M5S9', N'Canada', CAST(0x0000A19B0120F9B0 AS DateTime), 1, 1, 7)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (5, 1, N'WHCS', N'adeel289@gmail.com', N'123 adddress', N'A0C1W0', N'Canada', CAST(0x0000A19B0120ED29 AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (7, 1, N'WHCS13', N'zia289@gmail.com', N'hhh', N'E2M5S8', N'Canada', CAST(0x0000A19B01037862 AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (16, 1, N'Shukat Khanam', N'zia@gmail.com', N'Gulbarg', N'10007', N'United States', CAST(0x0000A19B0112A3DE AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (17, 1, N'DHQ Lahore', N'adeel289@gmail.com', N'123 adddress', N'E2M5S9', N'Canada', CAST(0x0000A19B012370E8 AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (21, 1, N'Hajaz', N'adeel289@gmail.com', N' adddress', N'E2M5S9', N'Canada', CAST(0x0000A19C00B1C148 AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (23, 1, N'umar', N'umarjavaid58@gmail.com', N'lahore', N'G3J1M3', N'United States', CAST(0x0000A19D00E44C6B AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (24, 1, N'DHQ MIANWALI', N'zia@gmail.com', N'abc', N'10007', N'United States', CAST(0x0000A19D012DAE06 AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (25, 1, N'General Hospital', N'adeel289@gmail.com', N'123 adddress', N'E2M5S9', N'United States', CAST(0x0000A19E00A97E10 AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (26, 1, N'lemen max', N'lemen@gmail.com', N'123 adddress', N'E2M5X3', N'Canada', CAST(0x0000A19E01038BA5 AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (27, 1, N'G hospital Kamar Mushani', N'zia@gmail.com', N'qw', N'10008', N'United States', CAST(0x0000A1A800841603 AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (28, 1, N'Shaikh Ziad Hospital', N'ziad@gmail.com', N'Lahore', N'71486', N'United States', CAST(0x0000A1A801688CF5 AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (29, 1, N'Trag City', N'tragg@gmail.com', N'abc', N'A0A1L0', N'Canada', CAST(0x0000A1A8016E90F3 AS DateTime), 1, 1, 1)
INSERT [dbo].[Company] ([iCompanyID], [iUserID], [sCompanyName], [sEmail], [sAddress], [sPostcode], [sCountry], [dtCreatedDate], [btIsActive], [iAdminCompanyID], [iCompanyTypeID]) VALUES (32, 1, N'Hamza Hospital', N'hamza@gmail.com', N'123 Hamaz Hospital', N'A0B2P0', N'Canada', CAST(0x0000A1AD0139D1EA AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Company] OFF
/****** Object:  StoredProcedure [dbo].[proc_SpecialityUpdate]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_SpecialityUpdate]
(
	@iSpecialityID int,
	@sTitle varchar(500) = NULL,
	@iContactID int = NULL,
	@iUserTypeID int = NULL,
	@dtCreatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Speciality]
	SET
		[sTitle] = @sTitle,
		[iContactID] = @iContactID,
		[iUserTypeID] = @iUserTypeID,
		[dtCreatedDate] = @dtCreatedDate
	WHERE
		[iSpecialityID] = @iSpecialityID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_SpecialityLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_SpecialityLoadByPrimaryKey]
(
	@iSpecialityID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iSpecialityID],
		[sTitle],
		[iContactID],
		[iUserTypeID],
		[dtCreatedDate]
	FROM [Speciality]
	WHERE
		([iSpecialityID] = @iSpecialityID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_SpecialityLoadAll]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_SpecialityLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iSpecialityID],
		[sTitle],
		[iContactID],
		[iUserTypeID],
		[dtCreatedDate]
	FROM [Speciality]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_SpecialityInsert]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_SpecialityInsert]
(
	@iSpecialityID int = NULL output,
	@sTitle varchar(500) = NULL,
	@iContactID int = NULL,
	@iUserTypeID int = NULL,
	@dtCreatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Speciality]
	(
		[sTitle],
		[iContactID],
		[iUserTypeID],
		[dtCreatedDate]
	)
	VALUES
	(
		@sTitle,
		@iContactID,
		@iUserTypeID,
		@dtCreatedDate
	)

	SET @Err = @@Error

	SELECT @iSpecialityID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_SpecialityDelete]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_SpecialityDelete]
(
	@iSpecialityID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Speciality]
	WHERE
		[iSpecialityID] = @iSpecialityID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UserTypeUpdate]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UserTypeUpdate]
(
	@iUserTypeID int,
	@sTypeName varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [UserType]
	SET
		[sTypeName] = @sTypeName
	WHERE
		[iUserTypeID] = @iUserTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UserTypeLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UserTypeLoadByPrimaryKey]
(
	@iUserTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iUserTypeID],
		[sTypeName]
	FROM [UserType]
	WHERE
		([iUserTypeID] = @iUserTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UserTypeLoadAll]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UserTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iUserTypeID],
		[sTypeName]
	FROM [UserType]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UserTypeInsert]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UserTypeInsert]
(
	@iUserTypeID int = NULL output,
	@sTypeName varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [UserType]
	(
		[sTypeName]
	)
	VALUES
	(
		@sTypeName
	)

	SET @Err = @@Error

	SELECT @iUserTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UserTypeDelete]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UserTypeDelete]
(
	@iUserTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [UserType]
	WHERE
		[iUserTypeID] = @iUserTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductType](
	[iProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[sType] [varchar](500) NULL,
	[iAdminCompanyID] [int] NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[iProductTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON
INSERT [dbo].[ProductType] ([iProductTypeID], [sType], [iAdminCompanyID]) VALUES (1, N'Tablets', 1)
INSERT [dbo].[ProductType] ([iProductTypeID], [sType], [iAdminCompanyID]) VALUES (3, N'business', 2)
INSERT [dbo].[ProductType] ([iProductTypeID], [sType], [iAdminCompanyID]) VALUES (5, N'tablet', 2)
INSERT [dbo].[ProductType] ([iProductTypeID], [sType], [iAdminCompanyID]) VALUES (8, N'Injections', 1)
INSERT [dbo].[ProductType] ([iProductTypeID], [sType], [iAdminCompanyID]) VALUES (10, N'Syrups', 1)
INSERT [dbo].[ProductType] ([iProductTypeID], [sType], [iAdminCompanyID]) VALUES (25, N'Operation Equipments', 1)
INSERT [dbo].[ProductType] ([iProductTypeID], [sType], [iAdminCompanyID]) VALUES (26, N'Syringes', 1)
INSERT [dbo].[ProductType] ([iProductTypeID], [sType], [iAdminCompanyID]) VALUES (38, N'Skin Cream', 1)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[iUserID] [int] IDENTITY(1,1) NOT NULL,
	[sUserName] [varchar](500) NULL,
	[sPassword] [varchar](500) NULL,
	[sName] [varchar](500) NULL,
	[dtCreatedDate] [datetime] NULL,
	[sEmail] [varchar](500) NULL,
	[iUserTypeID] [int] NULL,
	[btIsActive] [bit] NULL,
	[iAdminCompanyID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[iUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (1, N'a', N'a', N'Administrator', CAST(0x0000A18300000000 AS DateTime), N'adeel289@gmail.com', 1, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (2, N'zia', N'zia', N'Administrator', CAST(0x0000A18300000000 AS DateTime), N'zia@gmail.com', 1, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (5, N'akbar', N'akbar', N'Dr. Akbar Shah', CAST(0x0000A18900ED0F0B AS DateTime), N'akbar@gmail.com', 2, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (6, N'moona', N'123', N'Dr. Moona darling', CAST(0x0000A18900ED3B9B AS DateTime), N'moonar_darling@darling.com', 2, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (7, N'mark', N'mark', N'Dr. Mark Davis', CAST(0x0000A18900ED6C58 AS DateTime), N'mark@davis.com', 2, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (8, N'lkent', N'lkent', N'Kent Luise', CAST(0x0000A18900EDF07F AS DateTime), N'luise@kent.com', 3, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (9, N'aasas', N'123', N'QANDILA JOHNSON', CAST(0x0000A18E01071F24 AS DateTime), N'QANDILA@GMAIL.COM', 4, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (10, N'jabbar', N'123344', N'Jabbar Khan', CAST(0x0000A18E01183282 AS DateTime), N'jabbar@gmail.com', 4, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (11, N'johnz', N'johnz', N'John Zapata', CAST(0x0000A198012318D0 AS DateTime), N'joahn@zapata.com', 3, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (12, N'zeenata', N'123', N'Dr. Zeenat Amaan', CAST(0x0000A19A0118680C AS DateTime), N'zeenat@aman.com', 2, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (13, N'goris', N'123', N'Ghori Sing', CAST(0x0000A19A0118D19B AS DateTime), N'goori@sing.com', 3, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (15, N'john', N'123', N'DR.JOHN SMITH', CAST(0x0000A19D00E4E01B AS DateTime), N'ABC@HOTMAIL.COM', 2, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (16, N'saeed', N'saeed', N'Dr.saeed khan', CAST(0x0000A19E00CB7BE5 AS DateTime), N'saeed@gmail.com', 2, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (23, N'sajid', N'sajid', N'sajid khan', CAST(0x0000A1A801751E37 AS DateTime), N'sajid@gmail.com', 3, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (28, N'nazir', N'123', N'Nazir khan', CAST(0x0000A1A9000CCFEA AS DateTime), N'nazir@gmail.com', 3, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (29, N'isaeel', N'133', N'ismaeel khan', CAST(0x0000A1A9000D36BA AS DateTime), N'ismaeel@gmail.com', 3, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (31, N'munir', N'asad', N'Munir khan', CAST(0x0000A1A900390466 AS DateTime), N'munir@gmail.com', 4, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (32, N'jabir ', N'jabir', N'Jabir khan', CAST(0x0000A1A900404189 AS DateTime), N'jabir@gmail.com', 4, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (33, N'munir', N'123', N'Munir Khan', CAST(0x0000A1A90041F0EA AS DateTime), N'munir@gmail.com', 4, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (35, N'ABBASSS', N'FGFG', N'abbass khan', CAST(0x0000A1A900498FFF AS DateTime), N'ABAS@gmail.com', 4, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (36, N'SSD', N'SSD', N'abbass ER45R', CAST(0x0000A1A90049C6F7 AS DateTime), N'ER@GMAIL.COM', 4, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (37, N'munir', N'asad', N'GJ FGJ', CAST(0x0000A1A9004A892F AS DateTime), N'DJFDS@FGJ.COM', 4, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (39, N'FGH', N'GFHFH', N'T6YU YU', CAST(0x0000A1A9004B21A8 AS DateTime), N'ABAS@gmail.comFG', 4, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (41, N'ismaeel', N'123', N'Dr.Ismaeel khan', CAST(0x0000A1B200A2ED69 AS DateTime), N'ismaeel@gmail.com', 2, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (42, N'alvi', N'123', N'Abdul Subhan alvi', CAST(0x0000A1B200A358B6 AS DateTime), N'alvi@gmail.com', 3, 1, 1)
INSERT [dbo].[Users] ([iUserID], [sUserName], [sPassword], [sName], [dtCreatedDate], [sEmail], [iUserTypeID], [btIsActive], [iAdminCompanyID]) VALUES (43, N'aslam', N'aslam', N'aslam khan', CAST(0x0000A1B20129D58E AS DateTime), N'aslam@gmail.com', 4, 1, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  StoredProcedure [dbo].[proc_PostCodeUSA_CAUpdate]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PostCodeUSA_CAUpdate]
(
	@iSerialNo int,
	@sPostCode varchar(500) = NULL,
	@sCity varchar(500) = NULL,
	@sState varchar(500) = NULL,
	@nLatitude numeric(18,10) = NULL,
	@nLongitude numeric(18,10) = NULL,
	@sCounty varchar(500) = NULL,
	@sCountry varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PostCodeUSA_CA]
	SET
		[sPostCode] = @sPostCode,
		[sCity] = @sCity,
		[sState] = @sState,
		[nLatitude] = @nLatitude,
		[nLongitude] = @nLongitude,
		[sCounty] = @sCounty,
		[sCountry] = @sCountry
	WHERE
		[iSerialNo] = @iSerialNo


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PostCodeUSA_CALoadByPrimaryKey]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PostCodeUSA_CALoadByPrimaryKey]
(
	@iSerialNo int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iSerialNo],
		[sPostCode],
		[sCity],
		[sState],
		[nLatitude],
		[nLongitude],
		[sCounty],
		[sCountry]
	FROM [PostCodeUSA_CA]
	WHERE
		([iSerialNo] = @iSerialNo)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PostCodeUSA_CALoadAll]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PostCodeUSA_CALoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iSerialNo],
		[sPostCode],
		[sCity],
		[sState],
		[nLatitude],
		[nLongitude],
		[sCounty],
		[sCountry]
	FROM [PostCodeUSA_CA]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PostCodeUSA_CAInsert]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PostCodeUSA_CAInsert]
(
	@iSerialNo int = NULL output,
	@sPostCode varchar(500) = NULL,
	@sCity varchar(500) = NULL,
	@sState varchar(500) = NULL,
	@nLatitude numeric(18,10) = NULL,
	@nLongitude numeric(18,10) = NULL,
	@sCounty varchar(500) = NULL,
	@sCountry varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PostCodeUSA_CA]
	(
		[sPostCode],
		[sCity],
		[sState],
		[nLatitude],
		[nLongitude],
		[sCounty],
		[sCountry]
	)
	VALUES
	(
		@sPostCode,
		@sCity,
		@sState,
		@nLatitude,
		@nLongitude,
		@sCounty,
		@sCountry
	)

	SET @Err = @@Error

	SELECT @iSerialNo = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PostCodeUSA_CADelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PostCodeUSA_CADelete]
(
	@iSerialNo int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PostCodeUSA_CA]
	WHERE
		[iSerialNo] = @iSerialNo
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[MyLocationPostCode]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MyLocationPostCode]--'E2M5S9',15,1
 @MyPostCode as varchar(500)
 ,@Radius as numeric(18,5),
  @AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)

declare @iCompanyTypeID as int
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
set @iCompanyTypeID=0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END
Else
BEGIN
set @Temp='0'
END



IF @Temp<>'0'
  
 -- select scity as 'title',nLatitude as 'lat',nLingitude as 'lng','Hospital Name: <b style="color:#00688B;font-weight:bold;font-size:11px; align=left;">'+sCity+'</a></b>'+'<br/> Location: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sAddress+'</b>'+'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)'+'<br/>PostCode: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sPostCode+'</b>'  as 'description' from (

	select '' as 'title',nLatitude as 'lat',nLongitude as 'lng','' as 'description' from PostCodeUSA_CA where sPostCode= @MyPostCode
			
End
GO
/****** Object:  StoredProcedure [dbo].[proc_CompanyUpdate]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CompanyUpdate]
(
	@iCompanyID int,
	@iUserID int = NULL,
	@sCompanyName varchar(500) = NULL,
	@sEmail varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@sPostcode varchar(500) = NULL,
	@sCountry varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@btIsActive bit = NULL,
	@iAdminCompanyID int = NULL,
	@iCompanyTypeID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Company]
	SET
		[iUserID] = @iUserID,
		[sCompanyName] = @sCompanyName,
		[sEmail] = @sEmail,
		[sAddress] = @sAddress,
		[sPostcode] = @sPostcode,
		[sCountry] = @sCountry,
		[dtCreatedDate] = @dtCreatedDate,
		[btIsActive] = @btIsActive,
		[iAdminCompanyID] = @iAdminCompanyID,
		[iCompanyTypeID] = @iCompanyTypeID
	WHERE
		[iCompanyID] = @iCompanyID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[iProductID] [int] IDENTITY(1,1) NOT NULL,
	[sName] [varchar](500) NULL,
	[sDescription] [varchar](max) NULL,
	[nPrice] [numeric](18, 2) NULL,
	[nTax] [numeric](18, 2) NULL,
	[iAdminCompanyID] [int] NULL,
	[dtCreatedDate] [datetime] NULL,
	[iProductTypeID] [int] NULL,
	[sProductCode] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[iProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([iProductID], [sName], [sDescription], [nPrice], [nTax], [iAdminCompanyID], [dtCreatedDate], [iProductTypeID], [sProductCode]) VALUES (3, N'Panadol', N'Panadol', CAST(10.00 AS Numeric(18, 2)), CAST(5.00 AS Numeric(18, 2)), 1, CAST(0x0000A194010EC918 AS DateTime), 1, N'MART-009')
INSERT [dbo].[Products] ([iProductID], [sName], [sDescription], [nPrice], [nTax], [iAdminCompanyID], [dtCreatedDate], [iProductTypeID], [sProductCode]) VALUES (5, N'Asparol', N'Asparol', CAST(23.00 AS Numeric(18, 2)), CAST(4.00 AS Numeric(18, 2)), 1, CAST(0x0000A194010EDBD8 AS DateTime), 1, N'ASP-6565')
INSERT [dbo].[Products] ([iProductID], [sName], [sDescription], [nPrice], [nTax], [iAdminCompanyID], [dtCreatedDate], [iProductTypeID], [sProductCode]) VALUES (15, N'Favicol', N'Favicol', CAST(34.67 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)), 1, CAST(0x0000A19400B47350 AS DateTime), 8, N'7865')
INSERT [dbo].[Products] ([iProductID], [sName], [sDescription], [nPrice], [nTax], [iAdminCompanyID], [dtCreatedDate], [iProductTypeID], [sProductCode]) VALUES (16, N'Bonita', N'Bonita', CAST(55.67 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), 1, CAST(0x0000A19400B48AC0 AS DateTime), 8, N'4433')
INSERT [dbo].[Products] ([iProductID], [sName], [sDescription], [nPrice], [nTax], [iAdminCompanyID], [dtCreatedDate], [iProductTypeID], [sProductCode]) VALUES (17, N'Ponston Fort', N'Ponston Fort', CAST(13.00 AS Numeric(18, 2)), CAST(5.00 AS Numeric(18, 2)), 1, CAST(0x0000A19400B4B874 AS DateTime), 1, N'2233')
INSERT [dbo].[Products] ([iProductID], [sName], [sDescription], [nPrice], [nTax], [iAdminCompanyID], [dtCreatedDate], [iProductTypeID], [sProductCode]) VALUES (18, N'Ciezer', N'Ciezer', CAST(119.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), 1, CAST(0x0000A19B01104270 AS DateTime), 25, N'Ciezer-11')
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  StoredProcedure [dbo].[proc_UsersUpdate]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UsersUpdate]
(
	@iUserID int,
	@sUserName varchar(500) = NULL,
	@sPassword varchar(500) = NULL,
	@sName varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@sEmail varchar(500) = NULL,
	@iUserTypeID int = NULL,
	@btIsActive bit = NULL,
	@iAdminCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Users]
	SET
		[sUserName] = @sUserName,
		[sPassword] = @sPassword,
		[sName] = @sName,
		[dtCreatedDate] = @dtCreatedDate,
		[sEmail] = @sEmail,
		[iUserTypeID] = @iUserTypeID,
		[btIsActive] = @btIsActive,
		[iAdminCompanyID] = @iAdminCompanyID
	WHERE
		[iUserID] = @iUserID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UsersLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UsersLoadByPrimaryKey]
(
	@iUserID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iUserID],
		[sUserName],
		[sPassword],
		[sName],
		[dtCreatedDate],
		[sEmail],
		[iUserTypeID],
		[btIsActive],
		[iAdminCompanyID]
	FROM [Users]
	WHERE
		([iUserID] = @iUserID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UsersLoadAll]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UsersLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iUserID],
		[sUserName],
		[sPassword],
		[sName],
		[dtCreatedDate],
		[sEmail],
		[iUserTypeID],
		[btIsActive],
		[iAdminCompanyID]
	FROM [Users]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UsersInsert]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UsersInsert]
(
	@iUserID int = NULL output,
	@sUserName varchar(500) = NULL,
	@sPassword varchar(500) = NULL,
	@sName varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@sEmail varchar(500) = NULL,
	@iUserTypeID int = NULL,
	@btIsActive bit = NULL,
	@iAdminCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Users]
	(
		[sUserName],
		[sPassword],
		[sName],
		[dtCreatedDate],
		[sEmail],
		[iUserTypeID],
		[btIsActive],
		[iAdminCompanyID]
	)
	VALUES
	(
		@sUserName,
		@sPassword,
		@sName,
		@dtCreatedDate,
		@sEmail,
		@iUserTypeID,
		@btIsActive,
		@iAdminCompanyID
	)

	SET @Err = @@Error

	SELECT @iUserID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_UsersDelete]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UsersDelete]
(
	@iUserID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Users]
	WHERE
		[iUserID] = @iUserID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderStatusUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderStatusUpdate]
(
	@iOrderStatusID int,
	@sStatus varchar(500) = NULL,
	@iAdminCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [OrderStatus]
	SET
		[sStatus] = @sStatus,
		[iAdminCompanyID] = @iAdminCompanyID
	WHERE
		[iOrderStatusID] = @iOrderStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderStatusLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderStatusLoadByPrimaryKey]
(
	@iOrderStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iOrderStatusID],
		[sStatus],
		[iAdminCompanyID]
	FROM [OrderStatus]
	WHERE
		([iOrderStatusID] = @iOrderStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderStatusLoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderStatusLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iOrderStatusID],
		[sStatus],
		[iAdminCompanyID]
	FROM [OrderStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderStatusInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderStatusInsert]
(
	@iOrderStatusID int = NULL output,
	@sStatus varchar(500) = NULL,
	@iAdminCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [OrderStatus]
	(
		[sStatus],
		[iAdminCompanyID]
	)
	VALUES
	(
		@sStatus,
		@iAdminCompanyID
	)

	SET @Err = @@Error

	SELECT @iOrderStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderStatusDelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderStatusDelete]
(
	@iOrderStatusID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [OrderStatus]
	WHERE
		[iOrderStatusID] = @iOrderStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductTypeUpdate]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ProductTypeUpdate]
(
	@iProductTypeID int,
	@sType varchar(500) = NULL,
	@iAdminCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [ProductType]
	SET
		[sType] = @sType,
		[iAdminCompanyID] = @iAdminCompanyID
	WHERE
		[iProductTypeID] = @iProductTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductTypeLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ProductTypeLoadByPrimaryKey]
(
	@iProductTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iProductTypeID],
		[sType],
		[iAdminCompanyID]
	FROM [ProductType]
	WHERE
		([iProductTypeID] = @iProductTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductTypeLoadAll]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ProductTypeLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iProductTypeID],
		[sType],
		[iAdminCompanyID]
	FROM [ProductType]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductTypeInsert]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ProductTypeInsert]
(
	@iProductTypeID int = NULL output,
	@sType varchar(500) = NULL,
	@iAdminCompanyID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [ProductType]
	(
		[sType],
		[iAdminCompanyID]
	)
	VALUES
	(
		@sType,
		@iAdminCompanyID
	)

	SET @Err = @@Error

	SELECT @iProductTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductTypeDelete]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ProductTypeDelete]
(
	@iProductTypeID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [ProductType]
	WHERE
		[iProductTypeID] = @iProductTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[iContactID] [int] IDENTITY(1,1) NOT NULL,
	[sFirstName] [varchar](500) NULL,
	[sLastName] [varchar](500) NULL,
	[sEmail] [varchar](500) NULL,
	[sAddress] [varchar](500) NULL,
	[sPhone] [varchar](500) NULL,
	[sUserName] [varchar](500) NULL,
	[sPassword] [varchar](500) NULL,
	[iUserID] [int] NULL,
	[iAdminCompanyID] [int] NULL,
	[dtCreatedDate] [datetime] NULL,
	[btIsActive] [bit] NULL,
	[sPostcode] [varchar](500) NULL,
	[iCompanyID] [int] NULL,
	[iUserTypeID] [int] NULL,
	[sGender] [varchar](50) NULL,
	[dtDateOfBirth] [datetime] NULL,
	[sCountry] [varchar](500) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[iContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (6, N'Dr. Akbar', N'Shah', N'akbar@gmail.com', N'123 Akber road', N'342342111', N'akbar', N'akbar', 5, 1, CAST(0x0000A18900ED0F0B AS DateTime), 1, N'10007', 1, 2, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (7, N'Dr. Moona', N'Darling', N'moonar@darling.com', N'333 moona @ darling road', N'342342145', N'moona', N'123', 6, 1, CAST(0x0000A18900ED3B9B AS DateTime), 1, N'12312', 1, 2, N'Female', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (8, N'Dr. Mark', N'Davis', N'mark@davis.com', N'232 Mrk Street', N'342342134', N'mark', N'mark', 7, 1, CAST(0x0000A18900ED6C58 AS DateTime), 1, N'74646', 1, 2, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (9, N'Kent', N'Luise', N'luise@kent.com', N'445 north evenue', N'34234234', N'lkent', N'lkent', 8, 1, CAST(0x0000A18900EDF07F AS DateTime), 1, N'10004', 2, 3, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (10, N'QANDILA', N'JOHNSON', N'QANDILA@GMAIL.COM', N'11234, St Johnson Park', N'2346567', N'aasas', N'123', 9, 1, CAST(0x0000A18E01071F24 AS DateTime), 1, N'T1X0A1', NULL, 4, N'Male', CAST(0x00008C7A00000000 AS DateTime), N'Canada')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (11, N'Jabbar', N'Khan', N'jabbar@gmail.com', N'44321 CT, Vacant Road', N'342342111', N'jabbar', N'123344', 10, 1, CAST(0x0000A18E01183282 AS DateTime), 1, N'44321', NULL, 4, N'Male', CAST(0x00007CE600000000 AS DateTime), N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (12, N'John', N'Zapata', N'joahn@zapata.com', N'111 John Zapata St. Milk ', NULL, N'johnz', N'johnz', 11, 1, CAST(0x0000A198012318D0 AS DateTime), 1, N'22580', 1, 3, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (13, N'Dr. Zeenat', N'Amaan', N'zeenat@aman.com', N'123 zeenat aman road KHI', NULL, N'zeenata', N'123', 12, 1, CAST(0x0000A19A011867C5 AS DateTime), 1, N'E2M5X3', 2, 2, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (14, N'Ghori', N'Sing', N'goori@sing.com', N'333 Gori Sing Avenue NY', NULL, N'goris', N'123', 13, 1, CAST(0x0000A19A0118D19B AS DateTime), 1, N'10008', 5, 3, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (16, N'DR.JOHN', N'SMITH', N'ABC@HOTMAIL.COM', N'john', NULL, N'john', N'123', 15, 1, CAST(0x0000A19D00E4E01B AS DateTime), 1, N'10008', 23, 2, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (17, N'Dr.saeed', N'khan', N'saeed@gmail.com', N'abc', NULL, N'saeed', N'saeed', 16, 1, CAST(0x0000A19E00CB7B46 AS DateTime), 1, N'10007', 1, 2, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (24, N'sajid', N'khan', N'sajid@gmail.com', N'BXZ', NULL, N'sajid', N'sajid', 23, 1, CAST(0x0000A1A801751E37 AS DateTime), 1, N'T1X0A1', 24, 3, N'Male', NULL, N'Canada')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (29, N'Nazir', N'khan', N'nazir@gmail.com', N'11234, St Johnson Park', NULL, N'nazir', N'123', 28, 1, CAST(0x0000A1A9000CCFEA AS DateTime), 1, N'10008', 21, 3, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (30, N'ismaeel', N'khan', N'ismaeel@gmail.com', N'11234, St Johnson Park', NULL, N'isaeel', N'133', 29, 1, CAST(0x0000A1A9000D36BA AS DateTime), 1, N'10008', 27, 3, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (32, N'Munir', N'khan', N'munir@gmail.com', N'11234, St Johnson Park', NULL, N'munir', N'asad', 31, 1, CAST(0x0000A1A900390466 AS DateTime), 1, N'T1X0A1', NULL, 4, N'Male', CAST(0x00008C7900000000 AS DateTime), N'Canada')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (33, N'Jabir', N'khan', N'jabir@gmail.com', N'GulBarg', N'923234369027', N'jabir ', N'jabir', 32, 1, CAST(0x0000A1A900404189 AS DateTime), 1, N'T1X0A1', NULL, 4, N'Male', CAST(0x00007F9E00000000 AS DateTime), N'Canada')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (34, N'Munir', N'Khan', N'munir@gmail.com', N'bbbb', NULL, N'munir', N'123', 33, 1, CAST(0x0000A1A90041EB71 AS DateTime), 1, N'10007', NULL, 4, N'Male', CAST(0x00007F9E00000000 AS DateTime), N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (36, N'abbass', N'khan', N'ABAS@gmail.com', N'GG', N'4554445455454', N'ABBASSS', N'FGFG', 35, 1, CAST(0x0000A1A900498FFF AS DateTime), 1, N'1008', NULL, 4, N'Male', CAST(0x00008C7A00000000 AS DateTime), N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (37, N'abbass', N'ER45R', N'ER@GMAIL.COM', N'SD', N'67676576575676', N'SSD', N'SSD', 36, 1, CAST(0x0000A1A90049C6F7 AS DateTime), 1, N'10005', NULL, 4, N'Male', CAST(0x00008C7700000000 AS DateTime), N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (38, N'GJ', N'FGJ', N'DJFDS@FGJ.COM', N'DSF', NULL, N'munir', N'asad', 37, 1, CAST(0x0000A1A9004A892F AS DateTime), 1, N'T1X0A1', NULL, 4, N'Male', CAST(0x0000A1A200000000 AS DateTime), N'Canada')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (40, N'T6YU', N'YU', N'ABAS@gmail.comFG', N'GHGF', NULL, N'FGH', N'GFHFH', 39, 1, CAST(0x0000A1A9004B21A8 AS DateTime), 1, N'T1X0A1', NULL, 4, N'Male', CAST(0x0000A1A100000000 AS DateTime), N'Canada')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (42, N'Dr.Ismaeel', N'khan', N'ismaeel@gmail.com', N'mia', NULL, N'ismaeel', N'123', 41, 1, CAST(0x0000A1B200A2ED69 AS DateTime), 1, N'10008', 16, 2, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (43, N'Abdul Subhan', N'alvi', N'alvi@gmail.com', N'Lahore', NULL, N'alvi', N'123', 42, 1, CAST(0x0000A1B200A358B6 AS DateTime), 1, N'10008', 17, 3, N'Male', NULL, N'United States')
INSERT [dbo].[Contacts] ([iContactID], [sFirstName], [sLastName], [sEmail], [sAddress], [sPhone], [sUserName], [sPassword], [iUserID], [iAdminCompanyID], [dtCreatedDate], [btIsActive], [sPostcode], [iCompanyID], [iUserTypeID], [sGender], [dtDateOfBirth], [sCountry]) VALUES (44, N'aslam', N'khan', N'aslam@gmail.com', N'mia', N'344334343434', N'aslam', N'aslam', 43, 1, CAST(0x0000A1B20129D58E AS DateTime), 1, N'10001', NULL, 4, N'Male', CAST(0x0000A1AE00000000 AS DateTime), N'United States')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
/****** Object:  StoredProcedure [dbo].[proc_CompanyLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CompanyLoadByPrimaryKey]
(
	@iCompanyID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iCompanyID],
		[iUserID],
		[sCompanyName],
		[sEmail],
		[sAddress],
		[sPostcode],
		[sCountry],
		[dtCreatedDate],
		[btIsActive],
		[iAdminCompanyID],
		[iCompanyTypeID]
	FROM [Company]
	WHERE
		([iCompanyID] = @iCompanyID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CompanyLoadAll]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CompanyLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iCompanyID],
		[iUserID],
		[sCompanyName],
		[sEmail],
		[sAddress],
		[sPostcode],
		[sCountry],
		[dtCreatedDate],
		[btIsActive],
		[iAdminCompanyID],
		[iCompanyTypeID]
	FROM [Company]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CompanyInsert]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CompanyInsert]
(
	@iCompanyID int = NULL output,
	@iUserID int = NULL,
	@sCompanyName varchar(500) = NULL,
	@sEmail varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@sPostcode varchar(500) = NULL,
	@sCountry varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@btIsActive bit = NULL,
	@iAdminCompanyID int = NULL,
	@iCompanyTypeID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Company]
	(
		[iUserID],
		[sCompanyName],
		[sEmail],
		[sAddress],
		[sPostcode],
		[sCountry],
		[dtCreatedDate],
		[btIsActive],
		[iAdminCompanyID],
		[iCompanyTypeID]
	)
	VALUES
	(
		@iUserID,
		@sCompanyName,
		@sEmail,
		@sAddress,
		@sPostcode,
		@sCountry,
		@dtCreatedDate,
		@btIsActive,
		@iAdminCompanyID,
		@iCompanyTypeID
	)

	SET @Err = @@Error

	SELECT @iCompanyID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CompanyDelete]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CompanyDelete]
(
	@iCompanyID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Company]
	WHERE
		[iCompanyID] = @iCompanyID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[HospitalOnMAP]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[HospitalOnMAP]--'E2M5S9',15,1
 @MyPostCode as varchar(500)
 ,@Radius as numeric(18,5),
  @AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)

declare @iCompanyTypeID as int
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
set @iCompanyTypeID=0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END
Else
BEGIN
set @Temp='0'
END



IF @Temp<>'0'
           SET @iCompanyTypeID=(select top 1 iCompanyTypeID from CompanyType where sTypeName like '%Hospital%')
			select sAddress as 'title',nLatitude as 'lat', (case when sCountry='United States' then (Case when nLongitude<0 then nLongitude else (-nLongitude) END) Else nLongitude END) as 'lng','Hospital Name: <b style="color:#00688B;font-weight:bold;font-size:11px; align=left;">'+Hospital+'</a></b>'+'<br/> Location: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sAddress+'</b>'+'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)'+'<br/>PostCode: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sPostCode+'</b>'  as 'description' from (
			select (case when 1=1 then (select top 1 ISNULL(sCompanyName,'') from Company where iCompanyTypeID =@iCompanyTypeID ) ELSE '' END) as Hospital,sAddress,
			 sPostCode,
			
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			,sCountry
			from Company objLV 
			) as t1 where Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) < @Radius 

	

	
End
GO
/****** Object:  Table [dbo].[NewsFeeds]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsFeeds](
	[iNewsID] [int] IDENTITY(1,1) NOT NULL,
	[sNewsTitle] [varchar](500) NULL,
	[sImageName] [varchar](max) NULL,
	[sNewsDescription] [varchar](500) NULL,
	[dtPostingDate] [datetime] NULL,
	[dtCreatedDate] [datetime] NULL,
	[iAdminCompanyID] [int] NULL,
	[iUserID] [int] NULL,
	[IuserTypeID] [int] NULL,
 CONSTRAINT [PK_NewsFeeds] PRIMARY KEY CLUSTERED 
(
	[iNewsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[NewsFeeds] ON
INSERT [dbo].[NewsFeeds] ([iNewsID], [sNewsTitle], [sImageName], [sNewsDescription], [dtPostingDate], [dtCreatedDate], [iAdminCompanyID], [iUserID], [IuserTypeID]) VALUES (82, N'Quiad DAY', N'21341635-416b-4e96-9e41-22100c45c73dErro_Message.png', N'WEREWRWEWEC WER RWERWE', CAST(0x0000A1A300000000 AS DateTime), CAST(0x0000A1AD01040D0C AS DateTime), 1, 1, 0)
INSERT [dbo].[NewsFeeds] ([iNewsID], [sNewsTitle], [sImageName], [sNewsDescription], [dtPostingDate], [dtCreatedDate], [iAdminCompanyID], [iUserID], [IuserTypeID]) VALUES (88, N'Yoma defa', N'0a567593-11d4-4f69-aa72-d4a6761b52d2Desert.jpg', N'Linez Technologies is a leading developer of client server environment and provides information technology services with the cost effective and quick custom software development.Linez Technologies is a leading developer of client server environment and provides information technology services with the cost effective and quick custom software development.Linez Technologies is a leading developer of client server environment and provides information technology services with the cost effective and', CAST(0x0000A1AA00000000 AS DateTime), CAST(0x0000A1AF00F1F6F8 AS DateTime), 1, 1, 0)
INSERT [dbo].[NewsFeeds] ([iNewsID], [sNewsTitle], [sImageName], [sNewsDescription], [dtPostingDate], [dtCreatedDate], [iAdminCompanyID], [iUserID], [IuserTypeID]) VALUES (90, N'23 March', N'3dccd2bb-b00c-4dbe-9708-af7ef27ac984Jellyfish.jpg', N'Linez Technologies is a leading developer of client server environment and provides information technology services with the cost effective and quick custom software development.Linez Technologies is a leading developer of client server environment and provides information technology services with the cost effective and quick custom software development.Linez Technologies is a leading developer of client server environment and provides information technology services with the cost effective and', CAST(0x0000A1AB00000000 AS DateTime), CAST(0x0000A1AF00F2088C AS DateTime), 1, 1, 0)
INSERT [dbo].[NewsFeeds] ([iNewsID], [sNewsTitle], [sImageName], [sNewsDescription], [dtPostingDate], [dtCreatedDate], [iAdminCompanyID], [iUserID], [IuserTypeID]) VALUES (91, N'sadsad', N'355a5039-c03c-4333-8a81-8ee9da16b94aChrysanthemum.jpg', N'sdsadas', CAST(0x0000A1A800000000 AS DateTime), CAST(0x0000A1AF00F3429C AS DateTime), 1, 1, 0)
INSERT [dbo].[NewsFeeds] ([iNewsID], [sNewsTitle], [sImageName], [sNewsDescription], [dtPostingDate], [dtCreatedDate], [iAdminCompanyID], [iUserID], [IuserTypeID]) VALUES (92, N'dsfd', N'bd9e2153-b471-4d49-8a8b-0387fc59c226Penguins.jpg', N'sfsdfs', CAST(0x0000A1A300000000 AS DateTime), CAST(0x0000A1AF00F3C258 AS DateTime), 1, 1, 0)
INSERT [dbo].[NewsFeeds] ([iNewsID], [sNewsTitle], [sImageName], [sNewsDescription], [dtPostingDate], [dtCreatedDate], [iAdminCompanyID], [iUserID], [IuserTypeID]) VALUES (95, N'wewq', N'0ea2f495-2b1f-4654-b31c-1be20a651096Tulips.jpg', N'wqewqe', CAST(0x0000A1BE00000000 AS DateTime), CAST(0x0000A1B1009F64B0 AS DateTime), 1, 1, 0)
SET IDENTITY_INSERT [dbo].[NewsFeeds] OFF
/****** Object:  Table [dbo].[PatientDocuments]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientDocuments](
	[iPatientDocuments] [int] IDENTITY(1,1) NOT NULL,
	[sTitle] [varchar](500) NULL,
	[sDescription] [varchar](500) NULL,
	[dtDateCreated] [datetime] NULL,
	[iAdminCompanyID] [int] NULL,
	[iPatientID] [int] NULL,
	[imagePath] [varchar](500) NULL,
 CONSTRAINT [PK_PatientDocuments] PRIMARY KEY CLUSTERED 
(
	[iPatientDocuments] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PatientDocuments] ON
INSERT [dbo].[PatientDocuments] ([iPatientDocuments], [sTitle], [sDescription], [dtDateCreated], [iAdminCompanyID], [iPatientID], [imagePath]) VALUES (75, N'ssss', N'aaaaa', CAST(0x0000A1B300B4C154 AS DateTime), 1, 6, N'05283827-0d7f-4c23-8ce2-f7b912b9064eMyPdfDownload.pdf')
INSERT [dbo].[PatientDocuments] ([iPatientDocuments], [sTitle], [sDescription], [dtDateCreated], [iAdminCompanyID], [iPatientID], [imagePath]) VALUES (79, N'abc', N'acbdefgh', CAST(0x0000A1B2017D452D AS DateTime), 1, 6, N'2f4a032a-30be-4dd5-8849-5a7c63127068MyPdfDownload.pdf')
SET IDENTITY_INSERT [dbo].[PatientDocuments] OFF
/****** Object:  Table [dbo].[LinkedVenue]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LinkedVenue](
	[iVenueID] [int] IDENTITY(1,1) NOT NULL,
	[iContactID] [int] NULL,
	[sPostCode] [varchar](500) NULL,
	[sAddress] [varchar](500) NULL,
	[dtCreatedDate] [datetime] NULL,
	[sLocationName] [varchar](500) NULL,
	[iUserTypeID] [int] NULL,
	[sPhoneNumber] [varchar](500) NULL,
	[sMobile] [varchar](500) NULL,
	[iAdminCompanyID] [int] NULL,
	[sCountry] [varchar](500) NULL,
 CONSTRAINT [PK_LinkedVenue] PRIMARY KEY CLUSTERED 
(
	[iVenueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LinkedVenue] ON
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (39, 7, N'E2P1J4', N'920 Red Head Rd  Saint John NB E2P1J4', CAST(0x0000A19800EA35AD AS DateTime), N'ST. Gorge', 2, NULL, NULL, 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (40, 7, N'51001', N'Akron Municipal Airport, Akron, IA 51001, USA', CAST(0x0000A19800E9F0AF AS DateTime), N'Akron Municipal Airport', 2, NULL, NULL, 1, N'United States')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (41, 9, N'B4V2Z9', N'123 Kent Evenue', CAST(0x0000A1980126E6C9 AS DateTime), N'kent', 3, N'83745892', N'0897384759', 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (42, 9, N'E2P1J4', N'123 St Paul Road', CAST(0x0000A198013010D0 AS DateTime), N'Mark St. Paul', 3, N'28347298', N'232323', 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (43, 6, N'E2M3Y5', N'1700 Manawagonish Rd, Saint John, NB E2M 3Y5', CAST(0x0000A19800EAAEE4 AS DateTime), N'Saint John Animal Hospital  ', 2, NULL, NULL, 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (48, 12, N'K1G3Y6', N'1785 Alta Vista Drive Ottawa', CAST(0x0000A19E01034C70 AS DateTime), N'Canadian Pharmacists Association', 3, N'1-800-917-9489 ', N'613-523-7877 ext. 501', 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (52, 9, N'E2M5X3', N'123 adddress', CAST(0x0000A19B01298894 AS DateTime), N'Islamabad', 3, N'4545565656', N'5656546456', 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (53, 12, N'E2M5X3', N'123 adddress', CAST(0x0000A19B012997D0 AS DateTime), N'Islamabad', 3, N'456555656', N'4565456456', 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (54, 7, N'E2M5X3', N'123 adddress', CAST(0x0000A19B01241CD3 AS DateTime), N'Lukky Marwat', 2, NULL, NULL, 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (55, 12, N'E2M5S9', N'123 abc', CAST(0x0000A1A800878528 AS DateTime), N'Islamabad', 3, N'45566777', N'343434344', 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (56, 16, N'A0A1L0', N'123 TRY', CAST(0x0000A1A301696385 AS DateTime), N'Salmon Cove Bdv', 2, NULL, NULL, 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (61, 8, N'T2P4W6', N'123 Davis road, Calgary ', CAST(0x0000A1A3003044C3 AS DateTime), N'Markus Calgary ', 2, NULL, NULL, 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (62, 16, N'T2J6Z5', N'333 Johnson Road, Calgary', CAST(0x0000A1A30030DAF7 AS DateTime), N'John Clagary', 2, NULL, NULL, 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (63, 17, N'A0A1L0', N'ss', CAST(0x0000A1A4004E41E6 AS DateTime), N'aaa', 2, NULL, NULL, 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (64, 13, N'T1X0A1', N'abc', CAST(0x0000A1A80086DCD8 AS DateTime), N'New York', 2, NULL, NULL, 1, N'Canada')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (70, 13, N'10008', N'7th Floor Office# 706, Al-Hafeez Shopping Mall Gulberg III', CAST(0x0000A1B200A425C1 AS DateTime), N'Faisal Abad', 2, NULL, NULL, 1, N'United States')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (71, 30, N'10008', N'7th Floor Office# 706, Al-Hafeez Shopping Mall Gulberg III', CAST(0x0000A1B200A46279 AS DateTime), N'Bakkar', 3, N'923234369027', N'923234369027', 1, N'United States')
INSERT [dbo].[LinkedVenue] ([iVenueID], [iContactID], [sPostCode], [sAddress], [dtCreatedDate], [sLocationName], [iUserTypeID], [sPhoneNumber], [sMobile], [iAdminCompanyID], [sCountry]) VALUES (74, 8, N'10005', N'bbb', CAST(0x0000A1B200D5FF66 AS DateTime), N'bbb', 2, NULL, NULL, 1, N'United States')
SET IDENTITY_INSERT [dbo].[LinkedVenue] OFF
/****** Object:  StoredProcedure [dbo].[proc_ContactsUpdate]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ContactsUpdate]
(
	@iContactID int,
	@sFirstName varchar(500) = NULL,
	@sLastName varchar(500) = NULL,
	@sEmail varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@sPhone varchar(500) = NULL,
	@sUserName varchar(500) = NULL,
	@sPassword varchar(500) = NULL,
	@iUserID int = NULL,
	@iAdminCompanyID int = NULL,
	@dtCreatedDate datetime = NULL,
	@btIsActive bit = NULL,
	@sPostcode varchar(500) = NULL,
	@iCompanyID int = NULL,
	@iUserTypeID int = NULL,
	@sGender varchar(50) = NULL,
	@dtDateOfBirth datetime = NULL,
	@sCountry varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Contacts]
	SET
		[sFirstName] = @sFirstName,
		[sLastName] = @sLastName,
		[sEmail] = @sEmail,
		[sAddress] = @sAddress,
		[sPhone] = @sPhone,
		[sUserName] = @sUserName,
		[sPassword] = @sPassword,
		[iUserID] = @iUserID,
		[iAdminCompanyID] = @iAdminCompanyID,
		[dtCreatedDate] = @dtCreatedDate,
		[btIsActive] = @btIsActive,
		[sPostcode] = @sPostcode,
		[iCompanyID] = @iCompanyID,
		[iUserTypeID] = @iUserTypeID,
		[sGender] = @sGender,
		[dtDateOfBirth] = @dtDateOfBirth,
		[sCountry] = @sCountry
	WHERE
		[iContactID] = @iContactID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ContactsLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ContactsLoadByPrimaryKey]
(
	@iContactID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iContactID],
		[sFirstName],
		[sLastName],
		[sEmail],
		[sAddress],
		[sPhone],
		[sUserName],
		[sPassword],
		[iUserID],
		[iAdminCompanyID],
		[dtCreatedDate],
		[btIsActive],
		[sPostcode],
		[iCompanyID],
		[iUserTypeID],
		[sGender],
		[dtDateOfBirth],
		[sCountry]
	FROM [Contacts]
	WHERE
		([iContactID] = @iContactID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ContactsLoadAll]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ContactsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iContactID],
		[sFirstName],
		[sLastName],
		[sEmail],
		[sAddress],
		[sPhone],
		[sUserName],
		[sPassword],
		[iUserID],
		[iAdminCompanyID],
		[dtCreatedDate],
		[btIsActive],
		[sPostcode],
		[iCompanyID],
		[iUserTypeID],
		[sGender],
		[dtDateOfBirth],
		[sCountry]
	FROM [Contacts]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ContactsInsert]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ContactsInsert]
(
	@iContactID int = NULL output,
	@sFirstName varchar(500) = NULL,
	@sLastName varchar(500) = NULL,
	@sEmail varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@sPhone varchar(500) = NULL,
	@sUserName varchar(500) = NULL,
	@sPassword varchar(500) = NULL,
	@iUserID int = NULL,
	@iAdminCompanyID int = NULL,
	@dtCreatedDate datetime = NULL,
	@btIsActive bit = NULL,
	@sPostcode varchar(500) = NULL,
	@iCompanyID int = NULL,
	@iUserTypeID int = NULL,
	@sGender varchar(50) = NULL,
	@dtDateOfBirth datetime = NULL,
	@sCountry varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Contacts]
	(
		[sFirstName],
		[sLastName],
		[sEmail],
		[sAddress],
		[sPhone],
		[sUserName],
		[sPassword],
		[iUserID],
		[iAdminCompanyID],
		[dtCreatedDate],
		[btIsActive],
		[sPostcode],
		[iCompanyID],
		[iUserTypeID],
		[sGender],
		[dtDateOfBirth],
		[sCountry]
	)
	VALUES
	(
		@sFirstName,
		@sLastName,
		@sEmail,
		@sAddress,
		@sPhone,
		@sUserName,
		@sPassword,
		@iUserID,
		@iAdminCompanyID,
		@dtCreatedDate,
		@btIsActive,
		@sPostcode,
		@iCompanyID,
		@iUserTypeID,
		@sGender,
		@dtDateOfBirth,
		@sCountry
	)

	SET @Err = @@Error

	SELECT @iContactID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ContactsDelete]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ContactsDelete]
(
	@iContactID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Contacts]
	WHERE
		[iContactID] = @iContactID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_NewsFeedsUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_NewsFeedsUpdate]
(
	@iNewsID int,
	@sNewsTitle varchar(500) = NULL,
	@sImageName varchar(MAX) = NULL,
	@sNewsDescription varchar(500) = NULL,
	@dtPostingDate datetime = NULL,
	@dtCreatedDate datetime = NULL,
	@iAdminCompanyID int = NULL,
	@iUserID int = NULL,
	@IuserTypeID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [NewsFeeds]
	SET
		[sNewsTitle] = @sNewsTitle,
		[sImageName] = @sImageName,
		[sNewsDescription] = @sNewsDescription,
		[dtPostingDate] = @dtPostingDate,
		[dtCreatedDate] = @dtCreatedDate,
		[iAdminCompanyID] = @iAdminCompanyID,
		[iUserID] = @iUserID,
		[IuserTypeID] = @IuserTypeID
	WHERE
		[iNewsID] = @iNewsID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_NewsFeedsLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_NewsFeedsLoadByPrimaryKey]
(
	@iNewsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iNewsID],
		[sNewsTitle],
		[sImageName],
		[sNewsDescription],
		[dtPostingDate],
		[dtCreatedDate],
		[iAdminCompanyID],
		[iUserID],
		[IuserTypeID]
	FROM [NewsFeeds]
	WHERE
		([iNewsID] = @iNewsID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_NewsFeedsLoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_NewsFeedsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iNewsID],
		[sNewsTitle],
		[sImageName],
		[sNewsDescription],
		[dtPostingDate],
		[dtCreatedDate],
		[iAdminCompanyID],
		[iUserID],
		[IuserTypeID]
	FROM [NewsFeeds]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_NewsFeedsInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_NewsFeedsInsert]
(
	@iNewsID int = NULL output,
	@sNewsTitle varchar(500) = NULL,
	@sImageName varchar(MAX) = NULL,
	@sNewsDescription varchar(500) = NULL,
	@dtPostingDate datetime = NULL,
	@dtCreatedDate datetime = NULL,
	@iAdminCompanyID int = NULL,
	@iUserID int = NULL,
	@IuserTypeID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [NewsFeeds]
	(
		[sNewsTitle],
		[sImageName],
		[sNewsDescription],
		[dtPostingDate],
		[dtCreatedDate],
		[iAdminCompanyID],
		[iUserID],
		[IuserTypeID]
	)
	VALUES
	(
		@sNewsTitle,
		@sImageName,
		@sNewsDescription,
		@dtPostingDate,
		@dtCreatedDate,
		@iAdminCompanyID,
		@iUserID,
		@IuserTypeID
	)

	SET @Err = @@Error

	SELECT @iNewsID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_NewsFeedsDelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_NewsFeedsDelete]
(
	@iNewsID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [NewsFeeds]
	WHERE
		[iNewsID] = @iNewsID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductsUpdate]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ProductsUpdate]
(
	@iProductID int,
	@sName varchar(500) = NULL,
	@sDescription varchar(MAX) = NULL,
	@nPrice numeric(18,2) = NULL,
	@nTax numeric(18,2) = NULL,
	@iAdminCompanyID int = NULL,
	@dtCreatedDate datetime = NULL,
	@iProductTypeID int = NULL,
	@sProductCode varchar(500)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Products]
	SET
		[sName] = @sName,
		[sDescription] = @sDescription,
		[nPrice] = @nPrice,
		[nTax] = @nTax,
		[iAdminCompanyID] = @iAdminCompanyID,
		[dtCreatedDate] = @dtCreatedDate,
		[iProductTypeID] = @iProductTypeID,
		[sProductCode] = @sProductCode
	WHERE
		[iProductID] = @iProductID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductsLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ProductsLoadByPrimaryKey]
(
	@iProductID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iProductID],
		[sName],
		[sDescription],
		[nPrice],
		[nTax],
		[iAdminCompanyID],
		[dtCreatedDate],
		[iProductTypeID],
		[sProductCode]
	FROM [Products]
	WHERE
		([iProductID] = @iProductID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductsLoadAll]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ProductsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iProductID],
		[sName],
		[sDescription],
		[nPrice],
		[nTax],
		[iAdminCompanyID],
		[dtCreatedDate],
		[iProductTypeID],
		[sProductCode]
	FROM [Products]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductsInsert]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ProductsInsert]
(
	@iProductID int = NULL output,
	@sName varchar(500) = NULL,
	@sDescription varchar(MAX) = NULL,
	@nPrice numeric(18,2) = NULL,
	@nTax numeric(18,2) = NULL,
	@iAdminCompanyID int = NULL,
	@dtCreatedDate datetime = NULL,
	@iProductTypeID int = NULL,
	@sProductCode varchar(500)
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Products]
	(
		[sName],
		[sDescription],
		[nPrice],
		[nTax],
		[iAdminCompanyID],
		[dtCreatedDate],
		[iProductTypeID],
		[sProductCode]
	)
	VALUES
	(
		@sName,
		@sDescription,
		@nPrice,
		@nTax,
		@iAdminCompanyID,
		@dtCreatedDate,
		@iProductTypeID,
		@sProductCode
	)

	SET @Err = @@Error

	SELECT @iProductID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductsDelete]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ProductsDelete]
(
	@iProductID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Products]
	WHERE
		[iProductID] = @iProductID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PatientDocumentsUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PatientDocumentsUpdate]
(
	@iPatientDocuments int,
	@sTitle varchar(500) = NULL,
	@sDescription varchar(500) = NULL,
	@dtDateCreated datetime = NULL,
	@iAdminCompanyID int = NULL,
	@iPatientID int = NULL,
	@imagePath varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PatientDocuments]
	SET
		[sTitle] = @sTitle,
		[sDescription] = @sDescription,
		[dtDateCreated] = @dtDateCreated,
		[iAdminCompanyID] = @iAdminCompanyID,
		[iPatientID] = @iPatientID,
		[imagePath] = @imagePath
	WHERE
		[iPatientDocuments] = @iPatientDocuments


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PatientDocumentsLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PatientDocumentsLoadByPrimaryKey]
(
	@iPatientDocuments int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iPatientDocuments],
		[sTitle],
		[sDescription],
		[dtDateCreated],
		[iAdminCompanyID],
		[iPatientID],
		[imagePath]
	FROM [PatientDocuments]
	WHERE
		([iPatientDocuments] = @iPatientDocuments)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PatientDocumentsLoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PatientDocumentsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iPatientDocuments],
		[sTitle],
		[sDescription],
		[dtDateCreated],
		[iAdminCompanyID],
		[iPatientID],
		[imagePath]
	FROM [PatientDocuments]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PatientDocumentsInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PatientDocumentsInsert]
(
	@iPatientDocuments int = NULL output,
	@sTitle varchar(500) = NULL,
	@sDescription varchar(500) = NULL,
	@dtDateCreated datetime = NULL,
	@iAdminCompanyID int = NULL,
	@iPatientID int = NULL,
	@imagePath varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PatientDocuments]
	(
		[sTitle],
		[sDescription],
		[dtDateCreated],
		[iAdminCompanyID],
		[iPatientID],
		[imagePath]
	)
	VALUES
	(
		@sTitle,
		@sDescription,
		@dtDateCreated,
		@iAdminCompanyID,
		@iPatientID,
		@imagePath
	)

	SET @Err = @@Error

	SELECT @iPatientDocuments = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PatientDocumentsDelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PatientDocumentsDelete]
(
	@iPatientDocuments int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PatientDocuments]
	WHERE
		[iPatientDocuments] = @iPatientDocuments
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_LinkedVenueUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_LinkedVenueUpdate]
(
	@iVenueID int,
	@iContactID int = NULL,
	@sPostCode varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@sLocationName varchar(500) = NULL,
	@iUserTypeID int = NULL,
	@sPhoneNumber varchar(500) = NULL,
	@sMobile varchar(500) = NULL,
	@iAdminCompanyID int = NULL,
	@sCountry varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [LinkedVenue]
	SET
		[iContactID] = @iContactID,
		[sPostCode] = @sPostCode,
		[sAddress] = @sAddress,
		[dtCreatedDate] = @dtCreatedDate,
		[sLocationName] = @sLocationName,
		[iUserTypeID] = @iUserTypeID,
		[sPhoneNumber] = @sPhoneNumber,
		[sMobile] = @sMobile,
		[iAdminCompanyID] = @iAdminCompanyID,
		[sCountry] = @sCountry
	WHERE
		[iVenueID] = @iVenueID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_LinkedVenueLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_LinkedVenueLoadByPrimaryKey]
(
	@iVenueID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iVenueID],
		[iContactID],
		[sPostCode],
		[sAddress],
		[dtCreatedDate],
		[sLocationName],
		[iUserTypeID],
		[sPhoneNumber],
		[sMobile],
		[iAdminCompanyID],
		[sCountry]
	FROM [LinkedVenue]
	WHERE
		([iVenueID] = @iVenueID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_LinkedVenueLoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_LinkedVenueLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iVenueID],
		[iContactID],
		[sPostCode],
		[sAddress],
		[dtCreatedDate],
		[sLocationName],
		[iUserTypeID],
		[sPhoneNumber],
		[sMobile],
		[iAdminCompanyID],
		[sCountry]
	FROM [LinkedVenue]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_LinkedVenueInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_LinkedVenueInsert]
(
	@iVenueID int = NULL output,
	@iContactID int = NULL,
	@sPostCode varchar(500) = NULL,
	@sAddress varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@sLocationName varchar(500) = NULL,
	@iUserTypeID int = NULL,
	@sPhoneNumber varchar(500) = NULL,
	@sMobile varchar(500) = NULL,
	@iAdminCompanyID int = NULL,
	@sCountry varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [LinkedVenue]
	(
		[iContactID],
		[sPostCode],
		[sAddress],
		[dtCreatedDate],
		[sLocationName],
		[iUserTypeID],
		[sPhoneNumber],
		[sMobile],
		[iAdminCompanyID],
		[sCountry]
	)
	VALUES
	(
		@iContactID,
		@sPostCode,
		@sAddress,
		@dtCreatedDate,
		@sLocationName,
		@iUserTypeID,
		@sPhoneNumber,
		@sMobile,
		@iAdminCompanyID,
		@sCountry
	)

	SET @Err = @@Error

	SELECT @iVenueID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_LinkedVenueDelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_LinkedVenueDelete]
(
	@iVenueID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [LinkedVenue]
	WHERE
		[iVenueID] = @iVenueID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[PhamrmasistPostCodeRadiusOnMAP]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PhamrmasistPostCodeRadiusOnMAP]--'E2M5S9',15,1
 @MyPostCode as varchar(500)
 ,@Radius as numeric(18,5),
  @AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END
Else
BEGIN
set @Temp='0'
END



IF @Temp<>'0'
			select sLocationName as 'title',nLatitude as 'lat', (case when sCountry='United States' then (Case when nLongitude<0 then nLongitude else (-nLongitude) END) Else nLongitude END) as 'lng','Pharmasist Name: <b style="color:#00688B;font-weight:bold;font-size:11px; align=left;">'+Pharmasist+'</a></b>'+'<br/> Location: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sLocationName+'</b>'+'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)'+'<br/>PostCode: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sPostCode+'</b>'+'<br/>Email: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sEmail+'</b>'  as 'description' from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iUserTypeID =objLV.iUserTypeID ) ELSE '' END) as Pharmasist,sAddress,sPhoneNumber,
			sLocationName, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			,sCountry
			from LinkedVenue objLV where iUserTypeID=3 and  exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) < @Radius 

	

	
End
GO
/****** Object:  StoredProcedure [dbo].[HospitalOnPostCodeRadiusOnMAP]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HospitalOnPostCodeRadiusOnMAP]--'E2M5S9',15,1
 @MyPostCode as varchar(500)
 ,@Radius as numeric(18,5),
  @AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END
Else
BEGIN
set @Temp='0'
END



IF @Temp<>'0'
			select sLocationName as 'title',nLatitude as 'lat', (case when sCountry='United States' then (Case when nLongitude<0 then nLongitude else (-nLongitude) END) Else nLongitude END) as 'lng','Hospital Name: <b style="color:#00688B;font-weight:bold;font-size:11px; align=left;">'+Hospital+'</a></b>'+'<br/> Location: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sLocationName+'</b>'+'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)'+'<br/>PostCode: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sPostCode+'</b>'  as 'description' from (
			select (case when 1=1 then (select top 1 ISNULL(sCompanyName,'') from Company where iCompanyTypeID =1 ) ELSE '' END) as Hospital,sAddress,
			sLocationName, sPostCode,
			
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			,sCountry
			from LinkedVenue objLV 
			) as t1 where Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) < @Radius 

	

	
End
GO
/****** Object:  Table [dbo].[ExpertAppointments]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpertAppointments](
	[iAppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[iContactID] [int] NULL,
	[dtAppointmentDate] [datetime] NULL,
	[sTimeFrom] [varchar](500) NULL,
	[sTimeTo] [varchar](500) NULL,
	[iAdminCompanyID] [int] NULL,
	[sAppointmentStaus] [varchar](max) NULL,
	[iVenueID] [int] NULL,
	[dtCreatedDate] [datetime] NULL,
	[iUserID] [int] NULL,
 CONSTRAINT [PK_ExpertAppointments] PRIMARY KEY CLUSTERED 
(
	[iAppointmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ExpertAppointments] ON
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (1, 7, CAST(0x0000A18C00000000 AS DateTime), N'9:00 AM', N'9:10 AM', 1, NULL, 39, CAST(0x0000A18C00F15E69 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (2, 6, CAST(0x0000A18C00000000 AS DateTime), N'9:00 AM', N'9:20 AM', 1, NULL, 40, CAST(0x0000A18C00F27BC3 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (4, 6, CAST(0x0000A18C00000000 AS DateTime), N'9:10 AM', N'9:15 AM', 1, NULL, 40, CAST(0x0000A18C00FBBE82 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (6, 6, CAST(0x0000A18C00000000 AS DateTime), N'9:20 AM', N'9:25 AM', 1, NULL, 40, CAST(0x0000A18C00FBC005 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (8, 6, CAST(0x0000A18C00000000 AS DateTime), N'9:30 AM', N'9:35 AM', 1, NULL, 40, CAST(0x0000A18C00FBC1B1 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (9, 6, CAST(0x0000A18C00000000 AS DateTime), N'9:35 AM', N'9:40 AM', 1, NULL, 40, CAST(0x0000A18C00FBC21C AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (10, 6, CAST(0x0000A18C00000000 AS DateTime), N'9:40 AM', N'9:45 AM', 1, NULL, 40, CAST(0x0000A18C00FBC2F7 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (11, 6, CAST(0x0000A18C00000000 AS DateTime), N'9:45 AM', N'9:50 AM', 1, NULL, 40, CAST(0x0000A18C00FBC44B AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (12, 7, CAST(0x0000A18C00000000 AS DateTime), N'9:25 AM', N'9:45 AM', 1, NULL, 39, CAST(0x0000A18C010349CF AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (13, 7, CAST(0x0000A18C00000000 AS DateTime), N'10:05 AM', N'10:25 AM', 1, NULL, 39, CAST(0x0000A18C01035EC9 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (14, 7, CAST(0x0000A18C00000000 AS DateTime), N'10:45 AM', N'11:05 AM', 1, NULL, 39, CAST(0x0000A18C01035EF5 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (15, 7, CAST(0x0000A18C00000000 AS DateTime), N'11:25 AM', N'11:45 AM', 1, NULL, 39, CAST(0x0000A18C01035F1C AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (19, 6, CAST(0x0000A19000000000 AS DateTime), N'10:30 AM', N'10:45 AM', 1, NULL, 40, CAST(0x0000A18D00E6634D AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (20, 6, CAST(0x0000A19000000000 AS DateTime), N'11:00 AM', N'11:15 AM', 1, NULL, 40, CAST(0x0000A18D00E66361 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (21, 6, CAST(0x0000A19000000000 AS DateTime), N'11:30 AM', N'11:45 AM', 1, NULL, 40, CAST(0x0000A18D00E6636D AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (22, 6, CAST(0x0000A19000000000 AS DateTime), N'12:00 PM', N'12:15 PM', 1, NULL, 40, CAST(0x0000A18D00E66374 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (23, 6, CAST(0x0000A19000000000 AS DateTime), N'12:30 PM', N'12:45 PM', 1, NULL, 40, CAST(0x0000A18D00E6637B AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (24, 6, CAST(0x0000A19000000000 AS DateTime), N'1:00 PM', N'1:15 PM', 1, NULL, 40, CAST(0x0000A18D00E66387 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (25, 6, CAST(0x0000A19000000000 AS DateTime), N'1:30 PM', N'1:45 PM', 1, NULL, 40, CAST(0x0000A18D00E6638F AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (26, 6, CAST(0x0000A19000000000 AS DateTime), N'2:00 PM', N'2:15 PM', 1, NULL, 40, CAST(0x0000A18D00E6639B AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (27, 6, CAST(0x0000A19000000000 AS DateTime), N'2:30 PM', N'2:45 PM', 1, NULL, 40, CAST(0x0000A18D00E663C0 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (28, 7, CAST(0x0000A19000000000 AS DateTime), N'2:00 PM', N'2:10 PM', 1, NULL, 39, CAST(0x0000A18D00E7579A AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (29, 6, CAST(0x0000A1A500000000 AS DateTime), N'8:00 AM', N'8:20 AM', 1, NULL, 40, CAST(0x0000A18D00E79B46 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (31, 6, CAST(0x0000A1A600000000 AS DateTime), N'9:20 AM', N'9:40 AM', 1, NULL, 40, CAST(0x0000A18D00E79B57 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (34, 6, CAST(0x0000A1A600000000 AS DateTime), N'11:20 AM', N'11:40 AM', 1, NULL, 40, CAST(0x0000A18D00E79B71 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (36, 6, CAST(0x0000A1A600000000 AS DateTime), N'12:40 PM', N'1:00 PM', 1, NULL, 40, CAST(0x0000A18D00E79B7E AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (38, 6, CAST(0x0000A1A600000000 AS DateTime), N'2:00 PM', N'2:20 PM', 1, NULL, 40, CAST(0x0000A18D00E79BA1 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (40, 6, CAST(0x0000A1A700000000 AS DateTime), N'9:16 AM', N'9:31 AM', 1, NULL, 40, CAST(0x0000A18D00E8F290 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (41, 6, CAST(0x0000A1A700000000 AS DateTime), N'9:32 AM', N'9:47 AM', 1, NULL, 40, CAST(0x0000A18D00E8F296 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (42, 6, CAST(0x0000A1A700000000 AS DateTime), N'9:48 AM', N'10:03 AM', 1, NULL, 40, CAST(0x0000A18D00E8F29E AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (44, 6, CAST(0x0000A1A700000000 AS DateTime), N'10:20 AM', N'10:35 AM', 1, NULL, 40, CAST(0x0000A18D00E8F2AB AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (46, 6, CAST(0x0000A1A700000000 AS DateTime), N'10:52 AM', N'11:07 AM', 1, NULL, 40, CAST(0x0000A18D00E8F2B8 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (47, 6, CAST(0x0000A1A700000000 AS DateTime), N'11:08 AM', N'11:23 AM', 1, NULL, 40, CAST(0x0000A18D00E8F2C4 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (49, 6, CAST(0x0000A1A700000000 AS DateTime), N'11:40 AM', N'11:55 AM', 1, NULL, 40, CAST(0x0000A18D00E8F2D8 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (50, 6, CAST(0x0000A1A700000000 AS DateTime), N'11:56 AM', N'12:11 PM', 1, NULL, 40, CAST(0x0000A18D00E8F2E4 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (51, 6, CAST(0x0000A1A700000000 AS DateTime), N'12:12 PM', N'12:27 PM', 1, NULL, 40, CAST(0x0000A18D00E8F2E9 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (52, 6, CAST(0x0000A1A500000000 AS DateTime), N'12:30 PM', N'12:45 PM', 1, NULL, 40, CAST(0x0000A18D00E8F2F0 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (53, 6, CAST(0x0000A1A700000000 AS DateTime), N'12:44 PM', N'12:59 PM', 1, NULL, 40, CAST(0x0000A18D00E8F2F5 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (54, 6, CAST(0x0000A1A700000000 AS DateTime), N'1:00 PM', N'1:15 PM', 1, NULL, 40, CAST(0x0000A18D00E8F2FB AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (55, 6, CAST(0x0000A1A700000000 AS DateTime), N'1:16 PM', N'1:31 PM', 1, NULL, 40, CAST(0x0000A18D00E8F305 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (56, 6, CAST(0x0000A1A700000000 AS DateTime), N'1:32 PM', N'1:47 PM', 1, NULL, 40, CAST(0x0000A18D00E8F30D AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (58, 6, CAST(0x0000A1A100000000 AS DateTime), N'2:05 PM', N'2:20 PM', 1, NULL, 40, CAST(0x0000A18D00E8F319 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (59, 6, CAST(0x0000A19100000000 AS DateTime), N'9:00 AM', N'9:15 AM', 1, NULL, 43, CAST(0x0000A18E01251B5E AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (60, 6, CAST(0x0000A19100000000 AS DateTime), N'9:16 AM', N'9:31 AM', 1, NULL, 43, CAST(0x0000A18E01251C9D AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (61, 6, CAST(0x0000A19100000000 AS DateTime), N'9:32 AM', N'9:47 AM', 1, NULL, 43, CAST(0x0000A18E01251CB3 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (62, 6, CAST(0x0000A19100000000 AS DateTime), N'9:48 AM', N'10:03 AM', 1, NULL, 43, CAST(0x0000A18E01251CC7 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (63, 6, CAST(0x0000A19200000000 AS DateTime), N'10:05 AM', N'10:20 AM', 1, NULL, 43, CAST(0x0000A18E01251CD2 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (64, 6, CAST(0x0000A1AE00000000 AS DateTime), N'1:00 PM', N'1:10 PM', 1, NULL, 43, CAST(0x0000A19301367F59 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (65, 7, CAST(0x0000A19E00000000 AS DateTime), N'2:05 PM', N'2:15 PM', 1, NULL, 39, CAST(0x0000A19800BA197F AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (66, 7, CAST(0x0000A1A500000000 AS DateTime), N'4:25 PM', N'4:35 PM', 1, NULL, 39, CAST(0x0000A19800BAB75F AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (67, 16, CAST(0x0000A1AC00000000 AS DateTime), N'9:00 AM', N'9:15 AM', 1, NULL, 56, CAST(0x0000A19D00E5D56A AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (68, 16, CAST(0x0000A1AC00000000 AS DateTime), N'9:16 AM', N'9:31 AM', 1, NULL, 56, CAST(0x0000A19D00E5D57B AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (69, 16, CAST(0x0000A1AC00000000 AS DateTime), N'9:32 AM', N'9:47 AM', 1, NULL, 56, CAST(0x0000A19D00E5D582 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (70, 16, CAST(0x0000A1AC00000000 AS DateTime), N'9:48 AM', N'10:03 AM', 1, NULL, 56, CAST(0x0000A19D00E5D587 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (71, 16, CAST(0x0000A1AC00000000 AS DateTime), N'10:04 AM', N'10:19 AM', 1, NULL, 56, CAST(0x0000A19D00E5D58B AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (72, 16, CAST(0x0000A1AC00000000 AS DateTime), N'10:20 AM', N'10:35 AM', 1, NULL, 56, CAST(0x0000A19D00E5D591 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (73, 16, CAST(0x0000A1AC00000000 AS DateTime), N'10:36 AM', N'10:51 AM', 1, NULL, 56, CAST(0x0000A19D00E5D596 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (74, 16, CAST(0x0000A1AC00000000 AS DateTime), N'10:52 AM', N'11:07 AM', 1, NULL, 56, CAST(0x0000A19D00E5D59A AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (75, 8, CAST(0x0000A1B000000000 AS DateTime), N'9:00 AM', N'9:20 AM', 1, NULL, 61, CAST(0x0000A1A300307866 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (76, 8, CAST(0x0000A1B000000000 AS DateTime), N'9:21 AM', N'9:41 AM', 1, NULL, 61, CAST(0x0000A1A30030789A AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (77, 8, CAST(0x0000A1B000000000 AS DateTime), N'9:42 AM', N'10:02 AM', 1, NULL, 61, CAST(0x0000A1A3003078A3 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (78, 8, CAST(0x0000A1B000000000 AS DateTime), N'10:03 AM', N'10:23 AM', 1, NULL, 61, CAST(0x0000A1A3003078A3 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (79, 8, CAST(0x0000A1B000000000 AS DateTime), N'10:24 AM', N'10:44 AM', 1, NULL, 61, CAST(0x0000A1A3003078A8 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (80, 8, CAST(0x0000A1B000000000 AS DateTime), N'10:45 AM', N'11:05 AM', 1, NULL, 61, CAST(0x0000A1A3003078A8 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (81, 8, CAST(0x0000A1B000000000 AS DateTime), N'11:06 AM', N'11:26 AM', 1, NULL, 61, CAST(0x0000A1A3003078B1 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (82, 8, CAST(0x0000A1B000000000 AS DateTime), N'11:27 AM', N'11:47 AM', 1, NULL, 61, CAST(0x0000A1A3003078B6 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (83, 8, CAST(0x0000A1B000000000 AS DateTime), N'11:48 AM', N'12:08 PM', 1, NULL, 61, CAST(0x0000A1A3003078B6 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (84, 16, CAST(0x0000A1AB00000000 AS DateTime), N'2:25 PM', N'2:55 PM', 1, NULL, 62, CAST(0x0000A1A30030FDEB AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (85, 16, CAST(0x0000A1AB00000000 AS DateTime), N'2:56 PM', N'3:26 PM', 1, NULL, 62, CAST(0x0000A1A30030FDEB AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (86, 16, CAST(0x0000A1AB00000000 AS DateTime), N'3:27 PM', N'3:57 PM', 1, NULL, 62, CAST(0x0000A1A30030FDEB AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (87, 16, CAST(0x0000A1AB00000000 AS DateTime), N'3:58 PM', N'4:28 PM', 1, NULL, 62, CAST(0x0000A1A30030FDF0 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (88, 16, CAST(0x0000A1AB00000000 AS DateTime), N'4:29 PM', N'4:59 PM', 1, NULL, 62, CAST(0x0000A1A30030FDF0 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (89, 16, CAST(0x0000A1AB00000000 AS DateTime), N'5:00 PM', N'5:30 PM', 1, NULL, 62, CAST(0x0000A1A30030FDF5 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (90, 16, CAST(0x0000A1AB00000000 AS DateTime), N'5:31 PM', N'6:01 PM', 1, NULL, 62, CAST(0x0000A1A30030FDF5 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (91, 16, CAST(0x0000A1AB00000000 AS DateTime), N'6:02 PM', N'6:32 PM', 1, NULL, 62, CAST(0x0000A1A30030FDF5 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (92, 17, CAST(0x0000A1AD00000000 AS DateTime), N'2:05 AM', N'2:15 AM', 1, NULL, 63, CAST(0x0000A1A4004F5DA4 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (93, 17, CAST(0x0000A1AD00000000 AS DateTime), N'2:16 AM', N'2:26 AM', 1, NULL, 63, CAST(0x0000A1A4004F5DB6 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (94, 17, CAST(0x0000A1AD00000000 AS DateTime), N'2:27 AM', N'2:37 AM', 1, NULL, 63, CAST(0x0000A1A4004F5DB6 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (95, 17, CAST(0x0000A1AD00000000 AS DateTime), N'2:38 AM', N'2:48 AM', 1, NULL, 63, CAST(0x0000A1A4004F5DBB AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (96, 17, CAST(0x0000A1AD00000000 AS DateTime), N'2:49 AM', N'2:59 AM', 1, NULL, 63, CAST(0x0000A1A4004F5DBB AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (97, 13, CAST(0x0000A1AF00000000 AS DateTime), N'2:05 PM', N'2:15 PM', 1, NULL, 64, CAST(0x0000A1A40166725F AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (98, 13, CAST(0x0000A1AF00000000 AS DateTime), N'2:16 PM', N'2:26 PM', 1, NULL, 64, CAST(0x0000A1A40166727B AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (99, 13, CAST(0x0000A1AF00000000 AS DateTime), N'2:27 PM', N'2:37 PM', 1, NULL, 64, CAST(0x0000A1A401667285 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (100, 13, CAST(0x0000A1AF00000000 AS DateTime), N'2:38 PM', N'2:48 PM', 1, NULL, 64, CAST(0x0000A1A401667293 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (101, 13, CAST(0x0000A1AF00000000 AS DateTime), N'2:49 PM', N'2:59 PM', 1, NULL, 64, CAST(0x0000A1A40166729C AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (102, 7, CAST(0x0000A1AA00000000 AS DateTime), N'2:05 PM', N'2:10 PM', 1, NULL, 39, CAST(0x0000A1A800890849 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (103, 7, CAST(0x0000A1AA00000000 AS DateTime), N'2:11 PM', N'2:16 PM', 1, NULL, 39, CAST(0x0000A1A80089084E AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (104, 7, CAST(0x0000A1AA00000000 AS DateTime), N'2:17 PM', N'2:22 PM', 1, NULL, 39, CAST(0x0000A1A80089084E AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (105, 7, CAST(0x0000A1AA00000000 AS DateTime), N'2:23 PM', N'2:28 PM', 1, NULL, 39, CAST(0x0000A1A800890852 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (106, 7, CAST(0x0000A1AA00000000 AS DateTime), N'2:29 PM', N'2:34 PM', 1, NULL, 39, CAST(0x0000A1A800890852 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (108, 7, CAST(0x0000A1B900000000 AS DateTime), N'1:05 AM', N'1:10 AM', 1, NULL, 39, CAST(0x0000A1B200A63D98 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (109, 7, CAST(0x0000A1B900000000 AS DateTime), N'1:11 AM', N'1:16 AM', 1, NULL, 39, CAST(0x0000A1B200A63DAB AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (110, 7, CAST(0x0000A1B900000000 AS DateTime), N'1:17 AM', N'1:22 AM', 1, NULL, 39, CAST(0x0000A1B200A63DAB AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (111, 7, CAST(0x0000A1B900000000 AS DateTime), N'1:23 AM', N'1:28 AM', 1, NULL, 39, CAST(0x0000A1B200A63DAB AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (112, 7, CAST(0x0000A1B900000000 AS DateTime), N'1:29 AM', N'1:34 AM', 1, NULL, 39, CAST(0x0000A1B200A63DAF AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (113, 8, CAST(0x0000A1BF00000000 AS DateTime), N'3:05 AM', N'3:10 AM', 1, NULL, 61, CAST(0x0000A1B200A665E5 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (114, 8, CAST(0x0000A1BF00000000 AS DateTime), N'3:11 AM', N'3:16 AM', 1, NULL, 61, CAST(0x0000A1B200A665EA AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (115, 8, CAST(0x0000A1BF00000000 AS DateTime), N'3:17 AM', N'3:22 AM', 1, NULL, 61, CAST(0x0000A1B200A665EA AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (116, 8, CAST(0x0000A1BF00000000 AS DateTime), N'3:23 AM', N'3:28 AM', 1, NULL, 61, CAST(0x0000A1B200A665EA AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (117, 13, CAST(0x0000A1C000000000 AS DateTime), N'1:00 AM', N'1:05 AM', 1, NULL, 70, CAST(0x0000A1B300AC32E7 AS DateTime), 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (118, 13, CAST(0x0000A1C000000000 AS DateTime), N'1:06 AM', N'1:11 AM', 1, NULL, 70, CAST(0x0000A1B300AC32F7 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (119, 13, CAST(0x0000A1C000000000 AS DateTime), N'1:12 AM', N'1:17 AM', 1, NULL, 70, CAST(0x0000A1B300AC3304 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (120, 13, CAST(0x0000A1C000000000 AS DateTime), N'1:18 AM', N'1:23 AM', 1, NULL, 70, CAST(0x0000A1B300AC3312 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (121, 13, CAST(0x0000A1C000000000 AS DateTime), N'1:24 AM', N'1:29 AM', 1, NULL, 70, CAST(0x0000A1B300AC3320 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (122, 13, CAST(0x0000A1C000000000 AS DateTime), N'1:30 AM', N'1:35 AM', 1, NULL, 70, CAST(0x0000A1B300AC332D AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (123, 6, CAST(0x0000A1BD00000000 AS DateTime), N'2:05 AM', N'2:10 AM', 1, NULL, 43, CAST(0x0000A1B300AC4EA0 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (124, 6, CAST(0x0000A1BD00000000 AS DateTime), N'2:11 AM', N'2:16 AM', 1, NULL, 43, CAST(0x0000A1B300AC4EB2 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (125, 6, CAST(0x0000A1BD00000000 AS DateTime), N'2:17 AM', N'2:22 AM', 1, NULL, 43, CAST(0x0000A1B300AC4EBF AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (126, 6, CAST(0x0000A1BD00000000 AS DateTime), N'2:23 AM', N'2:28 AM', 1, NULL, 43, CAST(0x0000A1B300AC4ECD AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (127, 6, CAST(0x0000A1BD00000000 AS DateTime), N'2:29 AM', N'2:34 AM', 1, NULL, 43, CAST(0x0000A1B300AC4EDB AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (128, 6, CAST(0x0000A1BD00000000 AS DateTime), N'2:35 AM', N'2:40 AM', 1, NULL, 43, CAST(0x0000A1B300AC4EE8 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (129, 6, CAST(0x0000A1BD00000000 AS DateTime), N'2:41 AM', N'2:46 AM', 1, NULL, 43, CAST(0x0000A1B300AC4EF6 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (130, 6, CAST(0x0000A1BD00000000 AS DateTime), N'2:47 AM', N'2:52 AM', 1, NULL, 43, CAST(0x0000A1B300AC4F04 AS DateTime), 1)
INSERT [dbo].[ExpertAppointments] ([iAppointmentID], [iContactID], [dtAppointmentDate], [sTimeFrom], [sTimeTo], [iAdminCompanyID], [sAppointmentStaus], [iVenueID], [dtCreatedDate], [iUserID]) VALUES (131, 6, CAST(0x0000A1BD00000000 AS DateTime), N'2:53 AM', N'2:58 AM', 1, NULL, 43, CAST(0x0000A1B300AC4F12 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ExpertAppointments] OFF
/****** Object:  Table [dbo].[Cases]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cases](
	[iCaseID] [int] IDENTITY(1,1) NOT NULL,
	[iPatientID] [int] NULL,
	[iAdminCompanyID] [int] NULL,
	[iUserIDCreatedBy] [int] NULL,
	[iExpretID] [int] NULL,
	[sCaseDiscription] [varchar](max) NULL,
	[dtCreatedDate] [datetime] NULL,
	[sCaseStatus] [varchar](500) NULL,
	[dtCaseDate] [datetime] NULL,
	[iAppointmentID] [int] NULL,
	[sBillingAddress] [varchar](500) NULL,
	[sBillingPostCode] [varchar](500) NULL,
	[sBillingCountry] [varchar](500) NULL,
	[sBillingPhone] [varchar](500) NULL,
	[sBillingEmail] [varchar](500) NULL,
	[sShippingAddress] [varchar](500) NULL,
	[sShippingPostCode] [varchar](500) NULL,
	[sShippingCountry] [varchar](500) NULL,
	[sShippingPhone] [varchar](500) NULL,
	[sShippingEmail] [varchar](500) NULL,
	[sCaseRefNo] [varchar](500) NULL,
	[iVenueID] [int] NULL,
	[sDoctorInstructions] [varchar](max) NULL,
 CONSTRAINT [PK_Case] PRIMARY KEY CLUSTERED 
(
	[iCaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cases] ON
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (14, 11, 1, 1, 6, N'FGFGFFGF', CAST(0x0000A19301200AAE AS DateTime), N'cancel', CAST(0x0000A1A900000000 AS DateTime), 31, N'Main Blew road', N'10008', N'Canada', N'45555664', N'seed@gmail.com', N'Kalama CHOK', N'V6H1V4', N'Canada', N'678888888', N'ASAD@gmail.com', N'WHCS-10', 40, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (15, 10, 1, 1, 6, N'YRYYTGT', CAST(0x0000A193012065C6 AS DateTime), N'cancel', CAST(0x0000A1A400000000 AS DateTime), 34, N'11234, St Johnson Park', N'11234', N'United States', N'2346567', N'QANDILA@GMAIL.COM', N'Chandi chok', N'45676', N'United States', N'678888888', N'zia@gmail.com', N'WHCS-11', 40, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (16, 11, 1, 1, 6, N'KJGJHGJH', CAST(0x0000A1930120E4AF AS DateTime), N'cancel', CAST(0x0000A1A100000000 AS DateTime), 55, N'44321 CT, Vacant Road', N'44321', NULL, N'342342111', N'jabbar@gmail.com', NULL, NULL, NULL, NULL, NULL, N'WHCS-12', 40, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (17, 10, 1, 1, 6, N'fggf', CAST(0x0000A19800B34085 AS DateTime), N'cancel', CAST(0x0000A19C00000000 AS DateTime), 52, N'11234, St Johnson Park', N'11234', N'United States', N'2346567', N'QANDILA@GMAIL.COM', NULL, NULL, N'United States', NULL, NULL, N'whc-01', 40, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (18, 10, 1, 1, 16, N'SICK', CAST(0x0000A19D00E647D8 AS DateTime), N'cancel', CAST(0x0000A19D00000000 AS DateTime), 67, N'11234, St Johnson Park', N'A0C1W0', N'Canada', N'2346567', N'QANDILA@GMAIL.COM', NULL, NULL, NULL, NULL, NULL, N'123', 56, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (19, 11, 1, 1, 6, N'abc', CAST(0x0000A19E00A0F751 AS DateTime), N'cancel', CAST(0x0000A1AB00000000 AS DateTime), 36, N'44321 CT, Vacant Road', N'44321', N'United States', N'342342111', N'jabbar@gmail.com', NULL, NULL, NULL, NULL, NULL, N'Whcs-13', 40, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (20, 11, 1, 1, 6, N'fgfgf', CAST(0x0000A1A501004DB4 AS DateTime), N'cancel', CAST(0x0000A1A600000000 AS DateTime), 38, N'44321 CT, Vacant Road', N'44321', N'United States', N'342342111', N'jabbar@gmail.com', NULL, NULL, NULL, NULL, NULL, N'12', 40, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (21, 11, 1, 1, 13, N'qwq', CAST(0x0000A1A80087C36E AS DateTime), N'cancel', CAST(0x0000A19500000000 AS DateTime), 97, N'44321 CT, Vacant Road', N'44321', N'United States', N'342342111', N'jabbar@gmail.com', NULL, NULL, NULL, NULL, NULL, N'ABC-012', 64, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (22, 11, 1, 1, 7, N'SDS', CAST(0x0000A1A8008935D8 AS DateTime), N'cancel', CAST(0x0000A19500000000 AS DateTime), 106, N'44321 CT, Vacant Road', N'44321', N'United States', N'342342111', N'jabbar@gmail.com', NULL, NULL, NULL, NULL, NULL, N'DS', 39, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (23, 33, 1, 1, 8, N'erwerrer', CAST(0x0000A1B200A79349 AS DateTime), N'cancel', CAST(0x0000A1BE00000000 AS DateTime), 114, N'GulBarg', N'T1X0A1', N'Canada', N'923234369027', N'jabir@gmail.com', NULL, NULL, NULL, NULL, NULL, N'whc22', 61, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (24, 34, 1, 1, 7, N'qeqeqwe', CAST(0x0000A1B200A7EBD6 AS DateTime), N'cancel', CAST(0x0000A1B800000000 AS DateTime), 111, N'bbbb', N'10007', N'United States', NULL, N'munir@gmail.com', NULL, NULL, NULL, NULL, NULL, N'whc23', 39, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (25, 36, 1, 1, 7, N'AAASSD', CAST(0x0000A1B20123F0AD AS DateTime), N'Open', CAST(0x0000A1B800000000 AS DateTime), 108, N'GG', N'1008', N'United States', N'4554445455454', N'ABAS@gmail.com', NULL, NULL, NULL, NULL, NULL, N'WHCH25', 39, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (26, 36, 1, 1, 8, N'SDDDSASD', CAST(0x0000A1B2012487A4 AS DateTime), N'Open', CAST(0x0000A1BE00000000 AS DateTime), 115, N'GG', N'1008', N'United States', N'4554445455454', N'ABAS@gmail.com', NULL, NULL, NULL, NULL, NULL, N'WHCH26', 61, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (27, 44, 1, 1, 8, N'wewewe', CAST(0x0000A1B2012B0316 AS DateTime), N'Open', CAST(0x0000A1BD00000000 AS DateTime), 113, N'mia', N'10001', N'United States', NULL, N'aslam@gmail.com', NULL, NULL, NULL, NULL, NULL, N'WHCH27', 61, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (28, 44, 1, 1, 7, N'fjgfjg', CAST(0x0000A1B2012BB8A2 AS DateTime), N'Open', CAST(0x0000A1B200000000 AS DateTime), 109, N'mia', N'10001', N'United States', N'344334343434', N'aslam@gmail.com', NULL, NULL, NULL, NULL, NULL, N'WHCH28', 39, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (29, 44, 1, 1, 7, N'abbxcbfh', CAST(0x0000A1B2012BFF9B AS DateTime), N'Open', CAST(0x0000A1B200000000 AS DateTime), 112, N'mia', N'10001', N'United States', N'344334343434', N'aslam@gmail.com', NULL, NULL, NULL, NULL, NULL, N'WHCH29', 39, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (30, 44, 1, 1, 8, N'eererqre', CAST(0x0000A1B2012C8D94 AS DateTime), N'Open', CAST(0x0000A1B200000000 AS DateTime), 116, N'mia', N'10001', N'United States', N'344334343434', N'aslam@gmail.com', NULL, NULL, NULL, NULL, NULL, N'WHCH23', 61, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (31, 11, 1, 1, 7, N'ERERER', CAST(0x0000A1B300AC04A9 AS DateTime), N'Open', CAST(0x0000A1B300000000 AS DateTime), 110, N'44321 CT, Vacant Road', N'44321', N'United States', N'342342111', N'jabbar@gmail.com', NULL, NULL, NULL, NULL, NULL, N'WHCH30', 39, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (32, 11, 1, 1, 6, N'WQEQ', CAST(0x0000A1B300AD5821 AS DateTime), N'Open', CAST(0x0000A1B300000000 AS DateTime), 123, N'44321 CT, Vacant Road', N'44321', N'United States', N'342342111', N'jabbar@gmail.com', NULL, NULL, NULL, NULL, NULL, N'WHCH31', 43, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (33, 37, 1, 1, 13, N'SDFF', CAST(0x0000A1B300AD9214 AS DateTime), N'Open', CAST(0x0000A1B300000000 AS DateTime), 119, N'SD', N'10005', N'United States', NULL, N'ER@GMAIL.COM', NULL, NULL, NULL, NULL, NULL, N'WHCH32', 70, NULL)
INSERT [dbo].[Cases] ([iCaseID], [iPatientID], [iAdminCompanyID], [iUserIDCreatedBy], [iExpretID], [sCaseDiscription], [dtCreatedDate], [sCaseStatus], [dtCaseDate], [iAppointmentID], [sBillingAddress], [sBillingPostCode], [sBillingCountry], [sBillingPhone], [sBillingEmail], [sShippingAddress], [sShippingPostCode], [sShippingCountry], [sShippingPhone], [sShippingEmail], [sCaseRefNo], [iVenueID], [sDoctorInstructions]) VALUES (34, 37, 1, 1, 6, N'EREWR', CAST(0x0000A1B300ADD44B AS DateTime), N'Open', CAST(0x0000A1B300000000 AS DateTime), 124, N'SD', N'10005', N'United States', N'67676576575676', N'ER@GMAIL.COM', NULL, NULL, NULL, NULL, NULL, N'WHCH33', 43, NULL)
SET IDENTITY_INSERT [dbo].[Cases] OFF
/****** Object:  StoredProcedure [dbo].[FindAllAppointments]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[FindAllAppointments]--'E2M5S9',15,1
 @MyPostCode as varchar(500)
 ,@Radius as numeric(18,5),
 @AdminCompanyID AS INT 
 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END
IF((SELECT COUNT(*) FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode) <> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
END
IF((SELECT COUNT(*) FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode) <> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
set @Longitude =(SELECT top 1 nLongitude FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode))= @MyPostCode)
END
ELSE
BEGIN
set @Temp='0'
END




select *,'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)' as Distance1,Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as Distance2 from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID  ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) < @Radius and exists(select * from ExpertAppointments expert where iAdminCompanyID=@AdminCompanyID AND   Cast (dtAppointmentDate as Date) >= Cast(getdate() as date) ) and exists(select iContactID   from Contacts  where iContactID=t1.iContactID and iUserTypeID=2 )


	
End
GO
/****** Object:  StoredProcedure [dbo].[AvailApptByDoctorName]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AvailApptByDoctorName] --'','moona',0,1
 @MyPostCode as varchar(500),
  @DoctorName as varchar(500),
  @Radius as numeric(18,5),
  @AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END

ELSE
BEGIN
set @Temp='0'
END


if(@MyPostCode <>''  and @DoctorName<>'' and @Radius<>0)
BEgin

select *,'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)' as Distance1,Cast(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) as numeric(18,2)) as Distance2  from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName as title, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) < @Radius and exists(select * from ExpertAppointments where iAdminCompanyID= @AdminCompanyID and iVenueID = t1.iVenueID and Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) ) AND DoctorName LIKE '%'+@DoctorName+'%'
			
END

if (@MyPostCode =''  and @DoctorName<>'' and @Radius=0)
BEGIN

 select *,'' as Distance1,'' as Distance2 from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName as title, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where exists(select * from ExpertAppointments where iAdminCompanyID= @AdminCompanyID and iVenueID = t1.iVenueID and Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) ) AND DoctorName LIKE '%'+@DoctorName+'%'

END


END
GO
/****** Object:  StoredProcedure [dbo].[AvailableSearchInPostCodeOnMAP]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AvailableSearchInPostCodeOnMAP]--'E2M5S9',1
 @MyPostCode as varchar(500)
 ,@AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END
Else
BEGIN
set @Temp='0'
END



IF @Temp<>'0'
			select t1.Pharmasist,t1.Hospital,  sLocationName as 'title',nLatitude as 'lat', (case when sCountry='United States' then (Case when nLongitude<0 then nLongitude else (-nLongitude) END) Else nLongitude END) as 'lng','Doctor Name: <b style="color:#00688B;font-weight:bold;font-size:11px; align=left;">'+'<a href="AvaliableAppointments.aspx?iVenueID='+cast(iVenueID as varchar(500))+'&iAdminCompanyID='+cast(@AdminCompanyID as varchar(500))+'" target="_blank">'+DoctorName+'</a></b>'+'<br/> Location: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sLocationName+'</b>'+'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)'+'<br/>PostCode: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sPostCode+'</b>'+'<br/>Email: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sEmail+'</b>'  as 'description' from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			,sCountry,
			(Case when 1=1 then (select top 1 sCompanyName  from Company where iCompanyTypeID=7)else '' end) as Pharmasist,
			(Case when 1=1 then (select top 1 sCompanyName  from Company where iCompanyTypeID=1)else '' end) as Hospital
			
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) < 15 and exists(select * from ExpertAppointments where iVenueID = t1.iVenueID and iAdminCompanyID=@AdminCompanyID AND  Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) )

	

	
End
GO
/****** Object:  StoredProcedure [dbo].[AvailableApptInPostCodeRadiusOnMAP]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AvailableApptInPostCodeRadiusOnMAP]--'E2M5S9',15,1
 @MyPostCode as varchar(500)
 ,@Radius as numeric(18,5),
  @AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END
Else
BEGIN
set @Temp='0'
END



IF @Temp<>'0'
			select sLocationName as 'title',nLatitude as 'lat', (case when sCountry='United States' then (Case when nLongitude<0 then nLongitude else (-nLongitude) END) Else nLongitude END) as 'lng','Doctor Name: <b style="color:#00688B;font-weight:bold;font-size:11px; align=left;">'+'<a href="AvaliableAppointments.aspx?iVenueID='+cast(iVenueID as varchar(500))+'&iAdminCompanyID='+cast(@AdminCompanyID as varchar(500))+'" target="_blank">'+DoctorName+'</a></b>'+'<br/> Location: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sLocationName+'</b>'+'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)'+'<br/>PostCode: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sPostCode+'</b>'+'<br/>Email: <b style="color:#00688B;font-weight:bold;font-size:11px;">'+sEmail+'</b>'  as 'description' from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			,sCountry
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) < @Radius and exists(select * from ExpertAppointments where iVenueID = t1.iVenueID and iAdminCompanyID=@AdminCompanyID AND  Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) )

	

	
End
GO
/****** Object:  StoredProcedure [dbo].[AvailableApptInPostCodeRadius]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AvailableApptInPostCodeRadius] --'E2P1J4',5000,1
 @MyPostCode as varchar(500)
 ,@Radius as numeric(18,5),
  @AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END
Else
BEGIN
set @Temp='0'
END



IF @Temp<>'0'
			select *,'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)' as Distance1,Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as Distance2 from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) < @Radius and exists(select * from ExpertAppointments where iVenueID = t1.iVenueID and iAdminCompanyID=@AdminCompanyID AND  Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) )

	

	
End
GO
/****** Object:  StoredProcedure [dbo].[AvailableApptInPostCode]    Script Date: 05/03/2013 11:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AvailableApptInPostCode]--'','moona',0,1
 @MyPostCode as varchar(500),
  @DoctorName as varchar(500),
  @Radius as numeric(18,5),
  @AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END

ELSE
BEGIN
set @Temp='0'
END


if(@MyPostCode <>''  and @DoctorName<>'' and @Radius<>0)
BEgin

select *,t1.DoctorName+'  '+t1.sAddress+'  '+t1.sPostCode+'  '+t1.sEmail as DetailDescription,'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)' as Distance1,Cast(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) as numeric(18,2)) as Distance2  from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName
	
	
			,sAddress,sPhoneNumber,
			sLocationName as title, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1
			
			 where dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) < @Radius and exists(select * from ExpertAppointments where iAdminCompanyID= @AdminCompanyID and iVenueID = t1.iVenueID and Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) ) AND DoctorName LIKE '%'+@DoctorName+'%'
			
END

if (@MyPostCode =''  and @DoctorName<>'' and @Radius=0)
BEGIN

 select *,t1.DoctorName+'  '+t1.sAddress+'  '+t1.sPostCode+'  '+t1.sEmail as DetailDescription,'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)' as Distance1,Cast(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) as numeric(18,2)) as Distance2 from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName as title, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where exists(select * from ExpertAppointments where iAdminCompanyID= @AdminCompanyID and iVenueID = t1.iVenueID and Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) ) AND DoctorName LIKE '%'+@DoctorName+'%'

END


END
GO
/****** Object:  StoredProcedure [dbo].[AvailableApptInLoctionName]    Script Date: 05/03/2013 11:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AvailableApptInLoctionName]--'','moona',0,1
 @MyPostCode as varchar(500),
  @DoctorName as varchar(500),
  @Radius as numeric(18,5),
  @AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END

ELSE
BEGIN
set @Temp='0'
END


if(@MyPostCode <>''  and @DoctorName<>'' and @Radius<>0)
BEgin

select *,t1.DoctorName+'  '+t1.sAddress+'  '+t1.sPostCode+'  '+t1.sEmail as DetailDescription,'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)' as Distance1,Cast(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) as numeric(18,2)) as Distance2  from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName
	
	
			,sAddress,sPhoneNumber,
			sLocationName as title, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1
			
			 where dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) < @Radius and exists(select * from ExpertAppointments where iAdminCompanyID= @AdminCompanyID and iVenueID = t1.iVenueID and Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) ) AND DoctorName LIKE '%'+@DoctorName+'%'
			
END

if (@MyPostCode =''  and @DoctorName<>'' and @Radius=0)
BEGIN

 select *,t1.DoctorName+'  '+t1.sAddress+'  '+t1.sPostCode+'  '+t1.sEmail as DetailDescription,'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)' as Distance1,Cast(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) as numeric(18,2)) as Distance2 from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName as title, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where exists(select * from ExpertAppointments where iAdminCompanyID= @AdminCompanyID and iVenueID = t1.iVenueID and Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) ) AND DoctorName LIKE '%'+@DoctorName+'%'

END


END
GO
/****** Object:  StoredProcedure [dbo].[AvailableApptInDoctorNameOnMAP]    Script Date: 05/03/2013 11:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AvailableApptInDoctorNameOnMAP] --'','moona',0,1
 @MyPostCode as varchar(500),
  @DoctorName as varchar(500),
  @Radius as numeric(18,5),
  @AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END

ELSE
BEGIN
set @Temp='0'
END


if(@MyPostCode <>''  and @DoctorName<>'' and @Radius<>0)
BEgin

select *,'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)' as Distance1,Cast(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) as numeric(18,2)) as Distance2  from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) < @Radius and exists(select * from ExpertAppointments where iAdminCompanyID= @AdminCompanyID and iVenueID = t1.iVenueID and Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) ) AND DoctorName LIKE '%'+@DoctorName+'%'
			
END

if (@MyPostCode =''  and @DoctorName<>'' and @Radius=0)
BEGIN

 select sLocationName as 'title',nLatitude as 'lat', nLongitude as 'lng','Doctor Name: '+DoctorName+', Location: '+sLocationName+', PostCode: '+sPostCode+', Email: '+sEmail  as 'description' from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where exists(select * from ExpertAppointments where iAdminCompanyID= @AdminCompanyID and iVenueID = t1.iVenueID and Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) ) AND DoctorName LIKE '%'+@DoctorName+'%'

END


END
GO
/****** Object:  StoredProcedure [dbo].[AvailableApptInDoctorName]    Script Date: 05/03/2013 11:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AvailableApptInDoctorName] --'','moona',0,1
 @MyPostCode as varchar(500),
  @DoctorName as varchar(500),
  @Radius as numeric(18,5),
  @AdminCompanyID AS INT 
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END

ELSE
BEGIN
set @Temp='0'
END


if(@MyPostCode <>''  and @DoctorName<>'' and @Radius<>0)
BEgin

select *,'('+Cast(Cast(ABS(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude)) as numeric(18,2)) as varchar(500))+' miles)' as Distance1,Cast(dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) as numeric(18,2)) as Distance2  from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) < @Radius and exists(select * from ExpertAppointments where iAdminCompanyID= @AdminCompanyID and iVenueID = t1.iVenueID and Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) ) AND DoctorName LIKE '%'+@DoctorName+'%'
			
END

if (@MyPostCode =''  and @DoctorName<>'' and @Radius=0)
BEGIN

 select *,'' as Distance1,'' as Distance2 from (
			select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
			sLocationName, sPostCode,iVenueID,
			(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
			(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
			,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
			from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
			) as t1 where exists(select * from ExpertAppointments where iAdminCompanyID= @AdminCompanyID and iVenueID = t1.iVenueID and Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) ) AND DoctorName LIKE '%'+@DoctorName+'%'

END


END
GO
/****** Object:  StoredProcedure [dbo].[proc_ExpertAppointmentsUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ExpertAppointmentsUpdate]
(
	@iAppointmentID int,
	@iContactID int = NULL,
	@dtAppointmentDate datetime = NULL,
	@sTimeFrom varchar(500) = NULL,
	@sTimeTo varchar(500) = NULL,
	@iAdminCompanyID int = NULL,
	@sAppointmentStaus varchar(MAX) = NULL,
	@iVenueID int = NULL,
	@dtCreatedDate datetime = NULL,
	@iUserID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [ExpertAppointments]
	SET
		[iContactID] = @iContactID,
		[dtAppointmentDate] = @dtAppointmentDate,
		[sTimeFrom] = @sTimeFrom,
		[sTimeTo] = @sTimeTo,
		[iAdminCompanyID] = @iAdminCompanyID,
		[sAppointmentStaus] = @sAppointmentStaus,
		[iVenueID] = @iVenueID,
		[dtCreatedDate] = @dtCreatedDate,
		[iUserID] = @iUserID
	WHERE
		[iAppointmentID] = @iAppointmentID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ExpertAppointmentsLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ExpertAppointmentsLoadByPrimaryKey]
(
	@iAppointmentID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iAppointmentID],
		[iContactID],
		[dtAppointmentDate],
		[sTimeFrom],
		[sTimeTo],
		[iAdminCompanyID],
		[sAppointmentStaus],
		[iVenueID],
		[dtCreatedDate],
		[iUserID]
	FROM [ExpertAppointments]
	WHERE
		([iAppointmentID] = @iAppointmentID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ExpertAppointmentsLoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ExpertAppointmentsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iAppointmentID],
		[iContactID],
		[dtAppointmentDate],
		[sTimeFrom],
		[sTimeTo],
		[iAdminCompanyID],
		[sAppointmentStaus],
		[iVenueID],
		[dtCreatedDate],
		[iUserID]
	FROM [ExpertAppointments]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ExpertAppointmentsInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ExpertAppointmentsInsert]
(
	@iAppointmentID int = NULL output,
	@iContactID int = NULL,
	@dtAppointmentDate datetime = NULL,
	@sTimeFrom varchar(500) = NULL,
	@sTimeTo varchar(500) = NULL,
	@iAdminCompanyID int = NULL,
	@sAppointmentStaus varchar(MAX) = NULL,
	@iVenueID int = NULL,
	@dtCreatedDate datetime = NULL,
	@iUserID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [ExpertAppointments]
	(
		[iContactID],
		[dtAppointmentDate],
		[sTimeFrom],
		[sTimeTo],
		[iAdminCompanyID],
		[sAppointmentStaus],
		[iVenueID],
		[dtCreatedDate],
		[iUserID]
	)
	VALUES
	(
		@iContactID,
		@dtAppointmentDate,
		@sTimeFrom,
		@sTimeTo,
		@iAdminCompanyID,
		@sAppointmentStaus,
		@iVenueID,
		@dtCreatedDate,
		@iUserID
	)

	SET @Err = @@Error

	SELECT @iAppointmentID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_ExpertAppointmentsDelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_ExpertAppointmentsDelete]
(
	@iAppointmentID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [ExpertAppointments]
	WHERE
		[iAppointmentID] = @iAppointmentID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[SerachExistingPostCode]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SerachExistingPostCode]
 
 @MyPostCode as varchar(500)
as

Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
--set @MyPostCode = 'E2M5S9'
set @Latitude = 0
set @Longitude = 0
DECLARE @Temp Varchar(20)
SET @Temp='1'
IF((SELECT COUNT(*) FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)<> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)

END
IF((SELECT COUNT(*) FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode) <> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM UsaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
END
IF((SELECT COUNT(*) FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode) <> 0)
BEGIN
SET @Temp='1'

set @Latitude = (SELECT top 1 nLatitude FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)
set @Longitude =(SELECT top 1 nLongitude FROM CanadaPostCode Where Rtrim(Ltrim(sPostCode))= @MyPostCode)
END
ELSE
BEGIN
set @Temp='0'
END


select *,dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) as Distance from (
select iContactID,(case when 1=1 then (select top 1 ISNULL(sFirstName,'')+''+ISNULL(sLastName,'') from Contacts where iContactID =objLV.iContactID ) ELSE '' END) as DoctorName,sAddress,sPhoneNumber,
sLocationName, sPostCode,iVenueID,
(case when 1=1 then (select top 1 sEmail from   Contacts where objLV.iContactID = iContactID) ELSE '' END) as sEmail,
(case when 1=1 then (select top 1 nLatitude from   PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLatitude
,(case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where objLV.sPostCode = sPostCode) ELSE 0 END) as nLongitude
from LinkedVenue objLV where exists (select sPostCode from PostCodeUSA_CA where sPostCode = objLV.sPostCode)
) as t1 where dbo.FindDistance(@Latitude,@Longitude,t1.nLatitude,t1.nLongitude) < 15 and exists(select * from ExpertAppointments where iVenueID = t1.iVenueID and Cast(dtAppointmentDate as Date) >= Cast(getdate() as date) )

End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAppointForDoctorOnVenue]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetAppointForDoctorOnVenue]--43,1
@iVenueID int,
@iAdminCompanyID int
AS
BEGIN
select 
dtAppointmentDate as EventDate,'<span style="color:#aeff00;font-weight:bold;font-size:11px;" title="Un-Booked Cases">'+
isNull(Cast((CASE when 1=1 then (Select count(iAppointmentID) from ExpertAppointments objEA1 where not exists(select iCaseID from Cases where iAppointmentID = objEA1.iAppointmentID) and objEA1.dtAppointmentDate = objApp.dtAppointmentDate group by objEA1.dtAppointmentDate) ELSE 0 end) as varchar(max)),'') + '</span>'+'<span style="color:#ff8080;font-weight:bold;font-size:11px;" title="Booked Cases"> &nbsp; '
+isNull(Cast((CASE when 1=1 then (Select count(iAppointmentID) from ExpertAppointments objEA2 where exists(select iCaseID from Cases where iAppointmentID = objEA2.iAppointmentID) and objEA2.dtAppointmentDate = objApp.dtAppointmentDate group by objEA2.dtAppointmentDate) ELSE 0 end) as varchar(max)),'') + '</span>' as EventHeader
,'All Experts Appointments' as 'EventDescription' 
 from ExpertAppointments objApp where iAdminCompanyID = @iAdminCompanyID and iVenueID = @iVenueID and CAST(dtAppointmentDate as date) >= CAST(getdate() as DATE) 
 group by dtAppointmentDate
 
 END
 
 
 --select * from LinkedVenue
 
 --select * from Contacts
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAppointmentsForDoctor]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetAllAppointmentsForDoctor]
@iAdminCompanyID int,@iContactID int
AS
BEGIN
select 
dtAppointmentDate as EventDate,'<span style="color:#aeff00;font-weight:bold;font-size:11px;" title="Un-Booked Cases">'+
isNull(Cast((CASE when 1=1 then (Select count(iAppointmentID) from ExpertAppointments objEA1 where not exists(select iCaseID from Cases where iAppointmentID = objEA1.iAppointmentID) and objEA1.dtAppointmentDate = objApp.dtAppointmentDate and iContactID=@iContactID group by objEA1.dtAppointmentDate) ELSE 0 end) as varchar(max)),'') + '</span>'+'<span style="color:#ff8080;font-weight:bold;font-size:11px;" title="Booked Cases"> &nbsp; '
+isNull(Cast((CASE when 1=1 then (Select count(iAppointmentID) from ExpertAppointments objEA2 where exists(select iCaseID from Cases where iAppointmentID = objEA2.iAppointmentID) and objEA2.dtAppointmentDate = objApp.dtAppointmentDate and iContactID=@iContactID group by objEA2.dtAppointmentDate) ELSE 0 end) as varchar(max)),'') + '</span>' as EventHeader
,'All Experts Appointments' as 'EventDescription' 
 from ExpertAppointments objApp where (iAdminCompanyID = 1) and (iContactID = @iContactID) 
 group by dtAppointmentDate
 
 END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAppointments]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetAllAppointments]
@iAdminCompanyID int
AS
BEGIN
select 
dtAppointmentDate as EventDate,'<span style="color:#aeff00;font-weight:bold;font-size:11px;" title="Un-Booked Cases">'+
isNull(Cast((CASE when 1=1 then (Select count(iAppointmentID) from ExpertAppointments objEA1 where not exists(select iCaseID from Cases where iAppointmentID = objEA1.iAppointmentID) and objEA1.dtAppointmentDate = objApp.dtAppointmentDate group by objEA1.dtAppointmentDate) ELSE 0 end) as varchar(max)),'') + '</span>'+'<span style="color:#ff8080;font-weight:bold;font-size:11px;" title="Booked Cases"> &nbsp; '
+isNull(Cast((CASE when 1=1 then (Select count(iAppointmentID) from ExpertAppointments objEA2 where exists(select iCaseID from Cases where iAppointmentID = objEA2.iAppointmentID) and objEA2.dtAppointmentDate = objApp.dtAppointmentDate group by objEA2.dtAppointmentDate) ELSE 0 end) as varchar(max)),'') + '</span>' as EventHeader
,'All Experts Appointments' as 'EventDescription' 
 from ExpertAppointments objApp where iAdminCompanyID = @iAdminCompanyID 
 group by dtAppointmentDate
 
 END
GO
/****** Object:  StoredProcedure [dbo].[sp_AllAppointmentsOnPostCodeRadius]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_AllAppointmentsOnPostCodeRadius]--'10007',5000,1

 @MyPostCode varchar(500)
,@Radius Numeric(18,2)
,@iAdminCompanyID int

AS
Begin
declare @Latitude as numeric (18,5)
declare @Longitude as numeric (18,5)
set @Latitude = 0
set @Longitude = 0
set @Latitude = (SELECT top 1 nLatitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode))   = @MyPostCode)
set @Longitude = (SELECT top 1 nLongitude FROM PostCodeUSA_CA Where Rtrim(Ltrim(sPostCode)) = @MyPostCode)



--select top 1 * from PostCodeUSA_CA where sPostCode = '44444'

select iVenueID,t2.EventDate,t2.EventHeader,t2.EventDescription
,abs(dbo.FindDistance(@Latitude,@Longitude,t2.Lat,t2.Long)) distance
 from (

select * 
,(Case when 1=1 then (select top 1 nLatitude from PostCodeUSA_CA where Ltrim(RTRIM(sPostCode)) = t1.sPostCode) ELSE '0' END) as Lat
,(Case when 1=1 then (select top 1 nLongitude from PostCodeUSA_CA where Ltrim(RTRIM(sPostCode)) = t1.sPostCode) ELSE '0' END) as Long

from (

select iVenueID,(Case when 1=1 then( select sPostCode from LinkedVenue where iVenueID=objApp.iVenueID)else '' END)as sPostCode,
dtAppointmentDate as EventDate,'<span style="color:#aeff00;font-weight:bold;font-size:11px;" title="Un-Booked Cases">'+
isNull(Cast((CASE when 1=1 then (Select count(iAppointmentID) from ExpertAppointments objEA1 where not exists(select iCaseID from Cases where iAppointmentID = objEA1.iAppointmentID) and objEA1.dtAppointmentDate = objApp.dtAppointmentDate group by objEA1.dtAppointmentDate) ELSE 0 end) as varchar(max)),'') + '</span>'+'<span style="color:#ff8080;font-weight:bold;font-size:11px;" title="Booked Cases"> &nbsp; '
+isNull(Cast((CASE when 1=1 then (Select count(iAppointmentID) from ExpertAppointments objEA2 where exists(select iCaseID from Cases where iAppointmentID = objEA2.iAppointmentID) and objEA2.dtAppointmentDate = objApp.dtAppointmentDate group by objEA2.dtAppointmentDate) ELSE 0 end) as varchar(max)),'') + '</span>' as EventHeader
,'All Experts Appointments' as 'EventDescription'
from ExpertAppointments objApp where iAdminCompanyID =@iAdminCompanyID
group by dtAppointmentDate,iVenueID
--Cast (dtAppointmentDate as Date) >= Cast(getdate() as date) ) 
) as t1 

) as t2

where abs(dbo.FindDistance(@Longitude,@Longitude,t2.Lat,t2.Long))<= @Radius  and CAST ( t2.EventDate as Date)>=CAST(GETDATE() as DATE)

END


--select top 10 * from PostCodeUSA_CA
GO
/****** Object:  Table [dbo].[DetailQA]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailQA](
	[iDetailQaID] [int] IDENTITY(1,1) NOT NULL,
	[iCaseID] [int] NULL,
	[iPatient] [int] NULL,
	[sQuestion] [varchar](max) NULL,
	[sAnswer] [varchar](max) NULL,
	[iAdminCompanyID] [int] NULL,
	[iUserID] [int] NULL,
	[dtCreatedDate] [datetime] NULL,
 CONSTRAINT [PK_DetailQA] PRIMARY KEY CLUSTERED 
(
	[iDetailQaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DetailQA] ON
INSERT [dbo].[DetailQA] ([iDetailQaID], [iCaseID], [iPatient], [sQuestion], [sAnswer], [iAdminCompanyID], [iUserID], [dtCreatedDate]) VALUES (2, 15, 10, N'Do you suffer from depression?', N'No', 1, 1, CAST(0x0000A19500D6A445 AS DateTime))
INSERT [dbo].[DetailQA] ([iDetailQaID], [iCaseID], [iPatient], [sQuestion], [sAnswer], [iAdminCompanyID], [iUserID], [dtCreatedDate]) VALUES (3, 15, 10, N'Have you ever had an adverse reaction to sulfa-containing compounds?', N'No', 1, 1, CAST(0x0000A19500D6B1FE AS DateTime))
INSERT [dbo].[DetailQA] ([iDetailQaID], [iCaseID], [iPatient], [sQuestion], [sAnswer], [iAdminCompanyID], [iUserID], [dtCreatedDate]) VALUES (4, 15, 10, N'Have you previously been treated for any type of immune deficiency?', N'No', 1, 1, CAST(0x0000A19500D6C222 AS DateTime))
INSERT [dbo].[DetailQA] ([iDetailQaID], [iCaseID], [iPatient], [sQuestion], [sAnswer], [iAdminCompanyID], [iUserID], [dtCreatedDate]) VALUES (5, 15, 10, N'Do you have a history of heart problems, fluid retention, or uncontrolled hypertension?', N'No', 1, 1, CAST(0x0000A19500D6DC70 AS DateTime))
INSERT [dbo].[DetailQA] ([iDetailQaID], [iCaseID], [iPatient], [sQuestion], [sAnswer], [iAdminCompanyID], [iUserID], [dtCreatedDate]) VALUES (6, 15, 10, N'Have you ever had a seizure?', N'No', 1, 1, CAST(0x0000A19500D6E9CD AS DateTime))
INSERT [dbo].[DetailQA] ([iDetailQaID], [iCaseID], [iPatient], [sQuestion], [sAnswer], [iAdminCompanyID], [iUserID], [dtCreatedDate]) VALUES (14, 18, 10, N'trtyrty', N'rtytryrtytr', 1, 1, CAST(0x0000A1B000CEFE4B AS DateTime))
INSERT [dbo].[DetailQA] ([iDetailQaID], [iCaseID], [iPatient], [sQuestion], [sAnswer], [iAdminCompanyID], [iUserID], [dtCreatedDate]) VALUES (15, 18, 10, N'rtyrtytr', N'rtyrtyry', 1, 1, CAST(0x0000A1B000CF07DA AS DateTime))
INSERT [dbo].[DetailQA] ([iDetailQaID], [iCaseID], [iPatient], [sQuestion], [sAnswer], [iAdminCompanyID], [iUserID], [dtCreatedDate]) VALUES (16, 18, 10, N'dfdf', N'sdfdf', 1, 1, CAST(0x0000A1B000D0AFBC AS DateTime))
SET IDENTITY_INSERT [dbo].[DetailQA] OFF
/****** Object:  Table [dbo].[CaseOrder]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CaseOrder](
	[iOrderID] [int] IDENTITY(1,1) NOT NULL,
	[iCaseID] [int] NOT NULL,
	[iAdminCompanyID] [int] NULL,
	[iPatientID] [int] NULL,
	[iDoctorID] [int] NULL,
	[sTrackingNo] [varchar](500) NOT NULL,
	[nDiscount] [numeric](18, 2) NULL,
	[nGiftCertification] [numeric](18, 2) NULL,
	[nHandlingFee] [numeric](18, 2) NULL,
	[nShippingFee] [numeric](18, 2) NULL,
	[nTotalAmount] [numeric](18, 2) NULL,
	[btOnHold] [bit] NULL,
	[sOnHoldReason] [varchar](max) NULL,
	[btOrderCancel] [bit] NULL,
	[sCancelReason] [varchar](max) NULL,
	[sComments] [varchar](max) NULL,
	[dtCreatedDate] [datetime] NULL,
	[iPharmacistID] [int] NULL,
 CONSTRAINT [PK_CaseOrder] PRIMARY KEY CLUSTERED 
(
	[iOrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CaseOrder] ON
INSERT [dbo].[CaseOrder] ([iOrderID], [iCaseID], [iAdminCompanyID], [iPatientID], [iDoctorID], [sTrackingNo], [nDiscount], [nGiftCertification], [nHandlingFee], [nShippingFee], [nTotalAmount], [btOnHold], [sOnHoldReason], [btOrderCancel], [sCancelReason], [sComments], [dtCreatedDate], [iPharmacistID]) VALUES (2, 15, 1, 10, 6, N'ORD-00001', CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), NULL, 0, N'sdfsdf', 0, N'asdfasdfasdfasdf', N'asdfasdfasdfa', CAST(0x0000A1B000FF39D6 AS DateTime), 12)
INSERT [dbo].[CaseOrder] ([iOrderID], [iCaseID], [iAdminCompanyID], [iPatientID], [iDoctorID], [sTrackingNo], [nDiscount], [nGiftCertification], [nHandlingFee], [nShippingFee], [nTotalAmount], [btOnHold], [sOnHoldReason], [btOrderCancel], [sCancelReason], [sComments], [dtCreatedDate], [iPharmacistID]) VALUES (3, 17, 1, 10, 6, N'45455', CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A19C010976E1 AS DateTime), 9)
INSERT [dbo].[CaseOrder] ([iOrderID], [iCaseID], [iAdminCompanyID], [iPatientID], [iDoctorID], [sTrackingNo], [nDiscount], [nGiftCertification], [nHandlingFee], [nShippingFee], [nTotalAmount], [btOnHold], [sOnHoldReason], [btOrderCancel], [sCancelReason], [sComments], [dtCreatedDate], [iPharmacistID]) VALUES (4, 14, 1, 11, 6, N'3344', CAST(4.00 AS Numeric(18, 2)), CAST(34.00 AS Numeric(18, 2)), CAST(4.00 AS Numeric(18, 2)), CAST(343.00 AS Numeric(18, 2)), NULL, 1, N'3434', 1, N'3434', N'343', CAST(0x0000A1B000B86D8C AS DateTime), -1)
INSERT [dbo].[CaseOrder] ([iOrderID], [iCaseID], [iAdminCompanyID], [iPatientID], [iDoctorID], [sTrackingNo], [nDiscount], [nGiftCertification], [nHandlingFee], [nShippingFee], [nTotalAmount], [btOnHold], [sOnHoldReason], [btOrderCancel], [sCancelReason], [sComments], [dtCreatedDate], [iPharmacistID]) VALUES (5, 18, 1, 10, 16, N'543354', CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), NULL, 1, N'wrwer', 1, N'werwe', N'ewrwe', CAST(0x0000A1B000D0FA9D AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[CaseOrder] OFF
/****** Object:  Table [dbo].[CaseNotes]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CaseNotes](
	[iCaseNoteID] [int] IDENTITY(1,1) NOT NULL,
	[iCaseID] [int] NULL,
	[sDescription] [varchar](max) NULL,
	[iUserIDCreatedBy] [int] NULL,
	[dtCreatedDate] [datetime] NULL,
	[dtModiffyDate] [datetime] NULL,
 CONSTRAINT [PK_CaseNotes] PRIMARY KEY CLUSTERED 
(
	[iCaseNoteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CaseNotes] ON
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (1, 15, N'Appointment Attended', 1, CAST(0x0000A195010DAA71 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (2, 15, N'hdfh', 1, CAST(0x0000A19C0108448C AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (3, 15, N'jgjjgfgjfd', 1, CAST(0x0000A19C010855A1 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (4, 15, NULL, 1, CAST(0x0000A19C0108884B AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (5, 15, NULL, 1, CAST(0x0000A19C01088CDB AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (6, 15, NULL, 1, CAST(0x0000A19C01088F8C AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (7, 15, NULL, 1, CAST(0x0000A19C0108938E AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (8, 17, N'jgjjgfgjfd', 1, CAST(0x0000A19C010A89B4 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (9, 17, N'hdfh', 1, CAST(0x0000A19C010C064A AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (10, 17, NULL, 1, CAST(0x0000A19C010C0925 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (11, 17, NULL, 1, CAST(0x0000A19C010C0A85 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (12, 17, NULL, 1, CAST(0x0000A19C010C0BA3 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (13, 14, N'zx', 1, CAST(0x0000A1A9003E44E8 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (14, 14, N'343', 1, CAST(0x0000A1B000B87835 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (15, 14, N'344', 1, CAST(0x0000A1B000B87DF6 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (16, 14, N'ww', 1, CAST(0x0000A1B000B89362 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (17, 14, N'sdfsf', 1, CAST(0x0000A1B000B8DC15 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (18, 14, N'fdsf', 1, CAST(0x0000A1B000B8E61D AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (19, 14, N'fdsf', 1, CAST(0x0000A1B000B8F91F AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (20, 18, N'werwe', 1, CAST(0x0000A1B000D10C39 AS DateTime), NULL)
INSERT [dbo].[CaseNotes] ([iCaseNoteID], [iCaseID], [sDescription], [iUserIDCreatedBy], [dtCreatedDate], [dtModiffyDate]) VALUES (21, 18, N'werwere', 1, CAST(0x0000A1B000D1105B AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CaseNotes] OFF
/****** Object:  Table [dbo].[CaseDocument]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CaseDocument](
	[iDocumentID] [int] IDENTITY(1,1) NOT NULL,
	[sDocumentName] [varchar](500) NULL,
	[iCaseID] [int] NULL,
	[dtCreatedDate] [datetime] NULL,
	[sDocumentPath] [varchar](max) NULL,
	[iPatient] [int] NULL,
	[sDescription] [varchar](max) NULL,
 CONSTRAINT [PK_CaseDocument] PRIMARY KEY CLUSTERED 
(
	[iDocumentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CaseDocument] ON
INSERT [dbo].[CaseDocument] ([iDocumentID], [sDocumentName], [iCaseID], [dtCreatedDate], [sDocumentPath], [iPatient], [sDescription]) VALUES (2, N'Test Document for Case Description', 14, CAST(0x0000A19500B5F8E0 AS DateTime), N'47516360-5a5c-42e3-8be3-2f554b34a304Main Queue.pdf', 11, N'Test Document for Case Description')
INSERT [dbo].[CaseDocument] ([iDocumentID], [sDocumentName], [iCaseID], [dtCreatedDate], [sDocumentPath], [iPatient], [sDescription]) VALUES (4, N'zia', 15, CAST(0x0000A19C0105C5CD AS DateTime), N'812cb777-6ac0-4644-acd1-b2fd9c64fed6Main Queue.pdf', 10, N'web developer')
INSERT [dbo].[CaseDocument] ([iDocumentID], [sDocumentName], [iCaseID], [dtCreatedDate], [sDocumentPath], [iPatient], [sDescription]) VALUES (7, N'g', 17, CAST(0x0000A19C0113D126 AS DateTime), N'6de7114f-9362-4036-8882-89f3915cb188Main Queue.pdf', 10, N'ghhg')
INSERT [dbo].[CaseDocument] ([iDocumentID], [sDocumentName], [iCaseID], [dtCreatedDate], [sDocumentPath], [iPatient], [sDescription]) VALUES (8, N'gjkfd', 16, CAST(0x0000A1AB00B1EF19 AS DateTime), N'75b7d9e6-cb61-4064-9bf4-6e20d34cf413Tulips.jpg', 11, N'fgfggfd')
INSERT [dbo].[CaseDocument] ([iDocumentID], [sDocumentName], [iCaseID], [dtCreatedDate], [sDocumentPath], [iPatient], [sDescription]) VALUES (12, N'dfd', 18, CAST(0x0000A1B000CED707 AS DateTime), N'87f7ea6d-6ebd-4fa0-8b3f-12e524d25ff7Jellyfish.jpg', 10, N'dfdfd')
INSERT [dbo].[CaseDocument] ([iDocumentID], [sDocumentName], [iCaseID], [dtCreatedDate], [sDocumentPath], [iPatient], [sDescription]) VALUES (13, N'tretre', 18, CAST(0x0000A1B000CEEF0F AS DateTime), N'f8458fb7-2c08-4332-9d94-12aa52b84285Koala.jpg', 10, N'ertertertr')
INSERT [dbo].[CaseDocument] ([iDocumentID], [sDocumentName], [iCaseID], [dtCreatedDate], [sDocumentPath], [iPatient], [sDescription]) VALUES (14, N'rte', 18, CAST(0x0000A1B000D09276 AS DateTime), N'4be9d232-f2cf-4f7b-a0ec-aa27ce0b261aLighthouse.jpg', 10, N'ertet')
SET IDENTITY_INSERT [dbo].[CaseDocument] OFF
/****** Object:  StoredProcedure [dbo].[PatientAreaOnMAP]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PatientAreaOnMAP]-- '10009',8000,1
@sPostCode varchar(500)
,@Radius int
,@iAdminCompanyID int

As

BEgin
Declare @TempSearchForMap TABLE(

title varchar(500), 
lat numeric(18,10),

lng numeric(18,10),
[description] varchar(500)

,locationType varchar(500)

)

insert into @TempSearchForMap(title,lat,lng,[description])
exec [dbo].[AvailableApptInPostCodeRadiusOnMAP]@sPostCode,@Radius,@iAdminCompanyID
UPDATE @TempSearchForMap 
SET locationType ='Doctor' 
where locationType is null
insert into @TempSearchForMap(title,lat,lng,[description])
exec [dbo].[PhamrmasistPostCodeRadiusOnMAP] @sPostCode,@Radius,@iAdminCompanyID
UPDATE @TempSearchForMap SET locationType ='Pharmasist' where locationType is null
insert into @TempSearchForMap(title,lat,lng,[description])
 exec [dbo].[HospitalOnMAP] @sPostCode,@Radius,@iAdminCompanyID
UPDATE @TempSearchForMap SET locationType ='Hospital' where locationType is null

insert into @TempSearchForMap(title,lat,lng,[description],locationType)
select top 1 'My Location',nLatitude,nLongitude,'My Location','MyLocation' from PostCodeUSA_CA where sPostCode = @sPostCode


select * from @TempSearchForMap

END
GO
/****** Object:  Table [dbo].[GeneralQA]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GeneralQA](
	[iQaID] [int] IDENTITY(1,1) NOT NULL,
	[iCaseID] [int] NULL,
	[iPatient] [int] NULL,
	[dtDateofBirth] [datetime] NULL,
	[sHieght] [varchar](500) NULL,
	[sWeight] [varchar](500) NULL,
	[sSex] [varchar](500) NULL,
	[btDoSmoke] [bit] NULL,
	[btDoDrinkMoreThan2] [bit] NULL,
	[btIsPregnant] [bit] NULL,
	[btSmokeMoreThan1] [bit] NULL,
	[btPlanToPragnent] [bit] NULL,
	[sListAllergies] [varchar](max) NULL,
	[sPrimaryPhyscian1] [varchar](500) NULL,
	[sPhyscianPhone1] [varchar](500) NULL,
	[dtDateLastDrVisit] [datetime] NULL,
	[iPrimaryDoctorID] [int] NULL,
	[dtCreatedDate] [datetime] NULL,
	[iAdminCompanyID] [int] NULL,
	[sPastCondition] [varchar](max) NULL,
	[sCurrentCondition] [varchar](max) NULL,
	[sFamilyCondition] [varchar](max) NULL,
 CONSTRAINT [PK_GeneralQA] PRIMARY KEY CLUSTERED 
(
	[iQaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GeneralQA] ON
INSERT [dbo].[GeneralQA] ([iQaID], [iCaseID], [iPatient], [dtDateofBirth], [sHieght], [sWeight], [sSex], [btDoSmoke], [btDoDrinkMoreThan2], [btIsPregnant], [btSmokeMoreThan1], [btPlanToPragnent], [sListAllergies], [sPrimaryPhyscian1], [sPhyscianPhone1], [dtDateLastDrVisit], [iPrimaryDoctorID], [dtCreatedDate], [iAdminCompanyID], [sPastCondition], [sCurrentCondition], [sFamilyCondition]) VALUES (1, 15, 10, CAST(0x00007C7C00000000 AS DateTime), N'6 ft', N'189 lbs', N'Female', 1, 1, 1, 1, 1, N'Dust', N'Dr. Mark Davis', N'342342134', CAST(0x0000A19200000000 AS DateTime), 8, CAST(0x0000A19C01073B4C AS DateTime), 1, N'Normal', N'Weak', N'Middle class')
INSERT [dbo].[GeneralQA] ([iQaID], [iCaseID], [iPatient], [dtDateofBirth], [sHieght], [sWeight], [sSex], [btDoSmoke], [btDoDrinkMoreThan2], [btIsPregnant], [btSmokeMoreThan1], [btPlanToPragnent], [sListAllergies], [sPrimaryPhyscian1], [sPhyscianPhone1], [dtDateLastDrVisit], [iPrimaryDoctorID], [dtCreatedDate], [iAdminCompanyID], [sPastCondition], [sCurrentCondition], [sFamilyCondition]) VALUES (2, 17, 10, CAST(0x0000866800000000 AS DateTime), N'175', N'70kg', N'Male', 1, 0, 0, 1, 0, N'abc', N'Dr. Zeenat Amaan', N'4454555', CAST(0x0000A19D00000000 AS DateTime), 13, CAST(0x0000A19C010A33AA AS DateTime), 1, N'abc', NULL, N'Middle class')
SET IDENTITY_INSERT [dbo].[GeneralQA] OFF
/****** Object:  Table [dbo].[Prescriptions]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prescriptions](
	[iPrescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[sDescription] [varchar](max) NULL,
	[iCaseID] [int] NULL,
	[iContactID] [int] NULL,
	[dtCreatedDate] [datetime] NULL,
	[dtModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Prescriptions] PRIMARY KEY CLUSTERED 
(
	[iPrescriptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[proc_CasesUpdate]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CasesUpdate]
(
	@iCaseID int,
	@iPatientID int = NULL,
	@iAdminCompanyID int = NULL,
	@iUserIDCreatedBy int = NULL,
	@iExpretID int = NULL,
	@sCaseDiscription varchar(MAX) = NULL,
	@dtCreatedDate datetime = NULL,
	@sCaseStatus varchar(500) = NULL,
	@dtCaseDate datetime = NULL,
	@iAppointmentID int = NULL,
	@sBillingAddress varchar(500) = NULL,
	@sBillingPostCode varchar(500) = NULL,
	@sBillingCountry varchar(500) = NULL,
	@sBillingPhone varchar(500) = NULL,
	@sBillingEmail varchar(500) = NULL,
	@sShippingAddress varchar(500) = NULL,
	@sShippingPostCode varchar(500) = NULL,
	@sShippingCountry varchar(500) = NULL,
	@sShippingPhone varchar(500) = NULL,
	@sShippingEmail varchar(500) = NULL,
	@sCaseRefNo varchar(500) = NULL,
	@iVenueID int = NULL,
	@sDoctorInstructions varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Cases]
	SET
		[iPatientID] = @iPatientID,
		[iAdminCompanyID] = @iAdminCompanyID,
		[iUserIDCreatedBy] = @iUserIDCreatedBy,
		[iExpretID] = @iExpretID,
		[sCaseDiscription] = @sCaseDiscription,
		[dtCreatedDate] = @dtCreatedDate,
		[sCaseStatus] = @sCaseStatus,
		[dtCaseDate] = @dtCaseDate,
		[iAppointmentID] = @iAppointmentID,
		[sBillingAddress] = @sBillingAddress,
		[sBillingPostCode] = @sBillingPostCode,
		[sBillingCountry] = @sBillingCountry,
		[sBillingPhone] = @sBillingPhone,
		[sBillingEmail] = @sBillingEmail,
		[sShippingAddress] = @sShippingAddress,
		[sShippingPostCode] = @sShippingPostCode,
		[sShippingCountry] = @sShippingCountry,
		[sShippingPhone] = @sShippingPhone,
		[sShippingEmail] = @sShippingEmail,
		[sCaseRefNo] = @sCaseRefNo,
		[iVenueID] = @iVenueID,
		[sDoctorInstructions] = @sDoctorInstructions
	WHERE
		[iCaseID] = @iCaseID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CasesLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CasesLoadByPrimaryKey]
(
	@iCaseID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iCaseID],
		[iPatientID],
		[iAdminCompanyID],
		[iUserIDCreatedBy],
		[iExpretID],
		[sCaseDiscription],
		[dtCreatedDate],
		[sCaseStatus],
		[dtCaseDate],
		[iAppointmentID],
		[sBillingAddress],
		[sBillingPostCode],
		[sBillingCountry],
		[sBillingPhone],
		[sBillingEmail],
		[sShippingAddress],
		[sShippingPostCode],
		[sShippingCountry],
		[sShippingPhone],
		[sShippingEmail],
		[sCaseRefNo],
		[iVenueID],
		[sDoctorInstructions]
	FROM [Cases]
	WHERE
		([iCaseID] = @iCaseID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CasesLoadAll]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CasesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iCaseID],
		[iPatientID],
		[iAdminCompanyID],
		[iUserIDCreatedBy],
		[iExpretID],
		[sCaseDiscription],
		[dtCreatedDate],
		[sCaseStatus],
		[dtCaseDate],
		[iAppointmentID],
		[sBillingAddress],
		[sBillingPostCode],
		[sBillingCountry],
		[sBillingPhone],
		[sBillingEmail],
		[sShippingAddress],
		[sShippingPostCode],
		[sShippingCountry],
		[sShippingPhone],
		[sShippingEmail],
		[sCaseRefNo],
		[iVenueID],
		[sDoctorInstructions]
	FROM [Cases]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CasesInsert]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CasesInsert]
(
	@iCaseID int = NULL output,
	@iPatientID int = NULL,
	@iAdminCompanyID int = NULL,
	@iUserIDCreatedBy int = NULL,
	@iExpretID int = NULL,
	@sCaseDiscription varchar(MAX) = NULL,
	@dtCreatedDate datetime = NULL,
	@sCaseStatus varchar(500) = NULL,
	@dtCaseDate datetime = NULL,
	@iAppointmentID int = NULL,
	@sBillingAddress varchar(500) = NULL,
	@sBillingPostCode varchar(500) = NULL,
	@sBillingCountry varchar(500) = NULL,
	@sBillingPhone varchar(500) = NULL,
	@sBillingEmail varchar(500) = NULL,
	@sShippingAddress varchar(500) = NULL,
	@sShippingPostCode varchar(500) = NULL,
	@sShippingCountry varchar(500) = NULL,
	@sShippingPhone varchar(500) = NULL,
	@sShippingEmail varchar(500) = NULL,
	@sCaseRefNo varchar(500) = NULL,
	@iVenueID int = NULL,
	@sDoctorInstructions varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Cases]
	(
		[iPatientID],
		[iAdminCompanyID],
		[iUserIDCreatedBy],
		[iExpretID],
		[sCaseDiscription],
		[dtCreatedDate],
		[sCaseStatus],
		[dtCaseDate],
		[iAppointmentID],
		[sBillingAddress],
		[sBillingPostCode],
		[sBillingCountry],
		[sBillingPhone],
		[sBillingEmail],
		[sShippingAddress],
		[sShippingPostCode],
		[sShippingCountry],
		[sShippingPhone],
		[sShippingEmail],
		[sCaseRefNo],
		[iVenueID],
		[sDoctorInstructions]
	)
	VALUES
	(
		@iPatientID,
		@iAdminCompanyID,
		@iUserIDCreatedBy,
		@iExpretID,
		@sCaseDiscription,
		@dtCreatedDate,
		@sCaseStatus,
		@dtCaseDate,
		@iAppointmentID,
		@sBillingAddress,
		@sBillingPostCode,
		@sBillingCountry,
		@sBillingPhone,
		@sBillingEmail,
		@sShippingAddress,
		@sShippingPostCode,
		@sShippingCountry,
		@sShippingPhone,
		@sShippingEmail,
		@sCaseRefNo,
		@iVenueID,
		@sDoctorInstructions
	)

	SET @Err = @@Error

	SELECT @iCaseID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CasesDelete]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CasesDelete]
(
	@iCaseID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Cases]
	WHERE
		[iCaseID] = @iCaseID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  Table [dbo].[PaymentInformation]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentInformation](
	[iPaymentInfoID] [int] IDENTITY(1,1) NOT NULL,
	[iCaseID] [int] NULL,
	[iPatientID] [int] NULL,
	[sCreditCardName] [varchar](500) NULL,
	[iExpiryMonth] [int] NULL,
	[iExpiryYear] [int] NULL,
	[sCardType] [varchar](500) NULL,
	[sBankName] [varchar](500) NULL,
	[sPaymentStatus] [varchar](500) NULL,
	[sPaymentMethod] [varchar](500) NULL,
	[dtCreatedDate] [datetime] NULL,
	[iAdminCompanyID] [int] NULL,
	[sDescription] [varchar](500) NULL,
 CONSTRAINT [PK_PaymentInformation] PRIMARY KEY CLUSTERED 
(
	[iPaymentInfoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[proc_GeneralQAUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_GeneralQAUpdate]
(
	@iQaID int,
	@iCaseID int = NULL,
	@iPatient int = NULL,
	@dtDateofBirth datetime = NULL,
	@sHieght varchar(500) = NULL,
	@sWeight varchar(500) = NULL,
	@sSex varchar(500) = NULL,
	@btDoSmoke bit = NULL,
	@btDoDrinkMoreThan2 bit = NULL,
	@btIsPregnant bit = NULL,
	@btSmokeMoreThan1 bit = NULL,
	@btPlanToPragnent bit = NULL,
	@sListAllergies varchar(MAX) = NULL,
	@sPrimaryPhyscian1 varchar(500) = NULL,
	@sPhyscianPhone1 varchar(500) = NULL,
	@dtDateLastDrVisit datetime = NULL,
	@iPrimaryDoctorID int = NULL,
	@dtCreatedDate datetime = NULL,
	@iAdminCompanyID int = NULL,
	@sPastCondition varchar(MAX) = NULL,
	@sCurrentCondition varchar(MAX) = NULL,
	@sFamilyCondition varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [GeneralQA]
	SET
		[iCaseID] = @iCaseID,
		[iPatient] = @iPatient,
		[dtDateofBirth] = @dtDateofBirth,
		[sHieght] = @sHieght,
		[sWeight] = @sWeight,
		[sSex] = @sSex,
		[btDoSmoke] = @btDoSmoke,
		[btDoDrinkMoreThan2] = @btDoDrinkMoreThan2,
		[btIsPregnant] = @btIsPregnant,
		[btSmokeMoreThan1] = @btSmokeMoreThan1,
		[btPlanToPragnent] = @btPlanToPragnent,
		[sListAllergies] = @sListAllergies,
		[sPrimaryPhyscian1] = @sPrimaryPhyscian1,
		[sPhyscianPhone1] = @sPhyscianPhone1,
		[dtDateLastDrVisit] = @dtDateLastDrVisit,
		[iPrimaryDoctorID] = @iPrimaryDoctorID,
		[dtCreatedDate] = @dtCreatedDate,
		[iAdminCompanyID] = @iAdminCompanyID,
		[sPastCondition] = @sPastCondition,
		[sCurrentCondition] = @sCurrentCondition,
		[sFamilyCondition] = @sFamilyCondition
	WHERE
		[iQaID] = @iQaID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GeneralQALoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_GeneralQALoadByPrimaryKey]
(
	@iQaID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iQaID],
		[iCaseID],
		[iPatient],
		[dtDateofBirth],
		[sHieght],
		[sWeight],
		[sSex],
		[btDoSmoke],
		[btDoDrinkMoreThan2],
		[btIsPregnant],
		[btSmokeMoreThan1],
		[btPlanToPragnent],
		[sListAllergies],
		[sPrimaryPhyscian1],
		[sPhyscianPhone1],
		[dtDateLastDrVisit],
		[iPrimaryDoctorID],
		[dtCreatedDate],
		[iAdminCompanyID],
		[sPastCondition],
		[sCurrentCondition],
		[sFamilyCondition]
	FROM [GeneralQA]
	WHERE
		([iQaID] = @iQaID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GeneralQALoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_GeneralQALoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iQaID],
		[iCaseID],
		[iPatient],
		[dtDateofBirth],
		[sHieght],
		[sWeight],
		[sSex],
		[btDoSmoke],
		[btDoDrinkMoreThan2],
		[btIsPregnant],
		[btSmokeMoreThan1],
		[btPlanToPragnent],
		[sListAllergies],
		[sPrimaryPhyscian1],
		[sPhyscianPhone1],
		[dtDateLastDrVisit],
		[iPrimaryDoctorID],
		[dtCreatedDate],
		[iAdminCompanyID],
		[sPastCondition],
		[sCurrentCondition],
		[sFamilyCondition]
	FROM [GeneralQA]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GeneralQAInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_GeneralQAInsert]
(
	@iQaID int = NULL output,
	@iCaseID int = NULL,
	@iPatient int = NULL,
	@dtDateofBirth datetime = NULL,
	@sHieght varchar(500) = NULL,
	@sWeight varchar(500) = NULL,
	@sSex varchar(500) = NULL,
	@btDoSmoke bit = NULL,
	@btDoDrinkMoreThan2 bit = NULL,
	@btIsPregnant bit = NULL,
	@btSmokeMoreThan1 bit = NULL,
	@btPlanToPragnent bit = NULL,
	@sListAllergies varchar(MAX) = NULL,
	@sPrimaryPhyscian1 varchar(500) = NULL,
	@sPhyscianPhone1 varchar(500) = NULL,
	@dtDateLastDrVisit datetime = NULL,
	@iPrimaryDoctorID int = NULL,
	@dtCreatedDate datetime = NULL,
	@iAdminCompanyID int = NULL,
	@sPastCondition varchar(MAX) = NULL,
	@sCurrentCondition varchar(MAX) = NULL,
	@sFamilyCondition varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [GeneralQA]
	(
		[iCaseID],
		[iPatient],
		[dtDateofBirth],
		[sHieght],
		[sWeight],
		[sSex],
		[btDoSmoke],
		[btDoDrinkMoreThan2],
		[btIsPregnant],
		[btSmokeMoreThan1],
		[btPlanToPragnent],
		[sListAllergies],
		[sPrimaryPhyscian1],
		[sPhyscianPhone1],
		[dtDateLastDrVisit],
		[iPrimaryDoctorID],
		[dtCreatedDate],
		[iAdminCompanyID],
		[sPastCondition],
		[sCurrentCondition],
		[sFamilyCondition]
	)
	VALUES
	(
		@iCaseID,
		@iPatient,
		@dtDateofBirth,
		@sHieght,
		@sWeight,
		@sSex,
		@btDoSmoke,
		@btDoDrinkMoreThan2,
		@btIsPregnant,
		@btSmokeMoreThan1,
		@btPlanToPragnent,
		@sListAllergies,
		@sPrimaryPhyscian1,
		@sPhyscianPhone1,
		@dtDateLastDrVisit,
		@iPrimaryDoctorID,
		@dtCreatedDate,
		@iAdminCompanyID,
		@sPastCondition,
		@sCurrentCondition,
		@sFamilyCondition
	)

	SET @Err = @@Error

	SELECT @iQaID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GeneralQADelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_GeneralQADelete]
(
	@iQaID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [GeneralQA]
	WHERE
		[iQaID] = @iQaID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_DetailQAUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DetailQAUpdate]
(
	@iDetailQaID int,
	@iCaseID int = NULL,
	@iPatient int = NULL,
	@sQuestion varchar(MAX) = NULL,
	@sAnswer varchar(MAX) = NULL,
	@iAdminCompanyID int = NULL,
	@iUserID int = NULL,
	@dtCreatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [DetailQA]
	SET
		[iCaseID] = @iCaseID,
		[iPatient] = @iPatient,
		[sQuestion] = @sQuestion,
		[sAnswer] = @sAnswer,
		[iAdminCompanyID] = @iAdminCompanyID,
		[iUserID] = @iUserID,
		[dtCreatedDate] = @dtCreatedDate
	WHERE
		[iDetailQaID] = @iDetailQaID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_DetailQALoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DetailQALoadByPrimaryKey]
(
	@iDetailQaID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iDetailQaID],
		[iCaseID],
		[iPatient],
		[sQuestion],
		[sAnswer],
		[iAdminCompanyID],
		[iUserID],
		[dtCreatedDate]
	FROM [DetailQA]
	WHERE
		([iDetailQaID] = @iDetailQaID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_DetailQALoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DetailQALoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iDetailQaID],
		[iCaseID],
		[iPatient],
		[sQuestion],
		[sAnswer],
		[iAdminCompanyID],
		[iUserID],
		[dtCreatedDate]
	FROM [DetailQA]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_DetailQAInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DetailQAInsert]
(
	@iDetailQaID int = NULL output,
	@iCaseID int = NULL,
	@iPatient int = NULL,
	@sQuestion varchar(MAX) = NULL,
	@sAnswer varchar(MAX) = NULL,
	@iAdminCompanyID int = NULL,
	@iUserID int = NULL,
	@dtCreatedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [DetailQA]
	(
		[iCaseID],
		[iPatient],
		[sQuestion],
		[sAnswer],
		[iAdminCompanyID],
		[iUserID],
		[dtCreatedDate]
	)
	VALUES
	(
		@iCaseID,
		@iPatient,
		@sQuestion,
		@sAnswer,
		@iAdminCompanyID,
		@iUserID,
		@dtCreatedDate
	)

	SET @Err = @@Error

	SELECT @iDetailQaID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_DetailQADelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DetailQADelete]
(
	@iDetailQaID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [DetailQA]
	WHERE
		[iDetailQaID] = @iDetailQaID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseOrderUpdate]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseOrderUpdate]
(
	@iOrderID int,
	@iCaseID int,
	@iAdminCompanyID int = NULL,
	@iPatientID int = NULL,
	@iDoctorID int = NULL,
	@sTrackingNo varchar(500),
	@nDiscount numeric(18,2) = NULL,
	@nGiftCertification numeric(18,2) = NULL,
	@nHandlingFee numeric(18,2) = NULL,
	@nShippingFee numeric(18,2) = NULL,
	@nTotalAmount numeric(18,2) = NULL,
	@btOnHold bit = NULL,
	@sOnHoldReason varchar(MAX) = NULL,
	@btOrderCancel bit = NULL,
	@sCancelReason varchar(MAX) = NULL,
	@sComments varchar(MAX) = NULL,
	@dtCreatedDate datetime = NULL,
	@iPharmacistID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CaseOrder]
	SET
		[iCaseID] = @iCaseID,
		[iAdminCompanyID] = @iAdminCompanyID,
		[iPatientID] = @iPatientID,
		[iDoctorID] = @iDoctorID,
		[sTrackingNo] = @sTrackingNo,
		[nDiscount] = @nDiscount,
		[nGiftCertification] = @nGiftCertification,
		[nHandlingFee] = @nHandlingFee,
		[nShippingFee] = @nShippingFee,
		[nTotalAmount] = @nTotalAmount,
		[btOnHold] = @btOnHold,
		[sOnHoldReason] = @sOnHoldReason,
		[btOrderCancel] = @btOrderCancel,
		[sCancelReason] = @sCancelReason,
		[sComments] = @sComments,
		[dtCreatedDate] = @dtCreatedDate,
		[iPharmacistID] = @iPharmacistID
	WHERE
		[iOrderID] = @iOrderID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseOrderLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseOrderLoadByPrimaryKey]
(
	@iOrderID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iOrderID],
		[iCaseID],
		[iAdminCompanyID],
		[iPatientID],
		[iDoctorID],
		[sTrackingNo],
		[nDiscount],
		[nGiftCertification],
		[nHandlingFee],
		[nShippingFee],
		[nTotalAmount],
		[btOnHold],
		[sOnHoldReason],
		[btOrderCancel],
		[sCancelReason],
		[sComments],
		[dtCreatedDate],
		[iPharmacistID]
	FROM [CaseOrder]
	WHERE
		([iOrderID] = @iOrderID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseOrderLoadAll]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseOrderLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iOrderID],
		[iCaseID],
		[iAdminCompanyID],
		[iPatientID],
		[iDoctorID],
		[sTrackingNo],
		[nDiscount],
		[nGiftCertification],
		[nHandlingFee],
		[nShippingFee],
		[nTotalAmount],
		[btOnHold],
		[sOnHoldReason],
		[btOrderCancel],
		[sCancelReason],
		[sComments],
		[dtCreatedDate],
		[iPharmacistID]
	FROM [CaseOrder]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseOrderInsert]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseOrderInsert]
(
	@iOrderID int = NULL output,
	@iCaseID int,
	@iAdminCompanyID int = NULL,
	@iPatientID int = NULL,
	@iDoctorID int = NULL,
	@sTrackingNo varchar(500),
	@nDiscount numeric(18,2) = NULL,
	@nGiftCertification numeric(18,2) = NULL,
	@nHandlingFee numeric(18,2) = NULL,
	@nShippingFee numeric(18,2) = NULL,
	@nTotalAmount numeric(18,2) = NULL,
	@btOnHold bit = NULL,
	@sOnHoldReason varchar(MAX) = NULL,
	@btOrderCancel bit = NULL,
	@sCancelReason varchar(MAX) = NULL,
	@sComments varchar(MAX) = NULL,
	@dtCreatedDate datetime = NULL,
	@iPharmacistID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CaseOrder]
	(
		[iCaseID],
		[iAdminCompanyID],
		[iPatientID],
		[iDoctorID],
		[sTrackingNo],
		[nDiscount],
		[nGiftCertification],
		[nHandlingFee],
		[nShippingFee],
		[nTotalAmount],
		[btOnHold],
		[sOnHoldReason],
		[btOrderCancel],
		[sCancelReason],
		[sComments],
		[dtCreatedDate],
		[iPharmacistID]
	)
	VALUES
	(
		@iCaseID,
		@iAdminCompanyID,
		@iPatientID,
		@iDoctorID,
		@sTrackingNo,
		@nDiscount,
		@nGiftCertification,
		@nHandlingFee,
		@nShippingFee,
		@nTotalAmount,
		@btOnHold,
		@sOnHoldReason,
		@btOrderCancel,
		@sCancelReason,
		@sComments,
		@dtCreatedDate,
		@iPharmacistID
	)

	SET @Err = @@Error

	SELECT @iOrderID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseOrderDelete]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseOrderDelete]
(
	@iOrderID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CaseOrder]
	WHERE
		[iOrderID] = @iOrderID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseNotesUpdate]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseNotesUpdate]
(
	@iCaseNoteID int,
	@iCaseID int = NULL,
	@sDescription varchar(MAX) = NULL,
	@iUserIDCreatedBy int = NULL,
	@dtCreatedDate datetime = NULL,
	@dtModiffyDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CaseNotes]
	SET
		[iCaseID] = @iCaseID,
		[sDescription] = @sDescription,
		[iUserIDCreatedBy] = @iUserIDCreatedBy,
		[dtCreatedDate] = @dtCreatedDate,
		[dtModiffyDate] = @dtModiffyDate
	WHERE
		[iCaseNoteID] = @iCaseNoteID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseNotesLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseNotesLoadByPrimaryKey]
(
	@iCaseNoteID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iCaseNoteID],
		[iCaseID],
		[sDescription],
		[iUserIDCreatedBy],
		[dtCreatedDate],
		[dtModiffyDate]
	FROM [CaseNotes]
	WHERE
		([iCaseNoteID] = @iCaseNoteID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseNotesLoadAll]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseNotesLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iCaseNoteID],
		[iCaseID],
		[sDescription],
		[iUserIDCreatedBy],
		[dtCreatedDate],
		[dtModiffyDate]
	FROM [CaseNotes]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseNotesInsert]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseNotesInsert]
(
	@iCaseNoteID int = NULL output,
	@iCaseID int = NULL,
	@sDescription varchar(MAX) = NULL,
	@iUserIDCreatedBy int = NULL,
	@dtCreatedDate datetime = NULL,
	@dtModiffyDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CaseNotes]
	(
		[iCaseID],
		[sDescription],
		[iUserIDCreatedBy],
		[dtCreatedDate],
		[dtModiffyDate]
	)
	VALUES
	(
		@iCaseID,
		@sDescription,
		@iUserIDCreatedBy,
		@dtCreatedDate,
		@dtModiffyDate
	)

	SET @Err = @@Error

	SELECT @iCaseNoteID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseNotesDelete]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseNotesDelete]
(
	@iCaseNoteID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CaseNotes]
	WHERE
		[iCaseNoteID] = @iCaseNoteID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseDocumentUpdate]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseDocumentUpdate]
(
	@iDocumentID int,
	@sDocumentName varchar(500) = NULL,
	@iCaseID int = NULL,
	@dtCreatedDate datetime = NULL,
	@sDocumentPath varchar(MAX) = NULL,
	@iPatient int = NULL,
	@sDescription varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [CaseDocument]
	SET
		[sDocumentName] = @sDocumentName,
		[iCaseID] = @iCaseID,
		[dtCreatedDate] = @dtCreatedDate,
		[sDocumentPath] = @sDocumentPath,
		[iPatient] = @iPatient,
		[sDescription] = @sDescription
	WHERE
		[iDocumentID] = @iDocumentID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseDocumentLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseDocumentLoadByPrimaryKey]
(
	@iDocumentID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iDocumentID],
		[sDocumentName],
		[iCaseID],
		[dtCreatedDate],
		[sDocumentPath],
		[iPatient],
		[sDescription]
	FROM [CaseDocument]
	WHERE
		([iDocumentID] = @iDocumentID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseDocumentLoadAll]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseDocumentLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iDocumentID],
		[sDocumentName],
		[iCaseID],
		[dtCreatedDate],
		[sDocumentPath],
		[iPatient],
		[sDescription]
	FROM [CaseDocument]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseDocumentInsert]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseDocumentInsert]
(
	@iDocumentID int = NULL output,
	@sDocumentName varchar(500) = NULL,
	@iCaseID int = NULL,
	@dtCreatedDate datetime = NULL,
	@sDocumentPath varchar(MAX) = NULL,
	@iPatient int = NULL,
	@sDescription varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [CaseDocument]
	(
		[sDocumentName],
		[iCaseID],
		[dtCreatedDate],
		[sDocumentPath],
		[iPatient],
		[sDescription]
	)
	VALUES
	(
		@sDocumentName,
		@iCaseID,
		@dtCreatedDate,
		@sDocumentPath,
		@iPatient,
		@sDescription
	)

	SET @Err = @@Error

	SELECT @iDocumentID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_CaseDocumentDelete]    Script Date: 05/03/2013 11:22:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_CaseDocumentDelete]
(
	@iDocumentID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [CaseDocument]
	WHERE
		[iDocumentID] = @iDocumentID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  Table [dbo].[PrescriptionDetails]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrescriptionDetails](
	[iPrescDetailID] [int] IDENTITY(1,1) NOT NULL,
	[iProductID] [int] NULL,
	[nQuantity] [numeric](18, 2) NULL,
	[iPrescriptionID] [int] NULL,
	[sDescription] [varchar](max) NULL,
 CONSTRAINT [PK_PrescriptionDetails] PRIMARY KEY CLUSTERED 
(
	[iPrescDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderProcessLog]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderProcessLog](
	[iOrderLogID] [int] IDENTITY(1,1) NOT NULL,
	[iOrderID] [int] NOT NULL,
	[iAdminCompanyID] [int] NOT NULL,
	[sUpdateDate] [datetime] NULL,
	[sDescription] [varchar](max) NULL,
 CONSTRAINT [PK_OrderProcessLog] PRIMARY KEY CLUSTERED 
(
	[iOrderLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 05/03/2013 11:22:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[iOrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[iOrderID] [int] NOT NULL,
	[iProductID] [int] NOT NULL,
	[iProductTypeID] [int] NOT NULL,
	[nQuantity] [numeric](18, 2) NULL,
	[nItemPrice] [numeric](18, 2) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[iOrderDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (1, 2, 5, 1, CAST(1.00 AS Numeric(18, 2)), CAST(23.00 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (2, 2, 3, 1, CAST(70.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (3, 2, 3, 1, CAST(20.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (5, 2, 17, 1, CAST(10.00 AS Numeric(18, 2)), CAST(13.00 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (7, 3, 3, 1, CAST(5.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (8, 3, 5, 1, CAST(0.00 AS Numeric(18, 2)), CAST(23.00 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (9, 3, 17, 1, CAST(0.00 AS Numeric(18, 2)), CAST(13.00 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (14, 5, 3, 1, CAST(0.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (15, 2, 3, 1, CAST(3.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (18, 2, 5, 1, CAST(3.00 AS Numeric(18, 2)), CAST(23.00 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (19, 2, 16, 8, CAST(0.00 AS Numeric(18, 2)), CAST(55.67 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (20, 2, 16, 8, CAST(0.00 AS Numeric(18, 2)), CAST(55.67 AS Numeric(18, 2)))
INSERT [dbo].[OrderDetails] ([iOrderDetailID], [iOrderID], [iProductID], [iProductTypeID], [nQuantity], [nItemPrice]) VALUES (21, 2, 16, 8, CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
/****** Object:  StoredProcedure [dbo].[proc_PaymentInformationUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PaymentInformationUpdate]
(
	@iPaymentInfoID int,
	@iCaseID int = NULL,
	@iPatientID int = NULL,
	@sCreditCardName varchar(500) = NULL,
	@iExpiryMonth int = NULL,
	@iExpiryYear int = NULL,
	@sCardType varchar(500) = NULL,
	@sBankName varchar(500) = NULL,
	@sPaymentStatus varchar(500) = NULL,
	@sPaymentMethod varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@iAdminCompanyID int = NULL,
	@sDescription varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PaymentInformation]
	SET
		[iCaseID] = @iCaseID,
		[iPatientID] = @iPatientID,
		[sCreditCardName] = @sCreditCardName,
		[iExpiryMonth] = @iExpiryMonth,
		[iExpiryYear] = @iExpiryYear,
		[sCardType] = @sCardType,
		[sBankName] = @sBankName,
		[sPaymentStatus] = @sPaymentStatus,
		[sPaymentMethod] = @sPaymentMethod,
		[dtCreatedDate] = @dtCreatedDate,
		[iAdminCompanyID] = @iAdminCompanyID,
		[sDescription] = @sDescription
	WHERE
		[iPaymentInfoID] = @iPaymentInfoID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PaymentInformationLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PaymentInformationLoadByPrimaryKey]
(
	@iPaymentInfoID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iPaymentInfoID],
		[iCaseID],
		[iPatientID],
		[sCreditCardName],
		[iExpiryMonth],
		[iExpiryYear],
		[sCardType],
		[sBankName],
		[sPaymentStatus],
		[sPaymentMethod],
		[dtCreatedDate],
		[iAdminCompanyID],
		[sDescription]
	FROM [PaymentInformation]
	WHERE
		([iPaymentInfoID] = @iPaymentInfoID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PaymentInformationLoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PaymentInformationLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iPaymentInfoID],
		[iCaseID],
		[iPatientID],
		[sCreditCardName],
		[iExpiryMonth],
		[iExpiryYear],
		[sCardType],
		[sBankName],
		[sPaymentStatus],
		[sPaymentMethod],
		[dtCreatedDate],
		[iAdminCompanyID],
		[sDescription]
	FROM [PaymentInformation]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PaymentInformationInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PaymentInformationInsert]
(
	@iPaymentInfoID int = NULL output,
	@iCaseID int = NULL,
	@iPatientID int = NULL,
	@sCreditCardName varchar(500) = NULL,
	@iExpiryMonth int = NULL,
	@iExpiryYear int = NULL,
	@sCardType varchar(500) = NULL,
	@sBankName varchar(500) = NULL,
	@sPaymentStatus varchar(500) = NULL,
	@sPaymentMethod varchar(500) = NULL,
	@dtCreatedDate datetime = NULL,
	@iAdminCompanyID int = NULL,
	@sDescription varchar(500) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PaymentInformation]
	(
		[iCaseID],
		[iPatientID],
		[sCreditCardName],
		[iExpiryMonth],
		[iExpiryYear],
		[sCardType],
		[sBankName],
		[sPaymentStatus],
		[sPaymentMethod],
		[dtCreatedDate],
		[iAdminCompanyID],
		[sDescription]
	)
	VALUES
	(
		@iCaseID,
		@iPatientID,
		@sCreditCardName,
		@iExpiryMonth,
		@iExpiryYear,
		@sCardType,
		@sBankName,
		@sPaymentStatus,
		@sPaymentMethod,
		@dtCreatedDate,
		@iAdminCompanyID,
		@sDescription
	)

	SET @Err = @@Error

	SELECT @iPaymentInfoID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PaymentInformationDelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PaymentInformationDelete]
(
	@iPaymentInfoID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PaymentInformation]
	WHERE
		[iPaymentInfoID] = @iPaymentInfoID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PrescriptionsUpdate]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PrescriptionsUpdate]
(
	@iPrescriptionID int,
	@sDescription varchar(MAX) = NULL,
	@iCaseID int = NULL,
	@iContactID int = NULL,
	@dtCreatedDate datetime = NULL,
	@dtModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Prescriptions]
	SET
		[sDescription] = @sDescription,
		[iCaseID] = @iCaseID,
		[iContactID] = @iContactID,
		[dtCreatedDate] = @dtCreatedDate,
		[dtModifiedDate] = @dtModifiedDate
	WHERE
		[iPrescriptionID] = @iPrescriptionID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PrescriptionsLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PrescriptionsLoadByPrimaryKey]
(
	@iPrescriptionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iPrescriptionID],
		[sDescription],
		[iCaseID],
		[iContactID],
		[dtCreatedDate],
		[dtModifiedDate]
	FROM [Prescriptions]
	WHERE
		([iPrescriptionID] = @iPrescriptionID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PrescriptionsLoadAll]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PrescriptionsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iPrescriptionID],
		[sDescription],
		[iCaseID],
		[iContactID],
		[dtCreatedDate],
		[dtModifiedDate]
	FROM [Prescriptions]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PrescriptionsInsert]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PrescriptionsInsert]
(
	@iPrescriptionID int = NULL output,
	@sDescription varchar(MAX) = NULL,
	@iCaseID int = NULL,
	@iContactID int = NULL,
	@dtCreatedDate datetime = NULL,
	@dtModifiedDate datetime = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Prescriptions]
	(
		[sDescription],
		[iCaseID],
		[iContactID],
		[dtCreatedDate],
		[dtModifiedDate]
	)
	VALUES
	(
		@sDescription,
		@iCaseID,
		@iContactID,
		@dtCreatedDate,
		@dtModifiedDate
	)

	SET @Err = @@Error

	SELECT @iPrescriptionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PrescriptionsDelete]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PrescriptionsDelete]
(
	@iPrescriptionID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Prescriptions]
	WHERE
		[iPrescriptionID] = @iPrescriptionID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PrescriptionDetailsUpdate]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PrescriptionDetailsUpdate]
(
	@iPrescDetailID int,
	@iProductID int = NULL,
	@nQuantity numeric(18,2) = NULL,
	@iPrescriptionID int = NULL,
	@sDescription varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [PrescriptionDetails]
	SET
		[iProductID] = @iProductID,
		[nQuantity] = @nQuantity,
		[iPrescriptionID] = @iPrescriptionID,
		[sDescription] = @sDescription
	WHERE
		[iPrescDetailID] = @iPrescDetailID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PrescriptionDetailsLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PrescriptionDetailsLoadByPrimaryKey]
(
	@iPrescDetailID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iPrescDetailID],
		[iProductID],
		[nQuantity],
		[iPrescriptionID],
		[sDescription]
	FROM [PrescriptionDetails]
	WHERE
		([iPrescDetailID] = @iPrescDetailID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PrescriptionDetailsLoadAll]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PrescriptionDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iPrescDetailID],
		[iProductID],
		[nQuantity],
		[iPrescriptionID],
		[sDescription]
	FROM [PrescriptionDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PrescriptionDetailsInsert]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PrescriptionDetailsInsert]
(
	@iPrescDetailID int = NULL output,
	@iProductID int = NULL,
	@nQuantity numeric(18,2) = NULL,
	@iPrescriptionID int = NULL,
	@sDescription varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [PrescriptionDetails]
	(
		[iProductID],
		[nQuantity],
		[iPrescriptionID],
		[sDescription]
	)
	VALUES
	(
		@iProductID,
		@nQuantity,
		@iPrescriptionID,
		@sDescription
	)

	SET @Err = @@Error

	SELECT @iPrescDetailID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PrescriptionDetailsDelete]    Script Date: 05/03/2013 11:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PrescriptionDetailsDelete]
(
	@iPrescDetailID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [PrescriptionDetails]
	WHERE
		[iPrescDetailID] = @iPrescDetailID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderProcessLogUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderProcessLogUpdate]
(
	@iOrderLogID int,
	@iOrderID int,
	@iAdminCompanyID int,
	@sUpdateDate datetime = NULL,
	@sDescription varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [OrderProcessLog]
	SET
		[iOrderID] = @iOrderID,
		[iAdminCompanyID] = @iAdminCompanyID,
		[sUpdateDate] = @sUpdateDate,
		[sDescription] = @sDescription
	WHERE
		[iOrderLogID] = @iOrderLogID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderProcessLogLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderProcessLogLoadByPrimaryKey]
(
	@iOrderLogID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iOrderLogID],
		[iOrderID],
		[iAdminCompanyID],
		[sUpdateDate],
		[sDescription]
	FROM [OrderProcessLog]
	WHERE
		([iOrderLogID] = @iOrderLogID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderProcessLogLoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderProcessLogLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iOrderLogID],
		[iOrderID],
		[iAdminCompanyID],
		[sUpdateDate],
		[sDescription]
	FROM [OrderProcessLog]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderProcessLogInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderProcessLogInsert]
(
	@iOrderLogID int = NULL output,
	@iOrderID int,
	@iAdminCompanyID int,
	@sUpdateDate datetime = NULL,
	@sDescription varchar(MAX) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [OrderProcessLog]
	(
		[iOrderID],
		[iAdminCompanyID],
		[sUpdateDate],
		[sDescription]
	)
	VALUES
	(
		@iOrderID,
		@iAdminCompanyID,
		@sUpdateDate,
		@sDescription
	)

	SET @Err = @@Error

	SELECT @iOrderLogID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderProcessLogDelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderProcessLogDelete]
(
	@iOrderLogID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [OrderProcessLog]
	WHERE
		[iOrderLogID] = @iOrderLogID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderDetailsUpdate]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderDetailsUpdate]
(
	@iOrderDetailID int,
	@iOrderID int,
	@iProductID int,
	@iProductTypeID int,
	@nQuantity numeric(18,2) = NULL,
	@nItemPrice numeric(18,2) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [OrderDetails]
	SET
		[iOrderID] = @iOrderID,
		[iProductID] = @iProductID,
		[iProductTypeID] = @iProductTypeID,
		[nQuantity] = @nQuantity,
		[nItemPrice] = @nItemPrice
	WHERE
		[iOrderDetailID] = @iOrderDetailID


	SET @Err = @@Error


	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderDetailsLoadByPrimaryKey]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderDetailsLoadByPrimaryKey]
(
	@iOrderDetailID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iOrderDetailID],
		[iOrderID],
		[iProductID],
		[iProductTypeID],
		[nQuantity],
		[nItemPrice]
	FROM [OrderDetails]
	WHERE
		([iOrderDetailID] = @iOrderDetailID)

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderDetailsLoadAll]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderDetailsLoadAll]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[iOrderDetailID],
		[iOrderID],
		[iProductID],
		[iProductTypeID],
		[nQuantity],
		[nItemPrice]
	FROM [OrderDetails]

	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderDetailsInsert]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderDetailsInsert]
(
	@iOrderDetailID int = NULL output,
	@iOrderID int,
	@iProductID int,
	@iProductTypeID int,
	@nQuantity numeric(18,2) = NULL,
	@nItemPrice numeric(18,2) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [OrderDetails]
	(
		[iOrderID],
		[iProductID],
		[iProductTypeID],
		[nQuantity],
		[nItemPrice]
	)
	VALUES
	(
		@iOrderID,
		@iProductID,
		@iProductTypeID,
		@nQuantity,
		@nItemPrice
	)

	SET @Err = @@Error

	SELECT @iOrderDetailID = SCOPE_IDENTITY()

	RETURN @Err
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderDetailsDelete]    Script Date: 05/03/2013 11:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_OrderDetailsDelete]
(
	@iOrderDetailID int
)
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [OrderDetails]
	WHERE
		[iOrderDetailID] = @iOrderDetailID
	SET @Err = @@Error

	RETURN @Err
END
GO
/****** Object:  ForeignKey [FK_CaseDocument_Cases]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[CaseDocument]  WITH CHECK ADD  CONSTRAINT [FK_CaseDocument_Cases] FOREIGN KEY([iCaseID])
REFERENCES [dbo].[Cases] ([iCaseID])
GO
ALTER TABLE [dbo].[CaseDocument] CHECK CONSTRAINT [FK_CaseDocument_Cases]
GO
/****** Object:  ForeignKey [FK_CaseDocument_Contacts]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[CaseDocument]  WITH CHECK ADD  CONSTRAINT [FK_CaseDocument_Contacts] FOREIGN KEY([iPatient])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[CaseDocument] CHECK CONSTRAINT [FK_CaseDocument_Contacts]
GO
/****** Object:  ForeignKey [FK_CaseNotes_Cases]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[CaseNotes]  WITH CHECK ADD  CONSTRAINT [FK_CaseNotes_Cases] FOREIGN KEY([iCaseID])
REFERENCES [dbo].[Cases] ([iCaseID])
GO
ALTER TABLE [dbo].[CaseNotes] CHECK CONSTRAINT [FK_CaseNotes_Cases]
GO
/****** Object:  ForeignKey [FK_CaseNotes_Users]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[CaseNotes]  WITH CHECK ADD  CONSTRAINT [FK_CaseNotes_Users] FOREIGN KEY([iUserIDCreatedBy])
REFERENCES [dbo].[Users] ([iUserID])
GO
ALTER TABLE [dbo].[CaseNotes] CHECK CONSTRAINT [FK_CaseNotes_Users]
GO
/****** Object:  ForeignKey [FK_CaseOrder_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[CaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_CaseOrder_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[CaseOrder] CHECK CONSTRAINT [FK_CaseOrder_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_CaseOrder_Cases]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[CaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_CaseOrder_Cases] FOREIGN KEY([iCaseID])
REFERENCES [dbo].[Cases] ([iCaseID])
GO
ALTER TABLE [dbo].[CaseOrder] CHECK CONSTRAINT [FK_CaseOrder_Cases]
GO
/****** Object:  ForeignKey [FK_CaseOrder_Contacts]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[CaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_CaseOrder_Contacts] FOREIGN KEY([iPatientID])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[CaseOrder] CHECK CONSTRAINT [FK_CaseOrder_Contacts]
GO
/****** Object:  ForeignKey [FK_CaseOrder_Contacts1]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[CaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_CaseOrder_Contacts1] FOREIGN KEY([iDoctorID])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[CaseOrder] CHECK CONSTRAINT [FK_CaseOrder_Contacts1]
GO
/****** Object:  ForeignKey [FK_Cases_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_Cases_Cases]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Cases] FOREIGN KEY([iCaseID])
REFERENCES [dbo].[Cases] ([iCaseID])
GO
ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_Cases]
GO
/****** Object:  ForeignKey [FK_Cases_Contacts]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Contacts] FOREIGN KEY([iExpretID])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_Contacts]
GO
/****** Object:  ForeignKey [FK_Cases_Contacts1]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Contacts1] FOREIGN KEY([iPatientID])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_Contacts1]
GO
/****** Object:  ForeignKey [FK_Cases_Customers]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Customers] FOREIGN KEY([iPatientID])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_Customers]
GO
/****** Object:  ForeignKey [FK_Cases_ExpertAppointments]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_ExpertAppointments] FOREIGN KEY([iAppointmentID])
REFERENCES [dbo].[ExpertAppointments] ([iAppointmentID])
GO
ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_ExpertAppointments]
GO
/****** Object:  ForeignKey [FK_Cases_Users]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Users] FOREIGN KEY([iUserIDCreatedBy])
REFERENCES [dbo].[Users] ([iUserID])
GO
ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_Users]
GO
/****** Object:  ForeignKey [FK_Company_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_Company_CompanyType]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_CompanyType] FOREIGN KEY([iCompanyTypeID])
REFERENCES [dbo].[CompanyType] ([iCompanyTypeID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_CompanyType]
GO
/****** Object:  ForeignKey [FK_Contacts_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_Contacts_Company]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Company] FOREIGN KEY([iCompanyID])
REFERENCES [dbo].[Company] ([iCompanyID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_Company]
GO
/****** Object:  ForeignKey [FK_Contacts_Users]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Users] FOREIGN KEY([iUserID])
REFERENCES [dbo].[Users] ([iUserID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_Users]
GO
/****** Object:  ForeignKey [FK_Contacts_UserType]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_UserType] FOREIGN KEY([iUserTypeID])
REFERENCES [dbo].[UserType] ([iUserTypeID])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_UserType]
GO
/****** Object:  ForeignKey [FK_DetailQA_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[DetailQA]  WITH CHECK ADD  CONSTRAINT [FK_DetailQA_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[DetailQA] CHECK CONSTRAINT [FK_DetailQA_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_DetailQA_Cases]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[DetailQA]  WITH CHECK ADD  CONSTRAINT [FK_DetailQA_Cases] FOREIGN KEY([iCaseID])
REFERENCES [dbo].[Cases] ([iCaseID])
GO
ALTER TABLE [dbo].[DetailQA] CHECK CONSTRAINT [FK_DetailQA_Cases]
GO
/****** Object:  ForeignKey [FK_DetailQA_DetailQA]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[DetailQA]  WITH CHECK ADD  CONSTRAINT [FK_DetailQA_DetailQA] FOREIGN KEY([iPatient])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[DetailQA] CHECK CONSTRAINT [FK_DetailQA_DetailQA]
GO
/****** Object:  ForeignKey [FK_DetailQA_Users]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[DetailQA]  WITH CHECK ADD  CONSTRAINT [FK_DetailQA_Users] FOREIGN KEY([iUserID])
REFERENCES [dbo].[Users] ([iUserID])
GO
ALTER TABLE [dbo].[DetailQA] CHECK CONSTRAINT [FK_DetailQA_Users]
GO
/****** Object:  ForeignKey [FK_ExpertAppointments_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[ExpertAppointments]  WITH CHECK ADD  CONSTRAINT [FK_ExpertAppointments_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[ExpertAppointments] CHECK CONSTRAINT [FK_ExpertAppointments_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_ExpertAppointments_Contacts]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[ExpertAppointments]  WITH CHECK ADD  CONSTRAINT [FK_ExpertAppointments_Contacts] FOREIGN KEY([iContactID])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[ExpertAppointments] CHECK CONSTRAINT [FK_ExpertAppointments_Contacts]
GO
/****** Object:  ForeignKey [FK_ExpertAppointments_LinkedVenue]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[ExpertAppointments]  WITH CHECK ADD  CONSTRAINT [FK_ExpertAppointments_LinkedVenue] FOREIGN KEY([iVenueID])
REFERENCES [dbo].[LinkedVenue] ([iVenueID])
GO
ALTER TABLE [dbo].[ExpertAppointments] CHECK CONSTRAINT [FK_ExpertAppointments_LinkedVenue]
GO
/****** Object:  ForeignKey [FK_GeneralQA_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[GeneralQA]  WITH CHECK ADD  CONSTRAINT [FK_GeneralQA_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[GeneralQA] CHECK CONSTRAINT [FK_GeneralQA_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_GeneralQA_Cases]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[GeneralQA]  WITH CHECK ADD  CONSTRAINT [FK_GeneralQA_Cases] FOREIGN KEY([iCaseID])
REFERENCES [dbo].[Cases] ([iCaseID])
GO
ALTER TABLE [dbo].[GeneralQA] CHECK CONSTRAINT [FK_GeneralQA_Cases]
GO
/****** Object:  ForeignKey [FK_GeneralQA_Contacts]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[GeneralQA]  WITH CHECK ADD  CONSTRAINT [FK_GeneralQA_Contacts] FOREIGN KEY([iPatient])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[GeneralQA] CHECK CONSTRAINT [FK_GeneralQA_Contacts]
GO
/****** Object:  ForeignKey [fk_LinkedUserType]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[LinkedVenue]  WITH CHECK ADD  CONSTRAINT [fk_LinkedUserType] FOREIGN KEY([iUserTypeID])
REFERENCES [dbo].[UserType] ([iUserTypeID])
GO
ALTER TABLE [dbo].[LinkedVenue] CHECK CONSTRAINT [fk_LinkedUserType]
GO
/****** Object:  ForeignKey [FK_LinkedVenue_Contacts]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[LinkedVenue]  WITH CHECK ADD  CONSTRAINT [FK_LinkedVenue_Contacts] FOREIGN KEY([iContactID])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[LinkedVenue] CHECK CONSTRAINT [FK_LinkedVenue_Contacts]
GO
/****** Object:  ForeignKey [FK_NewsFeeds_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[NewsFeeds]  WITH CHECK ADD  CONSTRAINT [FK_NewsFeeds_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[NewsFeeds] CHECK CONSTRAINT [FK_NewsFeeds_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_NewsFeeds_Users]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[NewsFeeds]  WITH CHECK ADD  CONSTRAINT [FK_NewsFeeds_Users] FOREIGN KEY([iUserID])
REFERENCES [dbo].[Users] ([iUserID])
GO
ALTER TABLE [dbo].[NewsFeeds] CHECK CONSTRAINT [FK_NewsFeeds_Users]
GO
/****** Object:  ForeignKey [FK_OrderDetails_CaseOrder]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_CaseOrder] FOREIGN KEY([iOrderID])
REFERENCES [dbo].[CaseOrder] ([iOrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_CaseOrder]
GO
/****** Object:  ForeignKey [FK_OrderDetails_Products]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([iProductID])
REFERENCES [dbo].[Products] ([iProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
/****** Object:  ForeignKey [FK_OrderDetails_ProductType]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_ProductType] FOREIGN KEY([iProductTypeID])
REFERENCES [dbo].[ProductType] ([iProductTypeID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ProductType]
GO
/****** Object:  ForeignKey [FK_OrderProcessLog_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[OrderProcessLog]  WITH CHECK ADD  CONSTRAINT [FK_OrderProcessLog_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[OrderProcessLog] CHECK CONSTRAINT [FK_OrderProcessLog_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_OrderProcessLog_CaseOrder]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[OrderProcessLog]  WITH CHECK ADD  CONSTRAINT [FK_OrderProcessLog_CaseOrder] FOREIGN KEY([iOrderID])
REFERENCES [dbo].[CaseOrder] ([iOrderID])
GO
ALTER TABLE [dbo].[OrderProcessLog] CHECK CONSTRAINT [FK_OrderProcessLog_CaseOrder]
GO
/****** Object:  ForeignKey [FK_OrderStatus_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[OrderStatus]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatus_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[OrderStatus] CHECK CONSTRAINT [FK_OrderStatus_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_PatientDocuments_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[PatientDocuments]  WITH CHECK ADD  CONSTRAINT [FK_PatientDocuments_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[PatientDocuments] CHECK CONSTRAINT [FK_PatientDocuments_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_PatientDocuments_Contacts]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[PatientDocuments]  WITH CHECK ADD  CONSTRAINT [FK_PatientDocuments_Contacts] FOREIGN KEY([iPatientID])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[PatientDocuments] CHECK CONSTRAINT [FK_PatientDocuments_Contacts]
GO
/****** Object:  ForeignKey [FK_PaymentInformation_Cases]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[PaymentInformation]  WITH CHECK ADD  CONSTRAINT [FK_PaymentInformation_Cases] FOREIGN KEY([iCaseID])
REFERENCES [dbo].[Cases] ([iCaseID])
GO
ALTER TABLE [dbo].[PaymentInformation] CHECK CONSTRAINT [FK_PaymentInformation_Cases]
GO
/****** Object:  ForeignKey [FK_PaymentInformation_Contacts]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[PaymentInformation]  WITH CHECK ADD  CONSTRAINT [FK_PaymentInformation_Contacts] FOREIGN KEY([iPatientID])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[PaymentInformation] CHECK CONSTRAINT [FK_PaymentInformation_Contacts]
GO
/****** Object:  ForeignKey [FK_PrescriptionDetails_Prescriptions]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[PrescriptionDetails]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionDetails_Prescriptions] FOREIGN KEY([iPrescriptionID])
REFERENCES [dbo].[Prescriptions] ([iPrescriptionID])
GO
ALTER TABLE [dbo].[PrescriptionDetails] CHECK CONSTRAINT [FK_PrescriptionDetails_Prescriptions]
GO
/****** Object:  ForeignKey [FK_PrescriptionDetails_Products]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[PrescriptionDetails]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionDetails_Products] FOREIGN KEY([iProductID])
REFERENCES [dbo].[Products] ([iProductID])
GO
ALTER TABLE [dbo].[PrescriptionDetails] CHECK CONSTRAINT [FK_PrescriptionDetails_Products]
GO
/****** Object:  ForeignKey [FK_Prescriptions_Cases]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Prescriptions]  WITH CHECK ADD  CONSTRAINT [FK_Prescriptions_Cases] FOREIGN KEY([iCaseID])
REFERENCES [dbo].[Cases] ([iCaseID])
GO
ALTER TABLE [dbo].[Prescriptions] CHECK CONSTRAINT [FK_Prescriptions_Cases]
GO
/****** Object:  ForeignKey [FK_Prescriptions_Contacts]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Prescriptions]  WITH CHECK ADD  CONSTRAINT [FK_Prescriptions_Contacts] FOREIGN KEY([iContactID])
REFERENCES [dbo].[Contacts] ([iContactID])
GO
ALTER TABLE [dbo].[Prescriptions] CHECK CONSTRAINT [FK_Prescriptions_Contacts]
GO
/****** Object:  ForeignKey [FK_Products_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_Products_ProductType]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductType] FOREIGN KEY([iProductTypeID])
REFERENCES [dbo].[ProductType] ([iProductTypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductType]
GO
/****** Object:  ForeignKey [FK__ProductTy__iAdmi__1F98B2C1]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
/****** Object:  ForeignKey [FK_Users_AdminCompanies]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_AdminCompanies] FOREIGN KEY([iAdminCompanyID])
REFERENCES [dbo].[AdminCompanies] ([iAdminCompanyID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_AdminCompanies]
GO
/****** Object:  ForeignKey [FK_Users_UserType]    Script Date: 05/03/2013 11:22:05 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserType] FOREIGN KEY([iUserTypeID])
REFERENCES [dbo].[UserType] ([iUserTypeID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserType]
GO
