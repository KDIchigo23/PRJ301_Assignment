CREATE DATABASE Assign_PRJ301
GO

USE Assign_PRJ301
GO

---------- Table [dbo].[Group]

CREATE TABLE [Group] (
	gId INT PRIMARY KEY NOT NULL,
	gName VARCHAR(20) NOT NULL,
)
GO
---------- Table [dbo].[Team]

CREATE TABLE [Team] (
	tId INT PRIMARY KEY NOT NULL,
	tName VARCHAR(255) NOT NULL,
	gId INT  FOREIGN KEY(gId) REFERENCES [Group](gId) NOT NULL,
)
GO
---------- Table [dbo].[Players]

CREATE TABLE [Players] (
	pId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	pName VARCHAR(255) NOT NULL,
	pDob DATE NOT NULL,
	tId INT FOREIGN KEY(tId) REFERENCES [Team](tId) NOT NULL,
	pPosition VARCHAR(255) NOT NULL,
	pHeight VARCHAR(10) NOT NULL,
	pNo INT NOT NULL,
	pAchievement VARCHAR(255),
	pImg_url VARCHAR(2000),
	[isDeleted] bit NOT NULL,
)
GO

ALTER TABLE [dbo].[Players] ADD  CONSTRAINT [DF_Players_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO

---------- Table [dbo].[AllStar_Players_2022]

CREATE TABLE [AllStar_Players_2022] (
	apId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	apName VARCHAR(255) NOT NULL,
	pId INT NOT NULL,
	tId INT FOREIGN KEY(tId) REFERENCES [Team](tId) NOT NULL,
	apGroup VARCHAR(255) NOT NULL,
	apPTS INT,
	apRules VARCHAR(255) NOT NULL,
	apImg_url NVARCHAR(2000),
	apPosition VARCHAR(255) NOT NULL,
	apNo INT NOT NULL,
)
GO
---------- Table [dbo].[Category]

CREATE TABLE [Category] (
	ctId INT PRIMARY KEY NOT NULL,
	ctName VARCHAR(255) NOT NULL,
)
GO
---------- Table [dbo].[Products]

CREATE TABLE [Products] (
	proId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	pId INT FOREIGN KEY(pId) REFERENCES [Players](pId) NOT NULL,
	proName VARCHAR(255) NOT NULL,
	proDescription NVARCHAR(255),
	proQuantity INT NOT NULL,
	proPrice FLOAT NOT NULL,
	proImg_url NVARCHAR(255),
	ctId INT FOREIGN KEY(ctId) REFERENCES [Category](ctId) NOT NULL
	
)
GO

---GO------- Table [dbo].[Customer]

CREATE TABLE [Customer] (
	cId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	proId INT FOREIGN KEY(proId) REFERENCES [Products](proId) NOT NULL,
	cName VARCHAR(255) NOT NULL,
	cGmail NVARCHAR(255),
	cPhone INT NOT NULL,
	cAddress NVARCHAR(255) NOT NULL,
)
GO
---------- Table [dbo].[Account]

CREATE TABLE [dbo].[Account](
	[aId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[aUsername] [nvarchar](255) NULL,
	[aPassword] [nvarchar](255) NULL,
	[aDisplayName] [nvarchar](255) NULL,
	[aAddress] [nvarchar](255) NULL,
	[aEmail] [nvarchar](255) NULL,
	[aPhone] [nvarchar](255) NULL,
	[aRole] [nvarchar](255) NULL,
	[isDeleted] [bit] null,
)
GO

ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO

---------- Table [dbo].[Message]

CREATE TABLE [dbo].[Message](
	[mId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[aId] [int] FOREIGN KEY(aId) REFERENCES [Account](aId) NOT NULL,
	[mCreated_date] [date] NULL,
	[mMessage] [nvarchar](255) NULL,
)

GO
ALTER TABLE [dbo].[Message] ADD  CONSTRAINT [DF_Message_mCreated_date]  DEFAULT (getdate()) FOR [mCreated_date]
GO

-------------- Table [dbo].[Shipping]  

CREATE TABLE [dbo].[Shipping](
	[sId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[sName] [nvarchar](255) NULL,
	[sPhone] [nvarchar](255) NULL,
	[sAddress] [nvarchar](255) NULL,
)

GO
-------------- Table [dbo].[Orders]  

CREATE TABLE [dbo].[Orders](
	[oId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[aId] [int] FOREIGN KEY(aId) REFERENCES [Account](aId) NOT NULL,
	[oTotalPrice] [float] NULL,
	[oNote] [text] NULL,
	[oCreated_date] [date] NULL,
	[sId] [int] FOREIGN KEY(sId) REFERENCES [Shipping](sId) NULL,
)
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_oCreated_date]  DEFAULT (getdate()) FOR [oCreated_date]
GO
-------------- Table [dbo].[OrderDetail] 

CREATE TABLE [dbo].[OrderDetail](
	[odId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[oId] [int] FOREIGN KEY(oId) REFERENCES [Orders](oId) NULL,
	[proName] [nvarchar](255) NULL,
	[proImg_url] [nvarchar](255) NULL,
	[proPrice] [float] NULL,
	[odQuantity] [int] NULL,	
)
GO

DROP TABLE [Message]
DROP TABLE [OrderDetail] 
DROP TABLE [Orders] 
DROP TABLE [Shipping]
DROP TABLE [Account] 
DROP TABLE [AllStar_Players_2022]
DROP TABLE [Customer]
DROP TABLE [Products]
DROP TABLE [Category]
DROP TABLE [Players] 
DROP TABLE [Group] 
DROP TABLE [Team]



INSERT INTO [Group] (gId, gName) VALUES (1, 'West')
INSERT INTO [Group] (gId, gName) VALUES (2, 'East')


INSERT INTO [Team] (tId, tName, gId) VALUES (1, 'Philadelphia 76ers', 1)
INSERT INTO [Team] (tId, tName, gId) VALUES (2, 'Milwaukee Bucks', 1)
INSERT INTO [Team] (tId, tName, gId) VALUES (3, 'Toronto Raptors', 1)
INSERT INTO [Team] (tId, tName, gId) VALUES (4, 'Brooklyn Nets', 1)
INSERT INTO [Team] (tId, tName, gId) VALUES (5, 'Phoenix Suns', 2)
INSERT INTO [Team] (tId, tName, gId) VALUES (6, 'Golden State Warriors', 2)
INSERT INTO [Team] (tId, tName, gId) VALUES (7, 'Los Angeles Clippers', 2)
INSERT INTO [Team] (tId, tName, gId) VALUES (8, 'Los Angeles Lakers', 2)


INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Joel Embiid', '1994-03-16', 1, 'C', '2.13 m', 21, '5× NBA All-Star (2018–2022), 3× All-NBA Second Team (2018, 2019, 2021)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTczMTczOTg3MDc1OTU4NTY0/76ers-joel-embiid-points-crowd.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('James Harden', '1989-08-26', 1, 'SG', '1.96 m', 1, '10× NBA All-Star (2013–2022), 6× All-NBA First Team (2014, 2015, 2017–2020)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3Njc5OTMxMjIyNzI5OTgz/harden.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Danny Green', '1987-06-22', 1, 'SG', '1.98 m', 14, '3× NBA champion (2014, 2019, 2020), NBA All-Defensive Second Team (2017)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgxNzM2ODk5MzQ0MzQ0MjMw/usatsi_16228763_168388689_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Tobias Harris', '1992-07-15', 1, 'SF', '2.01 m', 12, 'Second-team All-SEC – Coaches (2011)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg1MDAwNzAwMDIxODQzNDMx/usatsi_17046817_168388689_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Tyrese Maxey', '2000-11-04', 1, 'PG', '1.88 m', 0, 'Second-team All-SEC (2020)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgxODcyOTQzMjM4NzUxNTYw/usatsi_16276547_168388689_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Giannis Antetokounmpo', '1994-12-06', 2, 'PF', '2.11 m', 34, 'NBA champion (2021), NBA Finals MVP (2021), NBA All-Star Game MVP (2021)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgyNTI4MjQ0NjUyNzEzMjg4/giannis-bucks-offseason.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Khris Middleton', '1991-08-12', 2, 'SF', '2.01 m', 22, 'NBA champion (2021), 3× NBA All-Star (2019, 2020, 2022)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTY4MDMxNTMxNDY4MjY4OTI4/khris-middleton-lead-bucksjpg.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Jrue Holiday', '1989-06-12', 2, 'PG', '1.91 m', 21, 'NBA champion (2021), NBA All-Star (2013)', 'https://img.bleacherreport.net/img/images/photos/003/915/361/hi-res-e66e19b66bf8b3ecd38e2f67841460aa_crop_exact.jpg?w=1200&h=1200&q=75')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Bobby Portis', '1995-02-10', 2, 'PF', '2.09 m', 9, 'NBA champion (2021)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgyMTM2Mjk1MDY0MDg1ODMy/usatsi_16353140_168388303_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Brook Lopez', '1988-07-01', 2, 'C', '2.13 m', 11, 'NBA champion (2021), NBA All-Star (2013)s', 'https://img.bleacherreport.net/img/images/photos/003/808/640/hi-res-a4fa01f222c01f69845365533ec8fd29_crop_exact.jpg?w=1200&h=1200&q=75')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Pascal Siakam', '1994-01-02', 3, 'PF', '2.03 m', 43, 'NBA champion (2019), NBA All-Star (2020)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgwMjI3MTk2MDU5NjU3MzM4/siakam.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Scottie Barnes', '2001-08-01', 3, 'SF', '2.08 m', 4, 'Third-team All-ACC (2021)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3MTE5OTgwMjMwMjIyOTg5/usatsi_17570378_168390270_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Khem Birch', '1992-09-28', 3, 'C', '2.06 m', 24, 'NBA D-League All-Rookie First Team (2015)', 'https://cdn.vox-cdn.com/thumbor/wetUToaxTckGRRyEW3hSry4Ga_4=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22449646/1312558713.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Fred Vanvleet', '1994-02-25', 3, 'PG', '1.85 m', 23, 'NBA champion (2019), NBA All-Star (2022)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgwMzAwNzYzMjEyMjkzOTk2/usatsi_15834400_168390270_lowres-1.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('OG Anunoby', '1997-07-17', 3, 'SF', '2.01 m', 3, 'NBA champion (2019)', 'https://cdn.vox-cdn.com/thumbor/Z4ABzxhxyMW58awMf3_Umq46Sc8=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19932075/usa_today_14216898.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Kevin Durant', '1988-09-29', 4, 'PF', '2.08 m', 7, '2× NBA champion (2017, 2018), 2× NBA Finals MVP (2017, 2018), 12× NBA All-Star (2010–2019, 2021, 2022)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg2MjQyNjc0MTA0MjE1MjM1/usatsi_17178912_168388303_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Kyrie Irving', '1992-03-23', 4, 'PG', '1.88 m', 11, 'NBA champion (2016), 7× NBA All-Star (2013–2015, 2017–2019, 2021), NBA All-Star Game MVP (2014)', 'https://d.newsweek.com/en/full/1911743/kyrie-irving-brooklyn-nets-covid-vaccine.jpg?w=1600&h=1600&q=88&f=9909532927b825c1699c13f22c265347')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Ben Simmons', '1996-07-20', 4, 'PG', '2.11 m', 10, 'NBA All-Star Game MVP (2014), NBA Rookie of the Year (2018)', 'https://lh3.googleusercontent.com/-gszTKKAwjKA/YgWvR0r1j8I/AAAAAAAApmo/7HvszJHGXF0yxE7xXZyx5P-S3VX2H9ykwCNcBGAsYHQ/s16000/2K22-Ben-Simmons-Nets-Portrait.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Seth Curry', '1989-08-23', 4, 'PG', '1.88 m', 30, '2× NBA D-League All-Star (2014, 2015)', 'https://cdn.vox-cdn.com/thumbor/XjH8tM0ptgZkSi2qWcvwYCT7L5k=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23242629/1370603171.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Blake Griffin', '1989-03-16', 4, 'PF', '2.06 m', 2, '6× NBA All-Star (2011–2015, 2019), NBA Rookie of the Year (2011)', 'https://cdn.vox-cdn.com/thumbor/glY1fHlPCOZgEertQTw0Rfj3dgY=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22656121/1322441282.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Devin Booker', '1996-11-30', 5, 'SG', '1.96 m', 1, '3× NBA All-Star (2020–2022), NBA Three-Point Contest champion (2018)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTgxNjI2NjY5Mjc3MTI3OTM4/usatsi_16233476_168388303_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Chris Paul', '1985-05-06', 5, 'PG', '1.83 m', 3, '12× NBA All-Star (2008–2016, 2020–2022), NBA All-Star Game MVP (2013)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cq_auto:good%2Cw_1200/MTg3MTM3MjE1Mzk3MTExMjgx/chris-paul.png')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Frank Kaminsky', '1993-07-04', 5, 'PF', '2.13 m', 8, 'National college player of the year (2015)', 'https://cdn.vox-cdn.com/thumbor/I2y2LfgR90ORSirGFU7Fymjc8O8=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19424059/usa_today_13612522.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Deandre Ayton', '1998-07-23', 5, 'C', '2.11 m', 22, 'NBA All-Rookie First Team (2019)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg0Mzk1Njg0NjIxODU0MTg2/deandre-ayton-suns-bucks.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Mikal Bridges', '1996-07-30', 5, 'SF', '1.98 m', 25, '2× NCAA champion (2016, 2018)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc4Njg5NzEyNjU4MDY1MTg0/mikal-bridges-suns-drive.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Stephen Curry', '1988-03-14', 6, 'PG', '1.88 m', 30, '3× NBA champion (2015, 2017, 2018), 8× NBA All-Star (2014–2019, 2021, 2022), NBA All-Star Game MVP (2022)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg2Nzg4ODc1Mjk1Nzk0ODg3/steph-curry-ruined-game.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Klay Thompson', '1990-02-08', 6, 'SG', '1.98 m', 11, '3× NBA champion (2015, 2017, 2018), 5× NBA All-Star (2015–2019)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg2NjY4MzYwNjYwOTUyNjg1/klay-thompson-warriors-return.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Draymond Green', '1990-03-04', 6, 'PF', '1.98 m', 23, '3× NBA champion (2015, 2017, 2018), 4× NBA All-Star (2016–2018, 2022), NBA Defensive Player of the Year (2017)', 'https://cdn.vox-cdn.com/thumbor/Y0REJwebwXHWlC8wgy74t8UTywk=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19325783/1178483748.jpg.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Andrew Wiggins', '1995-03-23', 6, 'SF', '2.01 m', 22, 'NBA All-Star (2022), NBA Rookie of the Year (2015)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3MDQ0ODA2NzU5ODE4MjUx/usatsi_17119074_168388303_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Kevon Looney', '1996-03-06', 6, 'C', '2.06 m', 5, '2× NBA champion (2017, 2018)', 'https://cdn.vox-cdn.com/thumbor/Wh6v6WyyaNwFOJmlsWnWO99D9WE=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22279803/1230248304.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Kawhi Leonard', '1991-06-29', 7, 'SF', '2.01 m', 2, '2× NBA champion (2014, 2019), 2× NBA Finals MVP (2014, 2019), 5× NBA All-Star (2016, 2017, 2019–2021)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTcyMDU4NjkyNTE3MTExMjAz/kawhi-leonard-clippers-nike-lawsuit.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Paul George', '1990-05-02', 7, 'SF', '2.03 m', 13, '7× NBA All-Star (2013, 2014, 2016–2019, 2021)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg2NjU2NzE5MTUyMDk2ODc3/usatsi_17427851_168390270_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Marcus Morris Sr', '1989-09-02', 7, 'PF', '2.03 m', 8, 'Big 12 Player of the Year (2011)', 'https://www.si.com/.image/t_share/MTcwOTQwNTc0ODIyNTczNjQw/usatsi_14128608.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Ivica Zubac', '1997-03-18', 7, 'C', '2.13 m', 40, 'Serbian Cup champion (2016)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTcyMDAwNDg3NjU3MTg2NDM5/usatsi_14128618_168390179_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Nicolas batum', '1988-12-14', 7, 'PF', '2.03 m', 33, 'Albert Schweitzer Tournament MVP (2006)', 'https://cdn.vox-cdn.com/thumbor/S7KqYnf8Vo5NA_8w3QbFaoVcQMQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22958979/1349094339.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Lebron James', '1984-12-30', 8, 'SF', '2.06 m ', 6, '4× NBA champion (2012, 2013, 2016, 2020), 4× NBA Finals MVP (2012, 2013, 2016, 2020), 18× NBA All-Star (2005–2022)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc4NjU3NDQ4MDU4NDMxMTMy/lebron-james-hawks-lakers.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Anthony Davis', '1993-03-11', 8, 'C', '2.08 m', 23, 'NBA champion (2020), 8× NBA All-Star (2014–2021), NBA All-Star Game MVP (2017)', 'https://static01.nyt.com/images/2021/05/29/sports/29lakers1-print/29lakers-davis1-mediumSquareAt3X.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Russel Westbrook', '1988-11-12', 8, 'PG', '1.91 m', 0, '9× NBA All-Star (2011–2013, 2015–2020), 2× NBA All-Star Game MVP (2015, 2016)', 'https://cdn.vox-cdn.com/thumbor/H0RWG2SiEmHeoIh1A65rPZOH4os=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23148759/1237542150.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Carmelo Anthony', '1984-05-29', 8, 'SF', '2.01 m', 7, '10× NBA All-Star (2007, 2008, 2010–2017)', 'https://fadeawayworld.net/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg1NDUzOTk4NjU0ODkxNTM1/carmelo-anthony-on-lakers-win-vs-pistons--we-needed-something-like-that-to-spark-our-fire.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Malik Monk', '1998-02-04', 8, 'SG', '1.91 m', 11, 'Consensus second-team All-American (2017)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3MTM5MTA1OTg4MDI3ODg5/usatsi_17589820.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Georges Niang', '1993-07-17', 1, 'PF', '2.01 m', 20, 'First-team All NBA G League (2018)', 'https://cdn.vox-cdn.com/thumbor/dAFK-8nWzkFMDLhdfV-XYiPipGw=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22966890/1236194253.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Isaiah Joe', '1999-07-02', 1, 'SG', '1.93', 7, 'SEC All-Freshman team (2019)', 'https://cdn.vox-cdn.com/thumbor/nrFHbXvE7xE7yIeRi9Jwf7lZNJc=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22324245/1230792329.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Matisse Thybulle', '1997-03-04', 1, 'SF', '1.96', 22, 'SEC All-Freshman team (2020)', 'https://static01.nyt.com/images/2020/07/16/sports/16nba-matisse-lede2/16nba-matisse-lede2-mediumSquareAt3X.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Jordan Nwora', '1998-08-08', 2, 'SF', '2.03', 13, 'NBA champion (2021)', 'https://www.ballysports.com/images/image/private/t_1-1_768/f_auto/prod/bismlnvgrpbcwcqfifry.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('George Hill', '1986-04-04', 2, 'PG', '1.93 m', 3, 'Summit League Player of the Year (2008)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3MTE0NDE1ODMxNjU1NTY1/usatsi_12756514_168388303_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Pat Connaughton', '1993-01-06', 2, 'SG', '1.96 m', 24, 'NBA champion (2021)', 'https://cdn.vox-cdn.com/thumbor/XnFB26OGuZfzKwLHdYsGkhk-ONw=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23239410/1358288228.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Justin Champagnie', '2001-06-29', 3, 'SF', '1.98 m', 11, 'First-team All-ACC (2021)', 'https://cdn.vox-cdn.com/thumbor/xAKzFOGHxEDxlUIhUpMi4N0CLic=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22931225/1235794331.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Malachi Flynn', '1998-04-09', 3, 'PG', '1.85 m', 22, 'All-NBA G League Second Team (2021)', 'https://cdn.vox-cdn.com/thumbor/rNc3IcrA1tg98cOe24gBP1NLclA=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22662565/usa_today_16027165.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Yuta Watanabe', '1994-11-13', 3, 'SF', '2.06 m', 18, 'Atlantic 10 Defensive Player of the Year (2018)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc4ODMyODc0MTE4NTg3OTEx/usatsi_15463151_168390270_lowres.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('LaMarcus Aldridge', '1985-07-19', 4, 'C', '2.11 m', 21, '7× NBA All-Star (2012–2016, 2018, 2019)', 'https://pbs.twimg.com/media/ExhNhO8WEAo-cKv.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Kessler Edwards', '2000-08-09', 4, 'SF', '2.01 m', 14, 'First-team All-WCC (2021)', 'https://cdn.vox-cdn.com/thumbor/OesqxjfFyoU7tD8eH7_Vz_LlnaI=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22786338/1234704987.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Joe Harris', '1991-09-06', 4, 'SG', '1.98 m', 12, 'NBA Three-Point Contest champion (2019)', 'https://cdn.vox-cdn.com/thumbor/eARWWvnLDWgUGHbIu6D0ffU--LE=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23050543/1352719765.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Cameron Payne', '1994-08-08', 5, 'PG', '1.85 m', 15, 'OVC Player of the Year (2015)', 'https://cdn.vox-cdn.com/thumbor/hMOZuD_hbJBnCJrQ6R9M-GZSdQc=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22540373/usa_today_16148090.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Jae Crowder', '1990-07-06', 5, 'SF', '1.98 m', 99, 'Second-team All-American – AP, SN (2012)', 'https://cdn.vox-cdn.com/thumbor/OrMk54QRQn_Xg1ry-Pvc2Iy-0rA=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22533303/1232800938.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Landry Shamet', '1997-03-13', 5, 'SG', '1.93 m', 14, 'NBA All-Rookie Second Team (2019)', 'https://cdn.vox-cdn.com/thumbor/EPIUifk7kp_uSuKcZO6X4-96fo8=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22930060/1235824407.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('James Wiseman', '2001-03-31', 6, 'C', '2.13 m', 33, 'Morgan Wootten National Player of the Year (2019)', 'https://cdn.vox-cdn.com/thumbor/MuytJePBxUEyUX8V0zPmiodPBOU=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22857229/1309974474.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Jordan Poole', '1999-07-19', 6, 'SG', '1.930m', 3, 'All-NBA G League Third Team (2021)', 'https://cdn.vox-cdn.com/thumbor/VB_KD31jjIli2XBpz8xKeeJfnS4=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22203991/1230248141.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Gary Payton II', '1992-12-01', 6, 'PG', '1.91 m', 0, 'NBA G League champion (2019)', 'https://fadeawayworld.net/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg1MTQ0MTk3Mjk1NjQ2MDQx/payton-2.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Brandon Boston Jr', '2001-11-28', 7, 'SG', '1.98 m', 4, 'McDonalds All-American (2020)', 'https://cdn.vox-cdn.com/thumbor/RxAJ0NlWhcGcPmqGbrs4-BOhPfY=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23023400/1236623561.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Norman Powell', '1993-04-25', 7, 'SG', '1.91 m', 24, 'NBA champion (2019)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg3MjQwMjI2Njk4MDQ1MzI2/12382542650.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Terance Mann', '1996-11-18', 7, 'SF', '1.98 m', 14, 'First-team All-ACC (2011)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc5ODY0MjUwMzg1MTgwMjcx/usatsi_15794925.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Dwight Howard', '1985-12-08', 8, 'C', '2.08 m', 39, 'NBA champion (2020), 8× NBA All-Star (2007–2014)', 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTg0Nzk5NDU3NzE4NTc2NjE1/dwight-howard.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('DeAndre Jordan', '1998-07-21', 8, 'C', '2.11 m', 10, 'NBA All-Star (2017)', 'https://cdn.vox-cdn.com/thumbor/qsKwSbPufrBh8tUXfMsGBbeUqJw=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23278843/usa_today_17513813.jpg')
INSERT INTO [Players] (pName, pDob, tId, pPosition, pHeight, pNo, pAchievement, pImg_url) VALUES ('Stanley Johnson', '1996-04-29', 8, 'SF', '1.98 m', 14, 'Julius Erving Award (2015)', 'https://cdn.vox-cdn.com/thumbor/WdUVIuOxdGUVyDi_CY2-7kiBQAs=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23150149/1362469267.jpg')



INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url, apPosition, apNo) VALUES ('Lebron James', 36, 8, 'Team Lebron', 24, 'Captain', 'images/Allstars-2022/Allstars-2022-LeBron.png', 'SF', 6)
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url, apPosition, apNo) VALUES ('Stephen Curry', 26, 6, 'Team Lebron', 50, 'Member', 'images/Allstars-2022/Allstars-2022-Curry.png', 'PG', 30) 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url, apPosition, apNo) VALUES ('Giannis Antetokounmpo', 6, 2, 'Team Lebron', 30, 'Member', 'images/Allstars-2022/Allstars-2022-Giannis.png', 'PF', 34) 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url, apPosition, apNo) VALUES ('Chris Paul', 22, 5, 'Team Lebron', 15, 'Member', 'images/Allstars-2022/Allstars-2022-Paul.png', 'PG', 3) 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url, apPosition, apNo) VALUES ('Fred Vanvleet', 14, 3, 'Team Lebron', 6, 'Member', 'images/Allstars-2022/Allstars-2022-Vanvleet.png', 'SG', 23) 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url, apPosition, apNo) VALUES ('Draymond Green', 28, 6, 'Team Durant', 18, 'Member', 'images/Allstars-2022/Allstars-2022-DGreen.png', 'PF', 23) 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url, apPosition, apNo) VALUES ('Andrew Wiggins', 29, 6, 'Team Durant', 10, 'Member', 'images/Allstars-2022/Allstars-2022-Wiggins.png', 'SF', 22) 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url, apPosition, apNo) VALUES ('Joel Embiid', 1, 1, 'Team Durant', 36, 'Member', 'images/Allstars-2022/Allstars-2022-Embiid.png', 'C', 21) 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url, apPosition, apNo) VALUES ('Devin Booker', 21, 5, 'Team Durant', 20, 'Member', 'images/Allstars-2022/Allstars-2022-Booker.png', 'PG', 1) 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url, apPosition, apNo) VALUES ('Khris Middleton', 7, 2, 'Team Durant', 5, 'Member', 'images/Allstars-2022/Allstars-2022-Middleton.png', 'SG', 22) 
 
 
INSERT INTO [Category] (ctId, ctName) VALUES (1, 'Jersey')
INSERT INTO [Category] (ctId, ctName) VALUES (2, 'Sneaker')
INSERT INTO [Category] (ctId, ctName) VALUES (3, 'Item')


INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(1, 'Embiid Jersey', 'Color: blue, white; Philadelphia use this jersey in 12 years, No.21', 10, 89.9, 'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-joel-embiid-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(2, 'J.Harden Jersey', 'Color: blue, white; Philadelphia use this jersey in 12 years, No.1', 20, 89.9, 'https://www.nbasportsjersey.com/images/philadelphia-76ers/james-harden-75th-anniversary-icon-royal-jersey-.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(3, 'Danny Green Jersey', 'Color: blue, white; Philadelphia use this jersey in 12 years, No.14', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-danny-green-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(4, 'T.arris Jersey', 'Color: blue, white; Philadelphia use this jersey in 12 years, No.12', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-tobias-harris-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(5, 'T.Maxey Jersey', 'Color: blue, white; Philadelphia use this jersey in 12 years, No.0', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-tyrese-maxey-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(6, 'Giannis Jersey', 'Color: black, green; New jersey of Bucks, No.34', 10, 99.9, 'https://www.nbajerseyonline.net/image/milwaukee-bucks/milwaukee-bucks-giannis-antetokounmpo-black-2021-nba-finals-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(7, 'Kh.Middleton Jersey', 'Color: black, green; New jersey of Bucks, No.22', 20, 79.9, 'https://www.nbajerseyonline.net/image/milwaukee-bucks/milwaukee-bucks-khris-middleton-black-2021-nba-finals-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(8, 'Jr.Holiday Jersey', 'Color: black, green; New jersey of Bucks, No.21', 20, 69.9, 'https://www.nbajerseyonline.net/image/milwaukee-bucks/milwaukee-bucks-jrue-holiday-black-2021-nba-finals-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(9, 'Bobby Portis Jersey', 'Color: green, yellow; New jersey of Bucks, No.9', 20, 69.9, 'https://www.nbajerseyonline.net/images/milwaukee-bucks/milwaukee-bucks-icon-edition-bobby-portis-jr.-green-swingman-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(10, 'B.Lopez Jersey', 'Color: green, yellow; Old jersey of Bucks, No.11', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/milwaukee-bucks/milwaukee-bucks-brook-lopez-hunter-green-2021-22-75th-anniversary-diamond-icon-edition-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(11, 'P.Siakam Jersey', 'Color: black, red; Raptors use this jersey in 5 years, No.43', 20, 79.9, 'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-pascal-siakam-black-replica-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(12, 'Scottie Barnes Jersey', 'Color: red, black; Raptors use this jersey in 5 years, No.4', 20, 69.9, 'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-scottie-barnes-red-authentic-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(13, 'Khem Birch Jersey', 'Color: black, red; Raptors use this jersey in 5 years, No.24', 20, 69.9, 'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-khem-birch-black-statement-edition-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(14, 'Fred Vanvleet Jersey', 'Color: black, red; Raptors use this jersey in 5 years, No.23', 20, 69.9, 'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-fred-vanvleet-black-replica-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(15, 'Anunoby Jersey', 'Color: black, red; Raptors use this jersey in 5 years, No.3', 20, 69.9, 'https://www.nbajerseyonline.net/image/toronto-raptors/toronto-raptors-og-anunoby-black-replica-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(16, 'K.Durant Jersey', 'Color: blue, black; New jersey of Nets, No.7', 10, 99.9, 'https://www.nbajerseyonline.net/mlb-apparels/brooklyn-nets/men-brooklyn-nets-kevin-durant-blue-city-edition-75th-anniversary-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(17, 'K.Irving Jersey', 'Color: blue, black; New jersey of Nets, No.11', 20, 79.9, 'https://www.nbajerseyonline.net/nba-apparels/brooklyn-nets/brooklyn-nets-kyrie-irving-navy-2021-22-75th-anniversary-authentic-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(18, 'Ben Simmons Jersey', 'Color: blue, black; New jersey of Nets, No.10', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/brooklyn-nets/brooklyn-nets-ben-simmons-navy-2022-city-edition-75th-diamond-badge-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(19, 'Seth Curry Jersey', 'Color: blue, black; New jersey of Nets, No.30', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/brooklyn-nets/brooklyn-nets-seth-curry-navy-2022-city-edition-75th-diamond-badge-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(20, 'B.Griffin Jersey', 'Color: blue, black; New jersey of Nets, No.2', 20, 69.9, 'https://www.nbajerseyonline.net/mlb-apparels/brooklyn-nets/men-brooklyn-nets-blake-griffin-blue-city-edition-75th-anniversary-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(21, 'D.Booker Jersey', 'Color: black, orange; Suns use this jersey in 2 years, No.1', 10, 89.9, 'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-devin-booker-black-2021-22-replica-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(22, 'C.Paul Jersey', 'Color: black, orange; Suns use this jersey in 2 years, No.3', 10, 99.9, 'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-chris-paul-black-2021-22-replica-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(23, 'F.Kaminsky Jersey', 'Color: black, orange; Suns use this jersey in 2 years, No.8', 20, 69.9, 'https://www.nbajerseyonline.net/phoenix-suns/men-phoenix-suns-frank-kaminsky-nba75th-city-edition-black-2021-22-replica-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(24, 'D.Ayton Jersey', 'Color: black, orange; Suns use this jersey in 2 years, No.22', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-deandre-ayton-black-2021-22-replica-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(25, 'M.Bridges Jersey', 'Color: black, orange; Suns use this jersey in 2 years, No.25', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-mikal-bridges-black-2021-22-replica-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(26, 'Steph.Curry Jersey', 'Color: black, yellow; Warriors use this jersey in 6 years, No.30', 10, 99.9, 'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-stephen-curry-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(27, 'K.Thompson Jersey', 'Color: black, yellow; Warriors use this jersey in 6 years, No.11', 15, 89.9, 'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-klay-thompson-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(28, 'Draymond Green Jersey', 'Color: black, yellow; Warriors use this jersey in 6 years, No.23', 15, 89.9, 'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-draymond-green-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(29, 'A.Wiggins Jersey', 'Color: black, yellow; Warriors use this jersey in 6 years, No.22', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-andrew-wiggins-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(30, 'K.Looney Jersey', 'Color: black, yellow; Warriors use this jersey in 6 years, No.5', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-kevon-looney-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(31, 'K.Leonard Jersey', 'Color: black, white; New Jersey of Clippers, No.2', 10, 99.9, 'https://www.nbajerseyonline.net/image/los-angeles-clippers/los-angeles-clippers-kawhi-leonard-black-city-edition-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(32, 'P.George Jersey', 'Color: black, white; New Jersey of Clippers, No.13', 15, 79.9, 'https://www.nbajerseyonline.net/image/los-angeles-clippers/los-angeles-clippers-paul-george-black-city-edition-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(33, 'Marcus Morris Sr Jersey', 'Color: black, white; New Jersey of Clippers, No.8', 20, 69.9, 'https://www.nbajerseyonline.net/image/los-angeles-clippers/los-angeles-clippers-marcus-morris-sr.-black-city-edition-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(34, 'Ivica Zubac Jersey', 'Color: black, white; New Jersey of Clippers, No.40', 20, 69.9, 'https://www.nbajerseyonline.net/image/los-angeles-clippers/los-angeles-clippers-ivica-zubac-black-city-edition-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(35, 'Nicolas batum Jersey', 'Color: black, white; New Jersey of Clippers, No.33', 20, 69.9, 'https://www.nbajerseyonline.net/image/los-angeles-clippers/los-angeles-clippers-nicolas-batum-black-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(36, 'L.James Jersey', 'Color: purple, white; Lakers use this jersey in 8 years, No.6', 10, 109.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-lebron-james-purple-2021-22-75th-anniversary-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(37, 'A.Davis Jersey', 'Color: purple, white; Lakers use this jersey in 8 years, No.23', 10, 89.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-anthony-davis-purple-2021-22-75th-anniversary-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(38, 'R.Westbrook Jersey', 'Color: purple, white; Lakers use this jersey in 8 years, No.0', 15, 79.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-russell-westbrook-purple-2021-22-75th-anniversary-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(39, 'Carmelo Anthony Jersey', 'Color: purple, white; Lakers use this jersey in 8 years, No.7', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-anthony-davis-purple-2021-22-75th-anniversary-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(40, 'Malik Monk Jersey', 'Color: purple, white; Lakers use this jersey in 8 years, No.11', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-malik-monk-purple-2021-22-75th-anniversary-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(41, 'G.Niang Jersey', 'Color: blue, white; Philadelphia use this jersey in 12 years, No.20', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-georges-niang-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(42, 'Isaiah Joe Jersey', 'Color: blue, white; Philadelphia use this jersey in 12 years, No.7', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-isaiah-joe-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(43, 'Matisse Thybulle Jersey', 'Color: blue, white; Philadelphia use this jersey in 12 years, No.22', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-matisse-thybulle-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(44, 'Jordan Nwora Jersey', 'Color: black, green; New jersey of Bucks, No.13', 20, 69.9, 'https://www.nbajerseyonline.net/image/milwaukee-bucks/milwaukee-bucks-jordan-nwora-black-statement-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(45, 'George Hill Jersey', 'Color: black, green; New jersey of Bucks, No.3', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/milwaukee-bucks/milwaukee-bucks-george-hill-black-statement-edition-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(46, 'P.Connaughton Jersey', 'Color: green; Old jersey of Bucks, No.24', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/milwaukee-bucks/milwaukee-bucks-pat-connaughton-hunter-green-75th-anniversary-authentic-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(47, 'J.Champagnie Jersey', 'Color: black, red; Raptors use this jersey in 5 years, No.11', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/toronto-raptors/toronto-raptors-justin-champagnie-red-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(48, 'M.Flynn Jersey', 'Color: black, red; Raptors use this jersey in 5 years, No.22', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/toronto-raptors/toronto-raptors-malachi-flynn-red-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(49, 'Yuta Watanabe Jersey', 'Color: black, red; Raptors use this jersey in 5 years, No.18', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/toronto-raptors/toronto-raptors-yuta-watanabe-red-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(50, 'L.Aldridge Jersey', 'Color: blue, black; New jersey of Nets, No.21', 20, 69.9, 'https://www.nbajerseyonline.net/mlb-apparels/brooklyn-nets/men-brooklyn-nets-lamarcus-aldridge-blue-city-edition-75th-anniversary-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(51, 'K.Edwards Jersey', 'Color: blue, black; New jersey of Nets, No.14', 20, 69.9, 'https://www.nbajerseyonline.net/mlb-apparels/brooklyn-nets/men-brooklyn-nets-kessler-edwards-blue-city-edition-75th-anniversary-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(52, 'Joe Harris Jersey', 'Color: blue, black; New jersey of Nets, No.12', 20, 69.9, 'https://www.nbajerseyonline.net/mlb-apparels/brooklyn-nets/men-brooklyn-nets-joe-harris-blue-city-edition-75th-anniversary-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(53, 'C.Payne Jersey', 'Color: black, orange; Suns use this jersey in 2 years, No.15', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-cameron-payne-black-2021-22-replica-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(54, 'Jae Crowder Jersey', 'Color: black, orange; Suns use this jersey in 2 years, No.99', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-jae-crowder-black-2021-22-replica-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(55, 'L.Shamet Jersey', 'Color: black, orange; Suns use this jersey in 2 years, No.14', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/phoenix-suns/phoenix-suns-landry-shamet-black-2021-22-replica-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(56, 'J.Wiseman Jersey', 'Color: black, yellow; Warriors use this jersey in 6 years, No.33', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-james-wiseman-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(57, 'J.Poole Jersey', 'Color: black, yellow; Warriors use this jersey in 6 years, No.3', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-jordan-poole-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(58, 'G.Payton II Jersey', 'Color: black, yellow; Warriors use this jersey in 6 years, No.0', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/golden-state-warriors/golden-state-warriors-gary-payton-ii-black-2021-22-city-edition-75th-anniversary-diamond-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(59, 'B.Boston Jr Jersey', 'Color: black, white; New Jersey of Clippers, No.4', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-clippers/los-angeles-clippers-brandon-boston-jr.-black-city-edition-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(60, 'N.Powell Jersey', 'Color: blue; Old Jersey of Clippers, No.24', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-clippers/los-angeles-clippers-norman-powell-blue-75th-anniversary-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(61, 'T.Mann Jersey', 'Color: black, white; New Jersey of Clippers, No.14', 20, 69.9, 'https://www.nbajerseyonline.net/images/los-angeles-clippers/men-los-angeles-clippers-black-2021-nba-playoffs-jersey-5a.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(62, 'D.Howard Jersey', 'Color: purple, white; Lakers use this jersey in 8 years, No.39', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-dwight-howard-purple-2021-22-75th-anniversary-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(63, 'D.Jordan Jersey', 'Color: purple, white; Lakers use this jersey in 8 years, No.10', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-deandre-jordan-purple-2021-22-75th-anniversary-authentic-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(64, 'S.Johnson Jersey', 'Color: purple, white; Lakers use this jersey in 8 years, No.14', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-stanley-johnson-purple-2021-22-city-edition-75th-diamond-jersey.jpg', 1) 

INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(1, 'Under Armour Embiid 1 Promotions', 'Color: black, silver, orange; It look like normal sneaker', 10, 119.9, 'https://sneakernews.com/wp-content/uploads/2020/08/joel-embiid-under-armour-shoes-1.jpg', 2)
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(2, 'Adidas Harden Stepback 2', 'Color: black, lightblue, blue, red, orange; It look like normal sneaker', 10, 149.9, 'https://cf.shopee.tw/file/b1882167a04c289267b8a74ddaa91e7a', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(1, 'Under Armour Embiid 1 Preview', 'Color: grey; Special sneaker from Embiid 1', 10, 149.9, 'https://www.prodirectbasketball.com/productimages/V3_1_Main/235892_Main_0879009.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(1, 'US Armour Embiid 1', 'Color: white, blue; Only in USA', 10, 119.9, 'https://www.efootwear.eu/media/catalog/product/cache/image/650x650//0/0/0000208465373_04_rz.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(6, 'Nike Zoom Freak 2(Giannis)', 'Color: grey, black, white; This sneaker only have big size', 15, 169.9, 'https://cdn.shopify.com/s/files/1/0562/8631/4662/products/CK5424-101_67cdd077-3cf1-403f-b4b2-a9e92060232b.jpg?v=1630915304', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(6, 'Nike Zoom Freak 1 Special(Giannis)', 'Color: Orange; Special sneaker from Freak 1 ', 10, 149.9, 'https://cf.shopee.ph/file/e749381125997f526e02374af72d2020', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(16, 'Nike KD 13 White Multicolor', 'Color: black, white and mix color; This sneaker is very long', 10, 169.9, 'https://i.pinimg.com/originals/be/d9/12/bed912b7053adf27ed8e994ba6d90850.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(16, 'Nike KD 14', 'Color: black, red; This sneaker is very speacial', 10, 149.9, 'https://www.whatproswear.com/wp-content/uploads/2021/06/kevin-durant-wearing-nike-kd-14-shoes-e1624228989654.jpeg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(16, 'Nike KD 14 Floral', 'Color: black, lightblue; This sneaker is very speacial', 10, 169.9, 'https://www.prodirectbasketball.com/productimages/V3_1_Main/240882_Main_Thumb_0887468.jpg', 2)
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(16, 'Nike KD 14 "Ky-D"', 'Color: black, red; This sneaker is very speacial; Combine with Kyrie', 10, 169.9, 'https://www.newjordans2021.com/wp-content/uploads/2021/06/Nike-KD-14-Ky-D-Black-Red-For-Sale-1.jpg', 2)
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(17, 'Nike Kyrie 7', 'Color: orange, white and mix color; It very popular in USA and it save your leg very well', 20, 149.9, 'https://www.whatproswear.com/wp-content/uploads/2021/01/kyrie-irving-wearing-nike-kyrie-7-expressions-shoes-e1609612041610.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(17, 'Nike Kyrie 7 "Ky-D"', 'Color: green and black; This sneaker is very speacial; Combine with KD', 10, 169.9, 'https://cdn.shopify.com/s/files/1/0039/0096/4953/products/194956845645_02_1024x1024.jpg?v=1622712816', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(17, 'Nike Kyrie 3 Room', 'Color: white and red; This sneaker is one of most great sneaker basketball in 2018', 20, 149.9, 'https://images.solecollector.com/complex/images/fl_lossy,q_auto/c_scale,w_690,dpr_2.0/v1/ysgfuqddmbamujlghpkq/sneaker-room-nike-kyrie-3-mom-release-date-8', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(17, 'Nike Kyrie 4', 'Color: black, green; It is popular sneaker from Kyrie', 10, 149.9, 'https://cf.shopee.vn/file/5339c8ff3e84214ba0175c53b2a05fde', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(22, 'CP3 Signature', 'Color: red, black; It is a new sneaker of CP3 in 2021', 30, 119.9, 'https://www.si.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTY4MDMxNDQ5NTkyNDQwMDgx/chris-paul-cp3xijpg.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(26, 'Under Armour Curry Two “Iron Sharpens Iron”', 'Color: Gray, black, orange; The best sneaker of "Chef" in 2020', 30, 169.9, 'https://www.kicksonfire.com/wp-content/uploads/2015/10/Under-Armour-Curry-Two.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(26, 'Under Armour Curry "Alternate Away" PE', 'Color: Gray, black, orange; The best sneaker of "Chef" in 2019', 20, 169.9, 'https://cdn.weartesters.com/wp-content/uploads/2013/12/Under-Armour-Anatomix-Spawn-Stephen-Curry-Away-PE-Detailed-Look-1.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(26, 'Under Armour Curry 8 Gold Blooded', 'Color: gold and white; The most beautiful sneaker of "Chef" in 2020', 20, 169.9, 'https://i1.adis.ws/i/hibbett/0P375_1180_right1', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(26, 'Under Armour Curry 8 Print Older Kids', 'Color: black, white and rain bow; Sneaker for kids', 30, 149.9, 'https://www.prodirectbasketball.com/productimages/V3_1_Main/224257_Main_0827479.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(27, 'Anta 2018 KT3 Light', 'Color: Lightblue, white; The third KT sneaker', 25, 149.9, 'https://www.chinasportshop.com/media/catalog/product/cache/1/thumbnail/1000x/17f82f742ffe127f42dca9de82fb58b1/k/t/kt3-light-11821166-green.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(27, 'Anta 2019 KT4', 'Color: blue, white; The fourth KT sneaker', 20, 149.9, 'https://i.pinimg.com/736x/74/24/86/74248650567540543894487883302abd.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(27, 'Anta 2017 KT2', 'Color: black, lightblue; The second KT sneaker', 20, 149.9, 'https://di2ponv0v5otw.cloudfront.net/posts/2019/09/04/5d701d948d6f1a951d171c1b/m_5d701dfc689ebc9071c39087.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(28, 'Converse G4 Draymond', 'Color: white, yellow and mix color', 25, 119.9, 'https://houseofheat.co/app/uploads/2020/04/converse-g4-low-ox-white-multi-color-167297c-release-date-info.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(28, 'Converse G4 Draymond Black', 'Color: black; The cheap sneaker from DG23', 25, 99.9, 'https://cf.shopee.ph/file/4635286dbc656872af8ab403eb878a64', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(31, 'The New Balance OMN1S "Money Stacks"(Kawhi)', 'Color: green, black; New sneaker from K.Leonard in 2021', 20, 149.9, 'https://houseofheat.co/app/uploads/2019/12/kawhi-leonard-new-balance-omn1s-money-stacks-release-date-info-2.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(32, 'Paul George 2 Special', 'Color: black, galaxy; The second sneaker of PG13', 35, 119.9, 'https://ph-test-11.slatic.net/p/9be1ae961ff8ed7da8e47f7708956adb.jpg_720x720q80.jpg_.webp', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(32, 'Paul George 5 Black Multicolor', 'Color: black, lightblue; The nineth sneaker of PG13', 35, 149.9, 'https://baskettemple.com/wp-content/uploads/2021/01/CW3143-001-PHCFH001.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(36, 'Nike LeBron 19 To Debut In "Space"', 'Color: orange; The sneaker have close boost', 20, 169.9, 'https://lebronwire.usatoday.com/wp-content/uploads/sites/37/2021/06/NikeNews_SpaceJam_NewLegacy_Footwear_Apparel_09_original.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(36, 'Nike LeBron 11', 'Color: red, black; The sneaker are very popular', 30, 149.9, 'https://cdn.weartesters.com/wp-content/uploads/2013/11/Nike-LeBron-XI-11-Away-Available-Now-1.jpg', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(36, 'Nike LeBron 8 Low V2', 'Color: mix color, red; The sneaker are very popular', 30, 149.9, 'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/b83a9261-34cb-4249-9207-3ae078adf322/lebron-8-v-2-low-shoes-K83bDn.png', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(36, 'Nike LeBron 17 White And Gold', 'Color: white and gold; Expensive sneaker from LeBron in 2019', 10, 169.9, 'https://acrossports.s3.amazonaws.com/productPhotos/NIKE/CD5006101/CD5006101_8.jpg', 2) 

INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(1, 'Embiid Model', 'It is small', 100, 19.9, 'https://i5.walmartimages.com/asr/15f89af1-a699-4b13-9e5e-04fe6783be02_1.331fa7d553408b61e2b8adc3233977cd.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(2, 'J.Harden KeyChain', 'Have model keychain and normal keychain', 100, 19.9, 'https://m.media-amazon.com/images/I/617f0xJ25KL._AC_SL1500_.jpg', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(6, 'Giannis NBA 2K19 Model', 'It look like Giannis in NBA 2K19 game', 100, 19.9, 'https://m.media-amazon.com/images/I/51q7vG6wm1L.jpg', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(6, 'Giannis Model', 'It is small and look like "The Freak"', 100, 19.9, 'https://cf.shopee.vn/file/3d29bb8326439403bede4a522072174a', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(14, 'F.Vanvleet Model', 'It is small with NBA 2019 champions', 100, 19.9, 'https://m.media-amazon.com/images/I/71xxmkNrmJL._AC_SL1500_.jpg', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(16, 'KD Jersey KeyChain', 'It is small with No.7 and signature', 40, 19.9, 'https://cdn.shopify.com/s/files/1/2030/1917/products/KDNN_2400x.jpg?v=1638508249', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(17, 'Kyrie Jersey KeyChain', 'It is small and great with No.11', 100, 19.9, 'https://cdn.shopify.com/s/files/1/2030/1917/products/KyrieNN_2400x.jpg?v=1638508360', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(26, 'Curry Jersey KeyChain', 'It is small and great with No.30', 100, 19.9, 'https://ae01.alicdn.com/kf/HTB1X7MKQCrqK1RjSZK9q6xyypXac.jpg', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(26, 'Curry Model', 'It is small and great lay-up skill', 50, 29.9, 'https://cdn.shopify.com/s/files/1/2578/8918/products/BHNBSMUFIRGSSC_p.jpg?v=1619630599', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(27, 'Klay Jersey and Model KeyChain', 'It is small and great with No.11', 100, 19.9, 'https://static3.tcdn.com.br/img/img_prod/460977/chaveiro_klay_thompson_warriors_basquete_nba_evali_90369_1_9415d3531c8206659f59518a2c8f32a7.jpg', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(31, 'K.Leonard', 'It is small and great with No.2', 100, 19.9, 'https://cdn.shopify.com/s/files/1/2578/8918/products/BHNBSMUDYDULCKL_g3_2048x.jpg?v=1613715109', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(32, 'PG13 KeyChain', 'It is normal keychain', 100, 19.9, 'https://cdn11.bigcommerce.com/s-xhmrmcecz5/images/stencil/1280x1280/products/65881/66729/Paul-George-Los-Angeles-Clippers-NBA__51283.1608102605.jpg?c=1', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(36, 'LeBron Jersey KeyChain', 'It is LeBron 10 Black', 100, 19.9, 'http://i.ebayimg.com/images/g/aD8AAOSwhURZgRGI/s-l500.jpg', 3) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(36, 'LeBron Model', 'It is small and great with No.23', 100, 19.9, 'https://cdn11.bigcommerce.com/s-ruomlrv671/images/stencil/1280x1280/products/27296/53963/medicom-nba-20-james__1__13335.1643218424.jpg?c=2', 3) 



INSERT INTO [Account] (aUsername, aPassword, aDisplayName, aAddress, aEmail, aPhone, aRole) VALUES('user', '123456', 'USER', '', '', '', 'USER')
INSERT INTO [Account] (aUsername, aPassword, aDisplayName, aAddress, aEmail, aPhone, aRole) VALUES('seller', '123456', 'SELL', '', '', '', 'USER')
INSERT INTO [Account] (aUsername, aPassword, aDisplayName, aAddress, aEmail, aPhone, aRole) VALUES('admin', '123456', 'KDIchigo', '', '', '', 'ADMIN')
INSERT INTO [Account] (aUsername, aPassword, aDisplayName, aAddress, aEmail, aPhone, aRole) VALUES('admin2', '123456', 'KDIchigo2', '', '', '', 'USER')



