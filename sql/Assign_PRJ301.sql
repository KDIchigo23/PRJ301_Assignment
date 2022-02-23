CREATE DATABASE Assign_PRJ301
GO

USE Assign_PRJ301
GO

CREATE TABLE [Group] (
	gId INT PRIMARY KEY,
	gName VARCHAR(20),
)

CREATE TABLE [Team] (
	tId INT PRIMARY KEY,
	tName VARCHAR(255),
	gId INT
)

CREATE TABLE [Players] (
	pId INT PRIMARY KEY,
	tId INT,
	pName VARCHAR(255),
	pPosition VARCHAR(255),
	pHeight VARCHAR(10),
	pNo INT,
	pDob DATE,
	pAchievement VARCHAR(255),
	
)

CREATE TABLE [Products] (
	proId INT PRIMARY KEY,
	proName VARCHAR(255),
	proQuantity INT,
	proPrice FLOAT,
	proImg_url NVARCHAR(255),
	
)

CREATE [Customer] (
	cId INT PRIMARY KEY,
	proId INT,
	cName VARCHAR(255),
	cGmail NVARCHAR(255),
	cPhone INT,
	cAddress NVARCHAR(255),
)

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


INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (1, 'Joel Embiid', '16/03/1994', 1, 'Center', '2.13 m', 21, '5× NBA All-Star (2018–2022), 3× All-NBA Second Team (2018, 2019, 2021)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (2, 'James Harden', '', 1, '', '', 13, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (3, 'Danny Green', '', 1, '', '', 14, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (4, 'Tobias Harris', '', 1, '', '', 12, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (5, 'Tyrese Maxey', '', 1, '', '', 0, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (6, 'Giannis Antetokounmpo', '', 2, '', '', 34, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (7, 'Khris Middleton', '', 2, '', '', 22, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (8, 'Jrue Holiday', '', 2, '', '', 21, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (9, 'Bobby Portis', '', 2, '', '', 9, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (10, 'Serge Ibaka', '', 2, '', '', 25, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (11, 'Pascal Siakam', '', 3, '', '', 43, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (12, 'Scottie Barnes', '', 3, '', '', 4, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (13, 'Khem Birch', '', 3, '', '', 24, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (14, 'Gary Trent Jr', '', 3, '', '', 33, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (15, 'OG Anunoby', '', 3, '', '', 3, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (16, 'Kevin Durant', '', 4, '', '', 7, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (17, 'Kyrie Irving', '', 4, '', '', 11, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (18, 'Ben Simmons', '', 4, '', '', 25, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (19, 'Seth Curry', '', 4, '', '', 31, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (20, 'Blake Griffin', '', 4, '', '', 2, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (21, 'Devin Booker', '', 5, '', '', 1, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (22, 'Cris Paul', '', 5, '', '', 3, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (23, 'JaVale McGee', '', 5, '', '', 00, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (24, 'Deandre Ayton', '', 5, '', '', 22, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (25, 'Mikal Bridges', '', 5, '', '', 25, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (26, 'Stephen Curry', '', 6, '', '', 30, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (27, 'Klay Thompson', '', 6, '', '', 11, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (28, 'Draymond Green', '', 6, '', '', 23, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (29, 'Andrew Wiggins', '', 6, '', '', 22, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (30, 'Kevon Looney', '', 6, '', '', 5, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (31, 'Kawhi Leonard', '', 7, '', '', 2, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (32, 'Paul George', '', 7, '', '', 13, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (33, 'Marcus Morris Sr', '', 7, '', '', 8, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (34, 'Ivica Zubac', '', 7, '', '', 40, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (35, 'Nicolas batum', '', 7, '', '', 33, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (36, 'Lebron James', '', 8, '', '', 6, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (37, 'Anthony Davis', '', 8, '', '', 23, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (38, 'Russel Westbrook', '', 8, '', '', 0, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (39, 'Carmelo Anthony', '', 8, '', '', 7, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (40, 'Malik Monk', '', 8, '', '', 11, '')











