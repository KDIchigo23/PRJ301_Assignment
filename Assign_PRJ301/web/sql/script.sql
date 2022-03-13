USE [master]
GO
/****** Object:  Database [Assign_PRJ301]    Script Date: 03/14/2022 00:13:50 ******/
CREATE DATABASE [Assign_PRJ302] 
GO

USE [Assign_PRJ302]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[aId] [int] IDENTITY(1,1) NOT NULL,
	[aUsername] [nvarchar](255) NULL,
	[aPassword] [nvarchar](255) NULL,
	[aDisplayName] [nvarchar](255) NULL,
	[aAddress] [nvarchar](255) NULL,
	[aEmail] [nvarchar](255) NULL,
	[aPhone] [nvarchar](255) NULL,
	[aRole] [nvarchar](255) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[aId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON
INSERT [dbo].[Account] ([aId], [aUsername], [aPassword], [aDisplayName], [aAddress], [aEmail], [aPhone], [aRole], [isDeleted]) VALUES (1, N'user', N'123456', N'USER', N'', N'', N'', N'USER', NULL)
INSERT [dbo].[Account] ([aId], [aUsername], [aPassword], [aDisplayName], [aAddress], [aEmail], [aPhone], [aRole], [isDeleted]) VALUES (2, N'seller', N'123456', N'SELL', N'', N'', N'', N'USER', NULL)
INSERT [dbo].[Account] ([aId], [aUsername], [aPassword], [aDisplayName], [aAddress], [aEmail], [aPhone], [aRole], [isDeleted]) VALUES (3, N'admin', N'123456', N'KDIchigo', N'Yen Bai', N'', N'', N'ADMIN', NULL)
INSERT [dbo].[Account] ([aId], [aUsername], [aPassword], [aDisplayName], [aAddress], [aEmail], [aPhone], [aRole], [isDeleted]) VALUES (6, N'Trung', N'trung', N'123456', N'', N'', N'', N'USER', NULL)
INSERT [dbo].[Account] ([aId], [aUsername], [aPassword], [aDisplayName], [aAddress], [aEmail], [aPhone], [aRole], [isDeleted]) VALUES (7, N'test', N'123456', N'TEST', N'', N'', N'', N'USER', NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ctId] [int] NOT NULL,
	[ctName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ctId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Category] ([ctId], [ctName]) VALUES (1, N'Jersey')
INSERT [dbo].[Category] ([ctId], [ctName]) VALUES (2, N'Sneaker')
INSERT [dbo].[Category] ([ctId], [ctName]) VALUES (3, N'Item')
/****** Object:  Table [dbo].[Group]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Group](
	[gId] [int] NOT NULL,
	[gName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[gId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Group] ([gId], [gName]) VALUES (1, N'West')
INSERT [dbo].[Group] ([gId], [gName]) VALUES (2, N'East')
/****** Object:  Table [dbo].[Shipping]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[sId] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](255) NULL,
	[sPhone] [nvarchar](255) NULL,
	[sAddress] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[sId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON
INSERT [dbo].[Shipping] ([sId], [sName], [sPhone], [sAddress]) VALUES (1, NULL, NULL, NULL)
INSERT [dbo].[Shipping] ([sId], [sName], [sPhone], [sAddress]) VALUES (2, N'SELL', N'012121212121', N'Yên Bái')
INSERT [dbo].[Shipping] ([sId], [sName], [sPhone], [sAddress]) VALUES (3, N'SELL', N'0987654321', N'Yen Bai')
INSERT [dbo].[Shipping] ([sId], [sName], [sPhone], [sAddress]) VALUES (4, N'SELL1', N'0987654321', N'Yen Bái')
INSERT [dbo].[Shipping] ([sId], [sName], [sPhone], [sAddress]) VALUES (5, N'USER', N'012121212121', N'ddddddd')
INSERT [dbo].[Shipping] ([sId], [sName], [sPhone], [sAddress]) VALUES (6, N'USER2', N'0123468877', N'Yen Bái')
INSERT [dbo].[Shipping] ([sId], [sName], [sPhone], [sAddress]) VALUES (9, N'TEST', N'0987654321', N'Yen Bai')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
/****** Object:  Table [dbo].[Message]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[mId] [int] IDENTITY(1,1) NOT NULL,
	[aId] [int] NOT NULL,
	[mCreated_date] [date] NULL,
	[mNote] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[mId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Message] ON
INSERT [dbo].[Message] ([mId], [aId], [mCreated_date], [mNote]) VALUES (1, 3, CAST(0xB2430B00 AS Date), N'11111111111111111111')
SET IDENTITY_INSERT [dbo].[Message] OFF
/****** Object:  Table [dbo].[Team]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Team](
	[tId] [int] NOT NULL,
	[tName] [varchar](255) NOT NULL,
	[gId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Team] ([tId], [tName], [gId]) VALUES (1, N'Philadelphia 76ers', 1)
INSERT [dbo].[Team] ([tId], [tName], [gId]) VALUES (2, N'Milwaukee Bucks', 1)
INSERT [dbo].[Team] ([tId], [tName], [gId]) VALUES (3, N'Toronto Raptors', 1)
INSERT [dbo].[Team] ([tId], [tName], [gId]) VALUES (4, N'Brooklyn Nets', 1)
INSERT [dbo].[Team] ([tId], [tName], [gId]) VALUES (5, N'Phoenix Suns', 2)
INSERT [dbo].[Team] ([tId], [tName], [gId]) VALUES (6, N'Golden State Warriors', 2)
INSERT [dbo].[Team] ([tId], [tName], [gId]) VALUES (7, N'Los Angeles Clippers', 2)
INSERT [dbo].[Team] ([tId], [tName], [gId]) VALUES (8, N'Los Angeles Lakers', 2)
/****** Object:  Table [dbo].[Orders]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[oId] [int] IDENTITY(1,1) NOT NULL,
	[aId] [int] NOT NULL,
	[oTotalPrice] [float] NULL,
	[oNote] [text] NULL,
	[oCreated_date] [date] NULL,
	[sId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[oId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT [dbo].[Orders] ([oId], [aId], [oTotalPrice], [oNote], [oCreated_date], [sId]) VALUES (1, 2, 229.70000457763672, N'11111111111111111111', CAST(0xB2430B00 AS Date), 2)
INSERT [dbo].[Orders] ([oId], [aId], [oTotalPrice], [oNote], [oCreated_date], [sId]) VALUES (2, 2, 339.60000610351562, N'1111111111111111', CAST(0xB2430B00 AS Date), 3)
INSERT [dbo].[Orders] ([oId], [aId], [oTotalPrice], [oNote], [oCreated_date], [sId]) VALUES (3, 2, 269.70000457763672, N'22222222222222', CAST(0xB2430B00 AS Date), 4)
INSERT [dbo].[Orders] ([oId], [aId], [oTotalPrice], [oNote], [oCreated_date], [sId]) VALUES (4, 1, 59.69999885559082, N'3333333333333', CAST(0xB2430B00 AS Date), 5)
INSERT [dbo].[Orders] ([oId], [aId], [oTotalPrice], [oNote], [oCreated_date], [sId]) VALUES (5, 1, 149.80000305175781, N'444444444444', CAST(0xB2430B00 AS Date), 6)
INSERT [dbo].[Orders] ([oId], [aId], [oTotalPrice], [oNote], [oCreated_date], [sId]) VALUES (8, 7, 419.4000072479248, N'12121212121212', CAST(0xB2430B00 AS Date), 9)
SET IDENTITY_INSERT [dbo].[Orders] OFF
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[odId] [int] IDENTITY(1,1) NOT NULL,
	[oId] [int] NULL,
	[proName] [nvarchar](255) NULL,
	[proImg_url] [nvarchar](255) NULL,
	[proPrice] [float] NULL,
	[odQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[odId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (1, 1, N'Embiid Jersey', N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-joel-embiid-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 89.9000015258789, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (2, 1, N'Danny Green Jersey', N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-danny-green-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 69.9000015258789, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (3, 1, N'T.Maxey Jersey', N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-tyrese-maxey-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 69.9000015258789, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (4, 2, N'Embiid Jersey', N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-joel-embiid-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 89.9000015258789, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (5, 2, N'J.Harden Jersey', N'https://www.nbasportsjersey.com/images/philadelphia-76ers/james-harden-75th-anniversary-icon-royal-jersey-.jpg', 89.9000015258789, 2)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (6, 2, N'T.Maxey Jersey', N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-tyrese-maxey-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 69.9000015258789, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (7, 3, N'Giannis Jersey', N'https://www.nbajerseyonline.net/image/milwaukee-bucks/milwaukee-bucks-giannis-antetokounmpo-black-2021-nba-finals-jersey.jpg', 99.9000015258789, 2)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (8, 3, N'Jr.Holiday Jersey', N'https://www.nbajerseyonline.net/image/milwaukee-bucks/milwaukee-bucks-jrue-holiday-black-2021-nba-finals-jersey.jpg', 69.9000015258789, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (12, 5, N'P.Siakam Jersey', N'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-pascal-siakam-black-replica-jersey.jpg', 79.9000015258789, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (13, 5, N'Scottie Barnes Jersey', N'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-scottie-barnes-red-authentic-jersey.jpg', 69.9000015258789, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (19, 8, N'B.Lopez Jersey', N'https://www.nbajerseyonline.net/nba-apparels/milwaukee-bucks/milwaukee-bucks-brook-lopez-hunter-green-2021-22-75th-anniversary-diamond-icon-edition-jersey.jpg', 69.9000015258789, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (20, 8, N'P.Siakam Jersey', N'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-pascal-siakam-black-replica-jersey.jpg', 79.9000015258789, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (21, 8, N'Scottie Barnes Jersey', N'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-scottie-barnes-red-authentic-jersey.jpg', 69.9000015258789, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (22, 8, N'LeBron Model', N'https://cdn11.bigcommerce.com/s-ruomlrv671/images/stencil/1280x1280/products/27296/53963/medicom-nba-20-james__1__13335.1643218424.jpg?c=2', 19.899999618530273, 1)
INSERT [dbo].[OrderDetail] ([odId], [oId], [proName], [proImg_url], [proPrice], [odQuantity]) VALUES (23, 8, N'A.Davis Jersey Update', N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-anthony-davis-purple-2021-22-75th-anniversary-city-jersey.jpg', 89.9000015258789, 2)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
/****** Object:  Table [dbo].[Players]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Players](
	[pId] [int] IDENTITY(1,1) NOT NULL,
	[pName] [varchar](255) NOT NULL,
	[pDob] [date] NOT NULL,
	[tId] [int] NOT NULL,
	[pPosition] [varchar](255) NOT NULL,
	[pHeight] [varchar](10) NOT NULL,
	[pNo] [int] NOT NULL,
	[pAchievement] [varchar](255) NULL,
	[pImg_url] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[pId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Players] ON
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (1, N'Joel Embiid', CAST(0xC21B0B00 AS Date), 1, N'C', N'2.13 m', 21, N'5× NBA All-Star (2018–2022), 3× All-NBA Second Team (2018, 2019, 2021)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTczMTczOTg3MDc1OTU4NTY0/76ers-joel-embiid-points-crowd.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (2, N'James Harden', CAST(0x43150B00 AS Date), 1, N'SG', N'1.96 m', 1, N'10× NBA All-Star (2013–2022), 6× All-NBA First Team (2014, 2015, 2017–2020)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3Njc5OTMxMjIyNzI5OTgz/harden.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (3, N'Danny Green', CAST(0x27120B00 AS Date), 1, N'SG', N'1.98 m', 14, N'3× NBA champion (2014, 2019, 2020), NBA All-Defensive Second Team (2017)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgxNzM2ODk5MzQ0MzQ0MjMw/usatsi_16228763_168388689_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (4, N'Tobias Harris', CAST(0x61190B00 AS Date), 1, N'SF', N'2.01 m', 12, N'Second-team All-SEC – Coaches (2011)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg1MDAwNzAwMDIxODQzNDMx/usatsi_17046817_168388689_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (5, N'Tyrese Maxey', CAST(0x3B250B00 AS Date), 1, N'PG', N'1.88 m', 0, N'Second-team All-SEC (2020)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgxODcyOTQzMjM4NzUxNTYw/usatsi_16276547_168388689_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (6, N'Giannis Antetokounmpo', CAST(0xCB1C0B00 AS Date), 2, N'PF', N'2.11 m', 34, N'NBA champion (2021), NBA Finals MVP (2021), NBA All-Star Game MVP (2021)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgyNTI4MjQ0NjUyNzEzMjg4/giannis-bucks-offseason.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (7, N'Khris Middleton', CAST(0x0F180B00 AS Date), 2, N'SF', N'2.01 m', 22, N'NBA champion (2021), 3× NBA All-Star (2019, 2020, 2022)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTY4MDMxNTMxNDY4MjY4OTI4/khris-middleton-lead-bucksjpg.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (8, N'Jrue Holiday', CAST(0xF8140B00 AS Date), 2, N'PG', N'1.91 m', 21, N'NBA champion (2021), NBA All-Star (2013)', N'https://img.bleacherreport.net/img/images/photos/003/915/361/hi-res-e66e19b66bf8b3ecd38e2f67841460aa_crop_exact.jpg?w=1200&h=1200&q=75')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (9, N'Bobby Portis', CAST(0x0D1D0B00 AS Date), 2, N'PF', N'2.09 m', 9, N'NBA champion (2021)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgyMTM2Mjk1MDY0MDg1ODMy/usatsi_16353140_168388303_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (10, N'Brook Lopez', CAST(0x9E130B00 AS Date), 2, N'C', N'2.13 m', 11, N'NBA champion (2021), NBA All-Star (2013)s', N'https://img.bleacherreport.net/img/images/photos/003/808/640/hi-res-a4fa01f222c01f69845365533ec8fd29_crop_exact.jpg?w=1200&h=1200&q=75')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (11, N'Pascal Siakam', CAST(0x791B0B00 AS Date), 3, N'PF', N'2.03 m', 43, N'NBA champion (2019), NBA All-Star (2020)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgwMjI3MTk2MDU5NjU3MzM4/siakam.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (12, N'Scottie Barnes', CAST(0x49260B00 AS Date), 3, N'SF', N'2.08 m', 4, N'Third-team All-ACC (2021)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3MTE5OTgwMjMwMjIyOTg5/usatsi_17570378_168390270_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (13, N'Khem Birch', CAST(0xAC190B00 AS Date), 3, N'C', N'2.06 m', 24, N'NBA D-League All-Rookie First Team (2015)', N'https://cdn.vox-cdn.com/thumbor/wetUToaxTckGRRyEW3hSry4Ga_4=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22449646/1312558713.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (14, N'Fred Vanvleet', CAST(0xAF1B0B00 AS Date), 3, N'PG', N'1.85 m', 23, N'NBA champion (2019), NBA All-Star (2022)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgwMzAwNzYzMjEyMjkzOTk2/usatsi_15834400_168390270_lowres-1.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (15, N'OG Anunoby', CAST(0x85200B00 AS Date), 3, N'SF', N'2.01 m', 3, N'NBA champion (2019)', N'https://cdn.vox-cdn.com/thumbor/Z4ABzxhxyMW58awMf3_Umq46Sc8=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19932075/usa_today_14216898.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (16, N'Kevin Durant', CAST(0xF8130B00 AS Date), 4, N'PF', N'2.08 m', 7, N'2× NBA champion (2017, 2018), 2× NBA Finals MVP (2017, 2018), 12× NBA All-Star (2010–2019, 2021, 2022)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg2MjQyNjc0MTA0MjE1MjM1/usatsi_17178912_168388303_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (17, N'Kyrie Irving', CAST(0xEF180B00 AS Date), 4, N'PG', N'1.88 m', 11, N'NBA champion (2016), 7× NBA All-Star (2013–2015, 2017–2019, 2021), NBA All-Star Game MVP (2014)', N'https://d.newsweek.com/en/full/1911743/kyrie-irving-brooklyn-nets-covid-vaccine.jpg?w=1600&h=1600&q=88&f=9909532927b825c1699c13f22c265347')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (18, N'Ben Simmons', CAST(0x1B1F0B00 AS Date), 4, N'PG', N'2.11 m', 10, N'NBA All-Star Game MVP (2014), NBA Rookie of the Year (2018)', N'https://lh3.googleusercontent.com/-gszTKKAwjKA/YgWvR0r1j8I/AAAAAAAApmo/7HvszJHGXF0yxE7xXZyx5P-S3VX2H9ykwCNcBGAsYHQ/s16000/2K22-Ben-Simmons-Nets-Portrait.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (19, N'Seth Curry', CAST(0x40150B00 AS Date), 4, N'PG', N'1.88 m', 30, N'2× NBA D-League All-Star (2014, 2015)', N'https://cdn.vox-cdn.com/thumbor/XjH8tM0ptgZkSi2qWcvwYCT7L5k=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23242629/1370603171.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (20, N'Blake Griffin', CAST(0xA0140B00 AS Date), 4, N'PF', N'2.06 m', 2, N'6× NBA All-Star (2011–2015, 2019), NBA Rookie of the Year (2011)', N'https://cdn.vox-cdn.com/thumbor/glY1fHlPCOZgEertQTw0Rfj3dgY=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22656121/1322441282.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (21, N'Devin Booker', CAST(0xA01F0B00 AS Date), 5, N'SG', N'1.96 m', 1, N'3× NBA All-Star (2020–2022), NBA Three-Point Contest champion (2018)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgxNjI2NjY5Mjc3MTI3OTM4/usatsi_16233476_168388303_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (22, N'Chris Paul', CAST(0x1E0F0B00 AS Date), 5, N'PG', N'1.83 m', 3, N'12× NBA All-Star (2008–2016, 2020–2022), NBA All-Star Game MVP (2013)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cq_auto:good%2Cw_1200/MTg3MTM3MjE1Mzk3MTExMjgx/chris-paul.png')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (23, N'Frank Kaminsky', CAST(0xC31A0B00 AS Date), 5, N'PF', N'2.13 m', 8, N'National college player of the year (2015)', N'https://cdn.vox-cdn.com/thumbor/I2y2LfgR90ORSirGFU7Fymjc8O8=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19424059/usa_today_13612522.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (24, N'Deandre Ayton', CAST(0xF8210B00 AS Date), 5, N'C', N'2.11 m', 22, N'NBA All-Rookie First Team (2019)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg0Mzk1Njg0NjIxODU0MTg2/deandre-ayton-suns-bucks.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (25, N'Mikal Bridges', CAST(0x251F0B00 AS Date), 5, N'SF', N'1.98 m', 25, N'2× NCAA champion (2016, 2018)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc4Njg5NzEyNjU4MDY1MTg0/mikal-bridges-suns-drive.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (26, N'Stephen Curry', CAST(0x31130B00 AS Date), 6, N'PG', N'1.88 m', 30, N'3× NBA champion (2015, 2017, 2018), 8× NBA All-Star (2014–2019, 2021, 2022), NBA All-Star Game MVP (2022)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg2Nzg4ODc1Mjk1Nzk0ODg3/steph-curry-ruined-game.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (27, N'Klay Thompson', CAST(0xE9150B00 AS Date), 6, N'SG', N'1.98 m', 11, N'3× NBA champion (2015, 2017, 2018), 5× NBA All-Star (2015–2019)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg2NjY4MzYwNjYwOTUyNjg1/klay-thompson-warriors-return.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (28, N'Draymond Green', CAST(0x01160B00 AS Date), 6, N'PF', N'1.98 m', 23, N'3× NBA champion (2015, 2017, 2018), 4× NBA All-Star (2016–2018, 2022), NBA Defensive Player of the Year (2017)', N'https://cdn.vox-cdn.com/thumbor/Y0REJwebwXHWlC8wgy74t8UTywk=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19325783/1178483748.jpg.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (29, N'Andrew Wiggins', CAST(0x361D0B00 AS Date), 6, N'SF', N'2.01 m', 22, N'NBA All-Star (2022), NBA Rookie of the Year (2015)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3MDQ0ODA2NzU5ODE4MjUx/usatsi_17119074_168388303_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (30, N'Kevon Looney', CAST(0x931E0B00 AS Date), 6, N'C', N'2.06 m', 5, N'2× NBA champion (2017, 2018)', N'https://cdn.vox-cdn.com/thumbor/Wh6v6WyyaNwFOJmlsWnWO99D9WE=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22279803/1230248304.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (31, N'Kawhi Leonard', CAST(0xE3170B00 AS Date), 7, N'SF', N'2.01 m', 2, N'2× NBA champion (2014, 2019), 2× NBA Finals MVP (2014, 2019), 5× NBA All-Star (2016, 2017, 2019–2021)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTcyMDU4NjkyNTE3MTExMjAz/kawhi-leonard-clippers-nike-lawsuit.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (32, N'Paul George', CAST(0x3C160B00 AS Date), 7, N'SF', N'2.03 m', 13, N'7× NBA All-Star (2013, 2014, 2016–2019, 2021)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg2NjU2NzE5MTUyMDk2ODc3/usatsi_17427851_168390270_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (33, N'Marcus Morris Sr', CAST(0x4A150B00 AS Date), 7, N'PF', N'2.03 m', 8, N'Big 12 Player of the Year (2011)', N'https://www.si.com/.image/t_share/MTcwOTQwNTc0ODIyNTczNjQw/usatsi_14128608.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (34, N'Ivica Zubac', CAST(0x0C200B00 AS Date), 7, N'C', N'2.13 m', 40, N'Serbian Cup champion (2016)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTcyMDAwNDg3NjU3MTg2NDM5/usatsi_14128618_168390179_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (35, N'Nicolas batum', CAST(0x44140B00 AS Date), 7, N'PF', N'2.03 m', 33, N'Albert Schweitzer Tournament MVP (2006)', N'https://cdn.vox-cdn.com/thumbor/S7KqYnf8Vo5NA_8w3QbFaoVcQMQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22958979/1349094339.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (36, N'Lebron James', CAST(0x9F0E0B00 AS Date), 8, N'SF', N'2.06 m ', 6, N'4× NBA champion (2012, 2013, 2016, 2020), 4× NBA Finals MVP (2012, 2013, 2016, 2020), 18× NBA All-Star (2005–2022)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc4NjU3NDQ4MDU4NDMxMTMy/lebron-james-hawks-lakers.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (37, N'Anthony Davis', CAST(0x501A0B00 AS Date), 8, N'C', N'2.08 m', 23, N'NBA champion (2020), 8× NBA All-Star (2014–2021), NBA All-Star Game MVP (2017)', N'https://static01.nyt.com/images/2021/05/29/sports/29lakers1-print/29lakers-davis1-mediumSquareAt3X.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (38, N'Russel Westbrook', CAST(0x24140B00 AS Date), 8, N'PG', N'1.91 m', 0, N'9× NBA All-Star (2011–2013, 2015–2020), 2× NBA All-Star Game MVP (2015, 2016)', N'https://cdn.vox-cdn.com/thumbor/H0RWG2SiEmHeoIh1A65rPZOH4os=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23148759/1237542150.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (39, N'Carmelo Anthony', CAST(0xC80D0B00 AS Date), 8, N'SF', N'2.01 m', 7, N'10× NBA All-Star (2007, 2008, 2010–2017)', N'https://fadeawayworld.net/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg1NDUzOTk4NjU0ODkxNTM1/carmelo-anthony-on-lakers-win-vs-pistons--we-needed-something-like-that-to-spark-our-fire.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (40, N'Malik Monk', CAST(0x4F210B00 AS Date), 8, N'SG', N'1.91 m', 11, N'Consensus second-team All-American (2017)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3MTM5MTA1OTg4MDI3ODg5/usatsi_17589820.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (41, N'Georges Niang', CAST(0xD01A0B00 AS Date), 1, N'PF', N'2.01 m', 20, N'First-team All NBA G League (2018)', N'https://cdn.vox-cdn.com/thumbor/dAFK-8nWzkFMDLhdfV-XYiPipGw=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22966890/1236194253.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (42, N'Isaiah Joe', CAST(0x50230B00 AS Date), 1, N'SG', N'1.93', 7, N'SEC All-Freshman team (2019)', N'https://cdn.vox-cdn.com/thumbor/nrFHbXvE7xE7yIeRi9Jwf7lZNJc=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22324245/1230792329.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (43, N'Matisse Thybulle', CAST(0xFE1F0B00 AS Date), 1, N'SF', N'1.96', 22, N'SEC All-Freshman team (2020)', N'https://static01.nyt.com/images/2020/07/16/sports/16nba-matisse-lede2/16nba-matisse-lede2-mediumSquareAt3X.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (44, N'Jordan Nwora', CAST(0x08220B00 AS Date), 2, N'SF', N'2.03', 13, N'NBA champion (2021)', N'https://www.ballysports.com/images/image/private/t_1-1_768/f_auto/prod/bismlnvgrpbcwcqfifry.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (45, N'George Hill', CAST(0x6B100B00 AS Date), 2, N'PG', N'1.93 m', 3, N'Summit League Player of the Year (2008)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3MTE0NDE1ODMxNjU1NTY1/usatsi_12756514_168388303_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (46, N'Pat Connaughton', CAST(0x101A0B00 AS Date), 2, N'SG', N'1.96 m', 24, N'NBA champion (2021)', N'https://cdn.vox-cdn.com/thumbor/XnFB26OGuZfzKwLHdYsGkhk-ONw=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23239410/1358288228.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (47, N'Justin Champagnie', CAST(0x28260B00 AS Date), 3, N'SF', N'1.98 m', 11, N'First-team All-ACC (2021)', N'https://cdn.vox-cdn.com/thumbor/xAKzFOGHxEDxlUIhUpMi4N0CLic=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22931225/1235794331.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (48, N'Malachi Flynn', CAST(0x8F210B00 AS Date), 3, N'PG', N'1.85 m', 22, N'All-NBA G League Second Team (2021)', N'https://cdn.vox-cdn.com/thumbor/rNc3IcrA1tg98cOe24gBP1NLclA=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22662565/usa_today_16027165.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (49, N'Yuta Watanabe', CAST(0xB41C0B00 AS Date), 3, N'SF', N'2.06 m', 18, N'Atlantic 10 Defensive Player of the Year (2018)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc4ODMyODc0MTE4NTg3OTEx/usatsi_15463151_168390270_lowres.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (50, N'LaMarcus Aldridge', CAST(0x680F0B00 AS Date), 4, N'C', N'2.11 m', 21, N'7× NBA All-Star (2012–2016, 2018, 2019)', N'https://pbs.twimg.com/media/ExhNhO8WEAo-cKv.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (51, N'Kessler Edwards', CAST(0xE4240B00 AS Date), 4, N'SF', N'2.01 m', 14, N'First-team All-WCC (2021)', N'https://cdn.vox-cdn.com/thumbor/OesqxjfFyoU7tD8eH7_Vz_LlnaI=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22786338/1234704987.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (52, N'Joe Harris', CAST(0x28180B00 AS Date), 4, N'SG', N'1.98 m', 12, N'NBA Three-Point Contest champion (2019)', N'https://cdn.vox-cdn.com/thumbor/eARWWvnLDWgUGHbIu6D0ffU--LE=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23050543/1352719765.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (53, N'Cameron Payne', CAST(0x531C0B00 AS Date), 5, N'PG', N'1.85 m', 15, N'OVC Player of the Year (2015)', N'https://cdn.vox-cdn.com/thumbor/hMOZuD_hbJBnCJrQ6R9M-GZSdQc=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22540373/usa_today_16148090.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (54, N'Jae Crowder', CAST(0x7D160B00 AS Date), 5, N'SF', N'1.98 m', 99, N'Second-team All-American – AP, SN (2012)', N'https://cdn.vox-cdn.com/thumbor/OrMk54QRQn_Xg1ry-Pvc2Iy-0rA=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22533303/1232800938.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (55, N'Landry Shamet', CAST(0x07200B00 AS Date), 5, N'SG', N'1.93 m', 14, N'NBA All-Rookie Second Team (2019)', N'https://cdn.vox-cdn.com/thumbor/EPIUifk7kp_uSuKcZO6X4-96fo8=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22930060/1235824407.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (56, N'James Wiseman', CAST(0xCE250B00 AS Date), 6, N'C', N'2.13 m', 33, N'Morgan Wootten National Player of the Year (2019)', N'https://cdn.vox-cdn.com/thumbor/MuytJePBxUEyUX8V0zPmiodPBOU=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22857229/1309974474.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (57, N'Jordan Poole', CAST(0x61230B00 AS Date), 6, N'SG', N'1.930m', 3, N'All-NBA G League Third Team (2021)', N'https://cdn.vox-cdn.com/thumbor/VB_KD31jjIli2XBpz8xKeeJfnS4=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22203991/1230248141.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (58, N'Gary Payton II', CAST(0xEC190B00 AS Date), 6, N'PG', N'1.91 m', 0, N'NBA G League champion (2019)', N'https://fadeawayworld.net/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg1MTQ0MTk3Mjk1NjQ2MDQx/payton-2.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (59, N'Brandon Boston Jr', CAST(0xC0260B00 AS Date), 7, N'SG', N'1.98 m', 4, N'McDonalds All-American (2020)', N'https://cdn.vox-cdn.com/thumbor/RxAJ0NlWhcGcPmqGbrs4-BOhPfY=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23023400/1236623561.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (60, N'Norman Powell', CAST(0x7D1A0B00 AS Date), 7, N'SG', N'1.91 m', 24, N'NBA champion (2019)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3MjQwMjI2Njk4MDQ1MzI2/12382542650.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (61, N'Terance Mann', CAST(0x941F0B00 AS Date), 7, N'SF', N'1.98 m', 14, N'First-team All-ACC (2011)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc5ODY0MjUwMzg1MTgwMjcx/usatsi_15794925.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (62, N'Dwight Howard', CAST(0xF60F0B00 AS Date), 8, N'C', N'2.08 m', 39, N'NBA champion (2020), 8× NBA All-Star (2007–2014)', N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg0Nzk5NDU3NzE4NTc2NjE1/dwight-howard.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (63, N'DeAndre Jordan', CAST(0xF6210B00 AS Date), 8, N'C', N'2.11 m', 10, N'NBA All-Star (2017)', N'https://cdn.vox-cdn.com/thumbor/qsKwSbPufrBh8tUXfMsGBbeUqJw=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23278843/usa_today_17513813.jpg')
INSERT [dbo].[Players] ([pId], [pName], [pDob], [tId], [pPosition], [pHeight], [pNo], [pAchievement], [pImg_url]) VALUES (64, N'Stanley Johnson', CAST(0xC91E0B00 AS Date), 8, N'SF', N'1.98 m', 14, N'Julius Erving Award (2015)', N'https://cdn.vox-cdn.com/thumbor/WdUVIuOxdGUVyDi_CY2-7kiBQAs=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23150149/1362469267.jpg')
SET IDENTITY_INSERT [dbo].[Players] OFF
/****** Object:  Table [dbo].[Products]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[proId] [int] IDENTITY(1,1) NOT NULL,
	[pId] [int] NOT NULL,
	[proName] [varchar](255) NOT NULL,
	[proDescription] [nvarchar](255) NULL,
	[proQuantity] [int] NOT NULL,
	[proPrice] [float] NOT NULL,
	[proImg_url] [nvarchar](255) NULL,
	[ctId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[proId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (1, 1, N'Embiid Jersey', N'Color: blue, white; Philadelphia use this jersey in 12 years, No.21', 3, 89.9, N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-joel-embiid-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (2, 2, N'J.Harden Jersey', N'Color: blue, white; Philadelphia use this jersey in 12 years, No.1', 15, 89.9, N'https://www.nbasportsjersey.com/images/philadelphia-76ers/james-harden-75th-anniversary-icon-royal-jersey-.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (3, 3, N'Danny Green Jersey', N'Color: blue, white; Philadelphia use this jersey in 12 years, No.14', 16, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-danny-green-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (4, 4, N'T.arris Jersey', N'Color: blue, white; Philadelphia use this jersey in 12 years, No.12', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-tobias-harris-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (5, 5, N'T.Maxey Jersey', N'Color: blue, white; Philadelphia use this jersey in 12 years, No.0', 17, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-tyrese-maxey-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (6, 6, N'Giannis Jersey', N'Color: black, green; New jersey of Bucks, No.34', 7, 99.9, N'https://www.nbajerseyonline.net/image/milwaukee-bucks/milwaukee-bucks-giannis-antetokounmpo-black-2021-nba-finals-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (7, 7, N'Kh.Middleton Jersey', N'Color: black, green; New jersey of Bucks, No.22', 20, 79.9, N'https://www.nbajerseyonline.net/image/milwaukee-bucks/milwaukee-bucks-khris-middleton-black-2021-nba-finals-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (8, 8, N'Jr.Holiday Jersey', N'Color: black, green; New jersey of Bucks, No.21', 19, 69.9, N'https://www.nbajerseyonline.net/image/milwaukee-bucks/milwaukee-bucks-jrue-holiday-black-2021-nba-finals-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (9, 9, N'Bobby Portis Jersey', N'Color: green, yellow; New jersey of Bucks, No.9', 20, 69.9, N'https://www.nbajerseyonline.net/images/milwaukee-bucks/milwaukee-bucks-icon-edition-bobby-portis-jr.-green-swingman-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (10, 10, N'B.Lopez Jersey', N'Color: green, yellow; Old jersey of Bucks, No.11', 18, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/milwaukee-bucks/milwaukee-bucks-brook-lopez-hunter-green-2021-22-75th-anniversary-diamond-icon-edition-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (11, 11, N'P.Siakam Jersey', N'Color: black, red; Raptors use this jersey in 5 years, No.43', 18, 79.9, N'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-pascal-siakam-black-replica-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (12, 12, N'Scottie Barnes Jersey', N'Color: red, black; Raptors use this jersey in 5 years, No.4', 18, 69.9, N'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-scottie-barnes-red-authentic-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (13, 13, N'Khem Birch Jersey', N'Color: black, red; Raptors use this jersey in 5 years, No.24', 20, 69.9, N'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-khem-birch-black-statement-edition-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (14, 14, N'Fred Vanvleet Jersey', N'Color: black, red; Raptors use this jersey in 5 years, No.23', 20, 69.9, N'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-fred-vanvleet-black-replica-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (15, 15, N'Anunoby Jersey', N'Color: black, red; Raptors use this jersey in 5 years, No.3', 20, 69.9, N'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-og-anunoby-black-replica-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (16, 16, N'K.Durant Jersey', N'Color: blue, black; New jersey of Nets, No.7', 10, 99.9, N'https://www.nbajerseyonline.net/mlb-apparels/brooklyn-nets/men-brooklyn-nets-kevin-durant-blue-city-edition-75th-anniversary-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (17, 17, N'K.Irving Jersey', N'Color: blue, black; New jersey of Nets, No.11', 20, 79.9, N'https://www.nbajerseyonline.net/nba-apparels/brooklyn-nets/brooklyn-nets-kyrie-irving-navy-2021-22-75th-anniversary-authentic-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (18, 18, N'Ben Simmons Jersey', N'Color: blue, black; New jersey of Nets, No.10', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/brooklyn-nets/brooklyn-nets-ben-simmons-navy-2022-city-edition-75th-diamond-badge-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (19, 19, N'Seth Curry Jersey', N'Color: blue, black; New jersey of Nets, No.30', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/brooklyn-nets/brooklyn-nets-seth-curry-navy-2022-city-edition-75th-diamond-badge-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (20, 20, N'B.Griffin Jersey', N'Color: blue, black; New jersey of Nets, No.2', 20, 69.9, N'https://www.nbajerseyonline.net/mlb-apparels/brooklyn-nets/men-brooklyn-nets-blake-griffin-blue-city-edition-75th-anniversary-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (21, 21, N'D.Booker Jersey', N'Color: black, orange; Suns use this jersey in 2 years, No.1', 10, 89.9, N'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-devin-booker-black-2021-22-replica-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (22, 22, N'C.Paul Jersey', N'Color: black, orange; Suns use this jersey in 2 years, No.3', 10, 99.9, N'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-chris-paul-black-2021-22-replica-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (23, 23, N'F.Kaminsky Jersey', N'Color: black, orange; Suns use this jersey in 2 years, No.8', 20, 69.9, N'https://www.nbajerseyonline.net/phoenix-suns/men-phoenix-suns-frank-kaminsky-nba75th-city-edition-black-2021-22-replica-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (24, 24, N'D.Ayton Jersey', N'Color: black, orange; Suns use this jersey in 2 years, No.22', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-deandre-ayton-black-2021-22-replica-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (25, 25, N'M.Bridges Jersey', N'Color: black, orange; Suns use this jersey in 2 years, No.25', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-mikal-bridges-black-2021-22-replica-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (26, 26, N'Steph.Curry Jersey', N'Color: black, yellow; Warriors use this jersey in 6 years, No.30', 10, 99.9, N'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-stephen-curry-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (27, 27, N'K.Thompson Jersey', N'Color: black, yellow; Warriors use this jersey in 6 years, No.11', 15, 89.9, N'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-klay-thompson-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (28, 28, N'Draymond Green Jersey', N'Color: black, yellow; Warriors use this jersey in 6 years, No.23', 15, 89.9, N'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-draymond-green-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (29, 29, N'A.Wiggins Jersey', N'Color: black, yellow; Warriors use this jersey in 6 years, No.22', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-andrew-wiggins-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (30, 30, N'K.Looney Jersey', N'Color: black, yellow; Warriors use this jersey in 6 years, No.5', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-kevon-looney-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (31, 31, N'K.Leonard Jersey', N'Color: black, white; New Jersey of Clippers, No.2', 10, 99.9, N'https://www.nbajerseyonline.net/image/los-angeles-clippers/los-angeles-clippers-kawhi-leonard-black-city-edition-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (32, 32, N'P.George Jersey', N'Color: black, white; New Jersey of Clippers, No.13', 15, 79.9, N'https://www.nbajerseyonline.net/image/los-angeles-clippers/los-angeles-clippers-paul-george-black-city-edition-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (33, 33, N'Marcus Morris Sr Jersey', N'Color: black, white; New Jersey of Clippers, No.8', 20, 69.9, N'https://www.nbajerseyonline.net/image/los-angeles-clippers/los-angeles-clippers-marcus-morris-sr.-black-city-edition-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (34, 34, N'Ivica Zubac Jersey', N'Color: black, white; New Jersey of Clippers, No.40', 20, 69.9, N'https://www.nbajerseyonline.net/image/los-angeles-clippers/los-angeles-clippers-ivica-zubac-black-city-edition-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (35, 35, N'Nicolas batum Jersey', N'Color: black, white; New Jersey of Clippers, No.33', 20, 69.9, N'https://www.nbajerseyonline.net/image/los-angeles-clippers/los-angeles-clippers-nicolas-batum-black-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (36, 36, N'L.James Jersey', N'Color: purple, white; Lakers use this jersey in 8 years, No.6', 10, 109.9, N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-lebron-james-purple-2021-22-75th-anniversary-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (37, 37, N'A.Davis Jersey', N'Color: purple, white; Lakers use this jersey in 8 years, No.23', 10, 89.9, N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-anthony-davis-purple-2021-22-75th-anniversary-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (38, 38, N'R.Westbrook Jersey', N'Color: purple, white; Lakers use this jersey in 8 years, No.0', 15, 79.9, N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-russell-westbrook-purple-2021-22-75th-anniversary-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (39, 39, N'Carmelo Anthony Jersey', N'Color: purple, white; Lakers use this jersey in 8 years, No.7', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-anthony-davis-purple-2021-22-75th-anniversary-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (40, 40, N'Malik Monk Jersey', N'Color: purple, white; Lakers use this jersey in 8 years, No.11', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-malik-monk-purple-2021-22-75th-anniversary-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (41, 41, N'G.Niang Jersey', N'Color: blue, white; Philadelphia use this jersey in 12 years, No.20', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-georges-niang-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (42, 42, N'Isaiah Joe Jersey', N'Color: blue, white; Philadelphia use this jersey in 12 years, No.7', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-isaiah-joe-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (43, 43, N'Matisse Thybulle Jersey', N'Color: blue, white; Philadelphia use this jersey in 12 years, No.22', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-matisse-thybulle-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (44, 44, N'Jordan Nwora Jersey', N'Color: black, green; New jersey of Bucks, No.13', 20, 69.9, N'https://www.nbajerseyonline.net/image/milwaukee-bucks/milwaukee-bucks-jordan-nwora-black-statement-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (45, 45, N'George Hill Jersey', N'Color: black, green; New jersey of Bucks, No.3', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/milwaukee-bucks/milwaukee-bucks-george-hill-black-statement-edition-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (46, 46, N'P.Connaughton Jersey', N'Color: green; Old jersey of Bucks, No.24', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/milwaukee-bucks/milwaukee-bucks-pat-connaughton-hunter-green-75th-anniversary-authentic-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (47, 47, N'J.Champagnie Jersey', N'Color: black, red; Raptors use this jersey in 5 years, No.11', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/toronto-raptors/toronto-raptors-justin-champagnie-red-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (48, 48, N'M.Flynn Jersey', N'Color: black, red; Raptors use this jersey in 5 years, No.22', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/toronto-raptors/toronto-raptors-malachi-flynn-red-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (49, 49, N'Yuta Watanabe Jersey', N'Color: black, red; Raptors use this jersey in 5 years, No.18', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/toronto-raptors/toronto-raptors-yuta-watanabe-red-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (50, 50, N'L.Aldridge Jersey', N'Color: blue, black; New jersey of Nets, No.21', 20, 69.9, N'https://www.nbajerseyonline.net/mlb-apparels/brooklyn-nets/men-brooklyn-nets-lamarcus-aldridge-blue-city-edition-75th-anniversary-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (51, 51, N'K.Edwards Jersey', N'Color: blue, black; New jersey of Nets, No.14', 20, 69.9, N'https://www.nbajerseyonline.net/mlb-apparels/brooklyn-nets/men-brooklyn-nets-kessler-edwards-blue-city-edition-75th-anniversary-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (52, 52, N'Joe Harris Jersey', N'Color: blue, black; New jersey of Nets, No.12', 20, 69.9, N'https://www.nbajerseyonline.net/mlb-apparels/brooklyn-nets/men-brooklyn-nets-joe-harris-blue-city-edition-75th-anniversary-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (53, 53, N'C.Payne Jersey', N'Color: black, orange; Suns use this jersey in 2 years, No.15', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-cameron-payne-black-2021-22-replica-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (54, 54, N'Jae Crowder Jersey', N'Color: black, orange; Suns use this jersey in 2 years, No.99', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-jae-crowder-black-2021-22-replica-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (55, 55, N'L.Shamet Jersey', N'Color: black, orange; Suns use this jersey in 2 years, No.14', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-landry-shamet-black-2021-22-replica-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (56, 56, N'J.Wiseman Jersey', N'Color: black, yellow; Warriors use this jersey in 6 years, No.33', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-james-wiseman-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (57, 57, N'J.Poole Jersey', N'Color: black, yellow; Warriors use this jersey in 6 years, No.3', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-jordan-poole-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (58, 58, N'G.Payton II Jersey', N'Color: black, yellow; Warriors use this jersey in 6 years, No.0', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-gary-payton-ii-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (59, 59, N'B.Boston Jr Jersey', N'Color: black, white; New Jersey of Clippers, No.4', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-clippers/los-angeles-clippers-brandon-boston-jr.-black-city-edition-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (60, 60, N'N.Powell Jersey', N'Color: blue; Old Jersey of Clippers, No.24', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-clippers/los-angeles-clippers-norman-powell-blue-75th-anniversary-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (61, 61, N'T.Mann Jersey', N'Color: black, white; New Jersey of Clippers, No.14', 20, 69.9, N'https://www.nbajerseyonline.net/images/los-angeles-clippers/men-los-angeles-clippers-black-2021-nba-playoffs-jersey-5a.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (62, 62, N'D.Howard Jersey', N'Color: purple, white; Lakers use this jersey in 8 years, No.39', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-dwight-howard-purple-2021-22-75th-anniversary-city-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (63, 63, N'D.Jordan Jersey', N'Color: purple, white; Lakers use this jersey in 8 years, No.10', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-deandre-jordan-purple-2021-22-75th-anniversary-authentic-icon-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (64, 64, N'S.Johnson Jersey', N'Color: purple, white; Lakers use this jersey in 8 years, No.14', 20, 69.9, N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-stanley-johnson-purple-2021-22-city-edition-75th-diamond-jersey.jpg', 1)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (65, 1, N'Under Armour Embiid 1 Promotions', N'Color: black, silver, orange; It look like normal sneaker', 10, 119.9, N'https://sneakernews.com/wp-content/uploads/2020/08/joel-embiid-under-armour-shoes-1.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (66, 2, N'Adidas Harden Stepback 2', N'Color: black, lightblue, blue, red, orange; It look like normal sneaker', 10, 149.9, N'https://cf.shopee.tw/file/b1882167a04c289267b8a74ddaa91e7a', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (67, 1, N'Under Armour Embiid 1 Preview', N'Color: grey; Special sneaker from Embiid 1', 10, 149.9, N'https://static.basketrevolution.es/media/catalog/product/cache/2/image/1200x1200/9df78eab33525d08d6e5fb8d27136e95/u/n/under_armour_embiid_one_gamer_tag_3024114-106_1.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (68, 1, N'US Armour Embiid 1', N'Color: white, blue; Only in USA', 10, 119.9, N'https://www.efootwear.eu/media/catalog/product/cache/image/650x650//0/0/0000208465373_04_rz.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (69, 6, N'Nike Zoom Freak 2(Giannis)', N'Color: grey, black, white; This sneaker only have big size', 15, 169.9, N'https://cdn.shopify.com/s/files/1/0562/8631/4662/products/CK5424-101_67cdd077-3cf1-403f-b4b2-a9e92060232b.jpg?v=1630915304', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (70, 6, N'Nike Zoom Freak 1 Special(Giannis)', N'Color: Orange; Special sneaker from Freak 1 ', 10, 149.9, N'https://cf.shopee.ph/file/e749381125997f526e02374af72d2020', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (71, 16, N'Nike KD 13 White Multicolor', N'Color: black, white and mix color; This sneaker is very long', 10, 169.9, N'https://i.pinimg.com/originals/be/d9/12/bed912b7053adf27ed8e994ba6d90850.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (72, 16, N'Nike KD 14', N'Color: black, red; This sneaker is very speacial', 10, 149.9, N'https://www.whatproswear.com/wp-content/uploads/2021/06/kevin-durant-wearing-nike-kd-14-shoes-e1624228989654.jpeg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (73, 16, N'Nike KD 14 Floral', N'Color: black, lightblue; This sneaker is very speacial', 10, 169.9, N'https://www.prodirectbasketball.com/productimages/V3_1_Main/240882_Main_Thumb_0887468.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (74, 16, N'Nike KD 14 "Ky-D"', N'Color: black, red; This sneaker is very speacial; Combine with Kyrie', 10, 169.9, N'https://www.newjordans2021.com/wp-content/uploads/2021/06/Nike-KD-14-Ky-D-Black-Red-For-Sale-1.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (75, 17, N'Nike Kyrie 7', N'Color: orange, white and mix color; It very popular in USA and it save your leg very well', 20, 149.9, N'https://www.whatproswear.com/wp-content/uploads/2021/01/kyrie-irving-wearing-nike-kyrie-7-expressions-shoes-e1609612041610.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (76, 17, N'Nike Kyrie 7 "Ky-D"', N'Color: green and black; This sneaker is very speacial; Combine with KD', 10, 169.9, N'https://cdn.shopify.com/s/files/1/0039/0096/4953/products/194956845645_02_1024x1024.jpg?v=1622712816', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (77, 17, N'Nike Kyrie 3 Room', N'Color: white and red; This sneaker is one of most great sneaker basketball in 2018', 20, 149.9, N'https://images.solecollector.com/complex/images/fl_lossy,q_auto/c_scale,w_690,dpr_2.0/v1/ysgfuqddmbamujlghpkq/sneaker-room-nike-kyrie-3-mom-release-date-8', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (78, 17, N'Nike Kyrie 4', N'Color: black, green; It is popular sneaker from Kyrie', 10, 149.9, N'https://cf.shopee.vn/file/5339c8ff3e84214ba0175c53b2a05fde', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (79, 22, N'CP3 Signature', N'Color: red, black; It is a new sneaker of CP3 in 2021', 30, 119.9, N'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTY4MDMxNDQ5NTkyNDQwMDgx/chris-paul-cp3xijpg.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (80, 26, N'Under Armour Curry Two “Iron Sharpens Iron”', N'Color: Gray, black, orange; The best sneaker of "Chef" in 2020', 30, 169.9, N'https://www.kicksonfire.com/wp-content/uploads/2015/10/Under-Armour-Curry-Two.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (81, 26, N'Under Armour Curry "Alternate Away" PE', N'Color: Gray, black, orange; The best sneaker of "Chef" in 2019', 20, 169.9, N'https://cdn.weartesters.com/wp-content/uploads/2013/12/Under-Armour-Anatomix-Spawn-Stephen-Curry-Away-PE-Detailed-Look-1.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (82, 26, N'Under Armour Curry 8 Gold Blooded', N'Color: gold and white; The most beautiful sneaker of "Chef" in 2020', 20, 169.9, N'https://i1.adis.ws/i/hibbett/0P375_1180_right1', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (83, 26, N'Under Armour Curry 8 Print Older Kids', N'Color: black, white and rain bow; Sneaker for kids', 30, 149.9, N'https://www.prodirectbasketball.com/productimages/V3_1_Main/224257_Main_0827479.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (84, 27, N'Anta 2018 KT3 Light', N'Color: Lightblue, white; The third KT sneaker', 25, 149.9, N'https://www.chinasportshop.com/media/catalog/product/cache/1/thumbnail/1000x/17f82f742ffe127f42dca9de82fb58b1/k/t/kt3-light-11821166-green.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (85, 27, N'Anta 2019 KT4', N'Color: blue, white; The fourth KT sneaker', 20, 149.9, N'https://i.pinimg.com/736x/74/24/86/74248650567540543894487883302abd.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (86, 27, N'Anta 2017 KT2', N'Color: black, lightblue; The second KT sneaker', 20, 149.9, N'https://di2ponv0v5otw.cloudfront.net/posts/2019/09/04/5d701d948d6f1a951d171c1b/m_5d701dfc689ebc9071c39087.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (87, 28, N'Converse G4 Draymond', N'Color: white, yellow and mix color', 25, 119.9, N'https://houseofheat.co/app/uploads/2020/04/converse-g4-low-ox-white-multi-color-167297c-release-date-info.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (88, 28, N'Converse G4 Draymond Black', N'Color: black; The cheap sneaker from DG23', 25, 99.9, N'https://cf.shopee.ph/file/4635286dbc656872af8ab403eb878a64', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (89, 31, N'The New Balance OMN1S "Money Stacks"(Kawhi)', N'Color: green, black; New sneaker from K.Leonard in 2021', 20, 149.9, N'https://houseofheat.co/app/uploads/2019/12/kawhi-leonard-new-balance-omn1s-money-stacks-release-date-info-2.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (90, 32, N'Paul George 2 Special', N'Color: black, galaxy; The second sneaker of PG13', 35, 119.9, N'https://ph-test-11.slatic.net/p/9be1ae961ff8ed7da8e47f7708956adb.jpg_720x720q80.jpg_.webp', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (91, 32, N'Paul George 5 Black Multicolor', N'Color: black, lightblue; The nineth sneaker of PG13', 35, 149.9, N'https://baskettemple.com/wp-content/uploads/2021/01/CW3143-001-PHCFH001.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (92, 36, N'Nike LeBron 19 To Debut In "Space"', N'Color: orange; The sneaker have close boost', 20, 169.9, N'https://lebronwire.usatoday.com/wp-content/uploads/sites/37/2021/06/NikeNews_SpaceJam_NewLegacy_Footwear_Apparel_09_original.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (93, 36, N'Nike LeBron 11', N'Color: red, black; The sneaker are very popular', 30, 149.9, N'https://cdn.weartesters.com/wp-content/uploads/2013/11/Nike-LeBron-XI-11-Away-Available-Now-1.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (94, 36, N'Nike LeBron 8 Low V2', N'Color: mix color, red; The sneaker are very popular', 30, 149.9, N'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/b83a9261-34cb-4249-9207-3ae078adf322/lebron-8-v-2-low-shoes-K83bDn.png', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (95, 36, N'Nike LeBron 17 White And Gold', N'Color: white and gold; Expensive sneaker from LeBron in 2019', 10, 169.9, N'https://acrossports.s3.amazonaws.com/productPhotos/NIKE/CD5006101/CD5006101_8.jpg', 2)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (96, 1, N'Embiid Model', N'It is small', 99, 19.9, N'https://i5.walmartimages.com/asr/15f89af1-a699-4b13-9e5e-04fe6783be02_1.331fa7d553408b61e2b8adc3233977cd.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (97, 2, N'J.Harden KeyChain', N'Have model keychain and normal keychain', 99, 19.9, N'https://m.media-amazon.com/images/I/617f0xJ25KL._AC_SL1500_.jpg', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (98, 6, N'Giannis NBA 2K19 Model', N'It look like Giannis in NBA 2K19 game', 100, 19.9, N'https://m.media-amazon.com/images/I/51q7vG6wm1L.jpg', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (99, 6, N'Giannis Model', N'It is small and look like "The Freak"', 100, 19.9, N'https://cf.shopee.vn/file/3d29bb8326439403bede4a522072174a', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (100, 14, N'F.Vanvleet Model', N'It is small with NBA 2019 champions', 99, 19.9, N'https://m.media-amazon.com/images/I/71xxmkNrmJL._AC_SL1500_.jpg', 3)
GO
print 'Processed 100 total records'
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (101, 16, N'KD Jersey KeyChain', N'It is small with No.7 and signature', 40, 19.9, N'https://cdn.shopify.com/s/files/1/2030/1917/products/KDNN_2400x.jpg?v=1638508249', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (102, 17, N'Kyrie Jersey KeyChain', N'It is small and great with No.11', 99, 19.9, N'https://cdn.shopify.com/s/files/1/2030/1917/products/KyrieNN_2400x.jpg?v=1638508360', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (103, 26, N'Curry Jersey KeyChain', N'It is small and great with No.30', 100, 19.9, N'https://ae01.alicdn.com/kf/HTB1X7MKQCrqK1RjSZK9q6xyypXac.jpg', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (104, 26, N'Curry Model', N'It is small and great lay-up skill', 50, 29.9, N'https://cdn.shopify.com/s/files/1/2578/8918/products/BHNBSMUFIRGSSC_p.jpg?v=1619630599', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (105, 27, N'Klay Jersey and Model KeyChain', N'It is small and great with No.11', 100, 19.9, N'https://static3.tcdn.com.br/img/img_prod/460977/chaveiro_klay_thompson_warriors_basquete_nba_evali_90369_1_9415d3531c8206659f59518a2c8f32a7.jpg', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (106, 31, N'K.Leonard', N'It is small and great with No.2', 100, 19.9, N'https://cdn.shopify.com/s/files/1/2578/8918/products/BHNBSMUDYDULCKL_g3_2048x.jpg?v=1613715109', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (107, 32, N'PG13 KeyChain', N'It is normal keychain', 100, 19.9, N'https://cdn11.bigcommerce.com/s-xhmrmcecz5/images/stencil/1280x1280/products/65881/66729/Paul-George-Los-Angeles-Clippers-NBA__51283.1608102605.jpg?c=1', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (108, 36, N'LeBron Jersey KeyChain', N'It is LeBron 10 Black', 100, 19.9, N'http://i.ebayimg.com/images/g/aD8AAOSwhURZgRGI/s-l500.jpg', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (109, 36, N'LeBron Model', N'It is small and great with No.23', 99, 19.9, N'https://cdn11.bigcommerce.com/s-ruomlrv671/images/stencil/1280x1280/products/27296/53963/medicom-nba-20-james__1__13335.1643218424.jpg?c=2', 3)
INSERT [dbo].[Products] ([proId], [pId], [proName], [proDescription], [proQuantity], [proPrice], [proImg_url], [ctId]) VALUES (112, 26, N'A.Davis Jersey Update', N'Color: purple, white; Lakers use this jersey in 8 years, No.23', 8, 89.9000015258789, N'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-anthony-davis-purple-2021-22-75th-anniversary-city-jersey.jpg', 3)
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Table [dbo].[AllStar_Players_2022]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllStar_Players_2022](
	[apId] [int] IDENTITY(1,1) NOT NULL,
	[apName] [varchar](255) NOT NULL,
	[pId] [int] NOT NULL,
	[tId] [int] NOT NULL,
	[apGroup] [varchar](255) NOT NULL,
	[apPTS] [int] NULL,
	[apRules] [varchar](255) NOT NULL,
	[apImg_url] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[apId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AllStar_Players_2022] ON
INSERT [dbo].[AllStar_Players_2022] ([apId], [apName], [pId], [tId], [apGroup], [apPTS], [apRules], [apImg_url]) VALUES (1, N'Lebron James', 36, 8, N'Team Lebron', 24, N'Captain', N'images/Allstars-2022/Allstars-2022-LeBron.png')
INSERT [dbo].[AllStar_Players_2022] ([apId], [apName], [pId], [tId], [apGroup], [apPTS], [apRules], [apImg_url]) VALUES (2, N'Stephen Curry', 26, 6, N'Team Lebron', 50, N'Member', N'images/Allstars-2022/Allstars-2022-Curry.png')
INSERT [dbo].[AllStar_Players_2022] ([apId], [apName], [pId], [tId], [apGroup], [apPTS], [apRules], [apImg_url]) VALUES (3, N'Giannis Antetokounmpo', 6, 2, N'Team Lebron', 30, N'Member', N'images/Allstars-2022/Allstars-2022-Giannis.png')
INSERT [dbo].[AllStar_Players_2022] ([apId], [apName], [pId], [tId], [apGroup], [apPTS], [apRules], [apImg_url]) VALUES (4, N'Chris Paul', 22, 5, N'Team Lebron', 15, N'Member', N'images/Allstars-2022/Allstars-2022-Paul.png')
INSERT [dbo].[AllStar_Players_2022] ([apId], [apName], [pId], [tId], [apGroup], [apPTS], [apRules], [apImg_url]) VALUES (5, N'Fred Vanvleet', 14, 3, N'Team Lebron', 6, N'Member', N'images/Allstars-2022/Allstars-2022-Vanvleet.png')
INSERT [dbo].[AllStar_Players_2022] ([apId], [apName], [pId], [tId], [apGroup], [apPTS], [apRules], [apImg_url]) VALUES (6, N'Draymond Green', 28, 6, N'Team Durant', 18, N'Member', N'images/Allstars-2022/Allstars-2022-Green.png')
INSERT [dbo].[AllStar_Players_2022] ([apId], [apName], [pId], [tId], [apGroup], [apPTS], [apRules], [apImg_url]) VALUES (7, N'Andrew Wiggins', 29, 6, N'Team Durant', 10, N'Member', N'images/Allstars-2022/Allstars-2022-Wiggins.png')
INSERT [dbo].[AllStar_Players_2022] ([apId], [apName], [pId], [tId], [apGroup], [apPTS], [apRules], [apImg_url]) VALUES (8, N'Joel Embiid', 1, 1, N'Team Durant', 36, N'Member', N'images/Allstars-2022/Allstars-2022-Embiid.png')
INSERT [dbo].[AllStar_Players_2022] ([apId], [apName], [pId], [tId], [apGroup], [apPTS], [apRules], [apImg_url]) VALUES (9, N'Devin Booker', 21, 5, N'Team Durant', 20, N'Member', N'images/Allstars-2022/Allstars-2022-Booker.png')
INSERT [dbo].[AllStar_Players_2022] ([apId], [apName], [pId], [tId], [apGroup], [apPTS], [apRules], [apImg_url]) VALUES (10, N'Khris Middleton', 7, 2, N'Team Durant', 5, N'Member', N'images/Allstars-2022/Allstars-2022-Middleton.png')
SET IDENTITY_INSERT [dbo].[AllStar_Players_2022] OFF
/****** Object:  Table [dbo].[Customer]    Script Date: 03/14/2022 00:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[cId] [int] IDENTITY(1,1) NOT NULL,
	[proId] [int] NOT NULL,
	[cName] [varchar](255) NOT NULL,
	[cGmail] [nvarchar](255) NULL,
	[cPhone] [int] NOT NULL,
	[cAddress] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_Account_isDeleted]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
/****** Object:  Default [DF_Message_mCreated_date]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_mCreated_date]  DEFAULT (getdate()) FOR [mCreated_date]
GO
/****** Object:  Default [DF_Orders_oCreated_date]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_oCreated_date]  DEFAULT (getdate()) FOR [oCreated_date]
GO
/****** Object:  ForeignKey [FK__Message__aId__68336F3E]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[Message]  WITH CHECK ADD FOREIGN KEY([aId])
REFERENCES [dbo].[Account] ([aId])
GO
/****** Object:  ForeignKey [FK__Team__gId__1446FBA6]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[Team]  WITH CHECK ADD FOREIGN KEY([gId])
REFERENCES [dbo].[Group] ([gId])
GO
/****** Object:  ForeignKey [FK__Orders__aId__57FD0775]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([aId])
REFERENCES [dbo].[Account] ([aId])
GO
/****** Object:  ForeignKey [FK__Orders__sId__58F12BAE]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([sId])
REFERENCES [dbo].[Shipping] ([sId])
GO
/****** Object:  ForeignKey [FK__OrderDetail__oId__5EAA0504]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([oId])
REFERENCES [dbo].[Orders] ([oId])
GO
/****** Object:  ForeignKey [FK__Players__tId__190BB0C3]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[Players]  WITH CHECK ADD FOREIGN KEY([tId])
REFERENCES [dbo].[Team] ([tId])
GO
/****** Object:  ForeignKey [FK__Products__ctId__284DF453]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ctId])
REFERENCES [dbo].[Category] ([ctId])
GO
/****** Object:  ForeignKey [FK__Products__pId__2759D01A]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([pId])
REFERENCES [dbo].[Players] ([pId])
GO
/****** Object:  ForeignKey [FK__AllStar_Pla__pId__1DD065E0]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[AllStar_Players_2022]  WITH CHECK ADD FOREIGN KEY([pId])
REFERENCES [dbo].[Players] ([pId])
GO
/****** Object:  ForeignKey [FK__AllStar_Pla__tId__1EC48A19]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[AllStar_Players_2022]  WITH CHECK ADD FOREIGN KEY([tId])
REFERENCES [dbo].[Team] ([tId])
GO
/****** Object:  ForeignKey [FK__Customer__proId__2D12A970]    Script Date: 03/14/2022 00:13:50 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([proId])
REFERENCES [dbo].[Products] ([proId])
GO
