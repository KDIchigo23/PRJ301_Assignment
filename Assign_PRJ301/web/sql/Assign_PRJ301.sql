CREATE DATABASE Assign_PRJ301
GO

USE Assign_PRJ301
GO

CREATE TABLE [Group] (
	gId INT PRIMARY KEY NOT NULL,
	gName VARCHAR(20) NOT NULL,
)

CREATE TABLE [Team] (
	tId INT PRIMARY KEY NOT NULL,
	tName VARCHAR(255) NOT NULL,
	gId INT  FOREIGN KEY(gId) REFERENCES [Group](gId) NOT NULL,
)

CREATE TABLE [Players] (
	pId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	pName VARCHAR(255) NOT NULL,
	pDob DATE NOT NULL,
	tId INT FOREIGN KEY(tId) REFERENCES [Team](tId) NOT NULL,
	pPosition VARCHAR(255) NOT NULL,
	pHeight VARCHAR(10) NOT NULL,
	pNo INT NOT NULL,
	pAchievement VARCHAR(255),
	pImg_url VARCHAR(2000)
)

CREATE TABLE [AllStar_Players_2022] (
	apId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	apName VARCHAR(255) NOT NULL,
	pId INT FOREIGN KEY(pId) REFERENCES [Players](pId) NOT NULL,
	tId INT FOREIGN KEY(tId) REFERENCES [Team](tId) NOT NULL,
	apGroup VARCHAR(255) NOT NULL,
	apPTS INT,
	apRules VARCHAR(255) NOT NULL,
	apImg_url NVARCHAR(2000),
)

CREATE TABLE [Category] (
	ctId INT PRIMARY KEY NOT NULL,
	ctName VARCHAR(255) NOT NULL,
)

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


CREATE TABLE [Customer] (
	cId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	proId INT FOREIGN KEY(proId) REFERENCES [Products](proId) NOT NULL,
	cName VARCHAR(255) NOT NULL,
	cGmail NVARCHAR(255),
	cPhone INT NOT NULL,
	cAddress NVARCHAR(255) NOT NULL,
)

DROP TABLE [AllStar_Players_2022]
DROP TABLE [Customer]
DROP TABLE [Products]
DROP TABLE [Category]
DROP TABLE [Players] 
DROP TABLE [Team]
DROP TABLE [Group] 


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


INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url) VALUES ('Lebron James', 36, 8, 'Team Lebron', 24, 'Captain', 'https://scontent.fhan5-11.fna.fbcdn.net/v/t39.30808-6/274456867_10160322831353463_3430395174282502551_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=730e14&_nc_ohc=3kU9gjhZOTkAX95zKOM&_nc_ht=scontent.fhan5-11.fna&oh=00_AT9mN9ajP-RJ43YGtCcvPEo7SBZ5pQRpQiop-nzBzu8dZg&oe=621F4A89')
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url) VALUES ('Stephen Curry', 26, 6, 'Team Lebron', 50, 'Member', 'https://scontent.fhan5-10.fna.fbcdn.net/v/t39.30808-6/274293785_10160322831233463_8832305123412676471_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_ohc=1magQnydw3oAX9RIJIj&_nc_ht=scontent.fhan5-10.fna&oh=00_AT-amsKTBih5aEcI-2QyELSozaUqKmpEzzC_jEGsUonZGw&oe=621E66E9') 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url) VALUES ('Giannis Antetokounmpo', 6, 2, 'Team Lebron', 30, 'Member', 'https://scontent.fhan5-10.fna.fbcdn.net/v/t39.30808-6/274135992_10160322831578463_7852897392032086785_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=730e14&_nc_ohc=RZZPcPFOCOUAX_F1oAp&_nc_ht=scontent.fhan5-10.fna&oh=00_AT8s_5WhNrkR9EfzYLri6k2YA74g5QFMhgRMXc6zCtoSsQ&oe=621F406D') 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url) VALUES ('Chris Paul', 22, 5, 'Team Lebron', 15, 'Member', 'https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-6/274511251_10160322831753463_3395540021795941153_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=730e14&_nc_ohc=ANvtb9Ty8U0AX_fmele&_nc_ht=scontent.fhan5-8.fna&oh=00_AT9uDnIWG2NRPLZouWgkJ-DosmbHf2WrAb8PvKc5xkIAFQ&oe=621FA926') 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url) VALUES ('Fred Vanvleet', 14, 3, 'Team Lebron', 6, 'Member', 'https://scontent.fhan5-10.fna.fbcdn.net/v/t39.30808-6/274168128_10160322831613463_4759881951765837725_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=730e14&_nc_ohc=zSWuQX_gvoEAX-kTZkf&tn=7UGqLqlll5cu7aev&_nc_ht=scontent.fhan5-10.fna&oh=00_AT-zMTyGKB4_onc82Z52oEOGUgy4f3rX7rGRmf5EZSRZsA&oe=621FCA87') 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url) VALUES ('Draymond Green', 28, 6, 'Team Durant', 18, 'Member', 'https://scontent.fhan5-5.fna.fbcdn.net/v/t39.30808-6/274357408_10160322821958463_8456763819693951292_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=730e14&_nc_ohc=FZeu_aaiCW4AX-T2qwc&_nc_ht=scontent.fhan5-5.fna&oh=00_AT_Go1u9oZgHIVO4aYf_CQ9yGqaYrb4iDSjD9l6K6UZLcA&oe=621F4E5B') 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url) VALUES ('Andrew Wiggins', 29, 6, 'Team Durant', 10, 'Member', 'https://scontent.fhan5-9.fna.fbcdn.net/v/t39.30808-6/274484067_10160322822098463_4878907513132599878_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=730e14&_nc_ohc=yeoqq4ZrYIMAX-AtS_t&_nc_ht=scontent.fhan5-9.fna&oh=00_AT-cq3W5oemYL0YN-QG-lMCLXNQOhlpiafOL8EpogTma8Q&oe=622030A2') 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url) VALUES ('Joel Embiid', 1, 1, 'Team Durant', 36, 'Member', 'https://scontent.fhan5-11.fna.fbcdn.net/v/t39.30808-6/274255024_10160322821818463_3825793604694774878_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=730e14&_nc_ohc=hAeMotIqEiUAX8Txdd5&_nc_ht=scontent.fhan5-11.fna&oh=00_AT9A3JtKeuHVivWKeg3WPtVCO2pMPEfoznt8-ZCW_BIS2Q&oe=621F26E3') 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url) VALUES ('Devin Booker', 21, 5, 'Team Durant', 20, 'Member', 'https://scontent.fhan5-10.fna.fbcdn.net/v/t39.30808-6/274157113_10160322822013463_9089127324548096246_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=730e14&_nc_ohc=8AM3jK8kyhsAX_74kmS&tn=7UGqLqlll5cu7aev&_nc_ht=scontent.fhan5-10.fna&oh=00_AT_zJuMtItYrlHkt84xAPe_qT4QtKZFVH7kRwn01fgnfXg&oe=621FAF4D') 
INSERT INTO [AllStar_Players_2022] (apName, pId, tId, apGroup, apPTS, apRules, apImg_url) VALUES ('Khris Middleton', 7, 2, 'Team Durant', 5, 'Member', 'https://scontent.fhan5-10.fna.fbcdn.net/v/t39.30808-6/274192619_10160322821733463_8774283708214930569_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=730e14&_nc_ohc=VMQ1ZB8CEBAAX9rgnNw&_nc_ht=scontent.fhan5-10.fna&oh=00_AT-QMaDldJ26iKn7OBh1_RGQH1LR3tkY1LWQyAHnYO6KWw&oe=621FEAD4') 
 
 
INSERT INTO [Category] (ctId, ctName) VALUES (1, 'Jersey')
INSERT INTO [Category] (ctId, ctName) VALUES (2, 'Sneaker')
INSERT INTO [Category] (ctId, ctName) VALUES (3, 'Item')


INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(1, 'Embiid Jersey', 'Color: blue, white; Philadelphia use this jersey in 12 years, No.21', 10, 89.9, 'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-joel-embiid-royal-2021-22-75th-anniversary-diamond-icon-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(2, 'J.Harden Jersey', 'Color: blue, white; Philadelphia use this jersey in 12 years, No.1', 20, 89.9, 'https://www.nbajerseyonline.net/nba-apparels/philadelphia-76ers/philadelphia-76ers-james-harden-blue-icon-edition-2022-trade-jersey.jpg', 1) 
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
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(38, 'Russel Westbrook Jersey', 'Color: purple, white; Lakers use this jersey in 8 years, No.0', 15, 79.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-russell-westbrook-purple-2021-22-75th-anniversary-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(39, 'Carmelo Anthony Jersey', 'Color: purple, white; Lakers use this jersey in 8 years, No.7', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-anthony-davis-purple-2021-22-75th-anniversary-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(40, 'Malik Monk Jersey', 'Color: purple, white; Lakers use this jersey in 8 years, No.11', 20, 69.9, 'https://www.nbajerseyonline.net/nba-apparels/los-angeles-lakers/los-angeles-lakers-malik-monk-purple-2021-22-75th-anniversary-city-jersey.jpg', 1) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(1, 'Under Armour Embiid 1 Promotions', 'Color: black, silver, orange; It look like normal sneaker', 10, 119.9, 'https://sneakernews.com/wp-content/uploads/2020/08/joel-embiid-under-armour-shoes-1.jpg', 2)
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(2, 'Adidas Harden Stepback 2', 'Color: black, lightblue, blue, red, orange; It look like normal sneaker', 10, 149.8, 'https://cf.shopee.tw/file/b1882167a04c289267b8a74ddaa91e7a', 2) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(3, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(4, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(5, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(6, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(7, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(8, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(9, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(10, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(11, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(12, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(13, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(14, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(15, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(15, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(17, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(18, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(19, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(20, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(21, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(22, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(23, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(24, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(25, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(26, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(27, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(28, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(29, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(30, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(31, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(32, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(33, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(34, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(35, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(36, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(37, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(38, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(39, '', '', , , '', ) 
INSERT INTO [Products] (pId, proName, proDescription, proQuantity, proPrice, proImg_url, ctId) VALUES(40, '', '', , , '', ) 














