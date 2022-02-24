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
	pId INT PRIMARY KEY NOT NULL,
	pName VARCHAR(255) NOT NULL,
	pDob DATE NOT NULL,
	tId INT  FOREIGN KEY(tId) REFERENCES [Team](tId) NOT NULL,
	pPosition VARCHAR(255) NOT NULL,
	pHeight VARCHAR(10) NOT NULL,
	pNo INT NOT NULL,
	pAchievement VARCHAR(255),
)

CREATE TABLE [Products] (
	proId INT PRIMARY KEY NOT NULL,
	pId INT FOREIGN KEY(pId) REFERENCES [Players](pId) NOT NULL,
	proName VARCHAR(255) NOT NULL,
	proDescription NVARCHAR(255),
	proQuantity INT NOT NULL,
	proPrice FLOAT NOT NULL,
	proImg_url NVARCHAR(255),
)

CREATE TABLE [Customer] (
	cId INT PRIMARY KEY NOT NULL,
	proId INT FOREIGN KEY(proId) REFERENCES [Products](proId) NOT NULL,
	cName VARCHAR(255) NOT NULL,
	cGmail NVARCHAR(255),
	cPhone INT NOT NULL,
	cAddress NVARCHAR(255) NOT NULL,
)

DROP TABLE [Group] 
DROP TABLE [Team] 
DROP TABLE [Players] 
DROP TABLE [Products]
DROP TABLE [Customer]


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


INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (1, 'Joel Embiid', '1994-03-16', 1, 'C', '2.13 m', 21, '5× NBA All-Star (2018–2022), 3× All-NBA Second Team (2018, 2019, 2021)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (2, 'James Harden', '1989-08-26', 1, 'SG', '1.96 m', 1, '10× NBA All-Star (2013–2022), 6× All-NBA First Team (2014, 2015, 2017–2020)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (3, 'Danny Green', '1987-06-22', 1, 'SG', '1.98 m', 14, '3× NBA champion (2014, 2019, 2020), NBA All-Defensive Second Team (2017)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (4, 'Tobias Harris', '1992-07-15', 1, 'SF', '2.01 m', 12, 'Second-team All-SEC – Coaches (2011)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (5, 'Tyrese Maxey', '2000-11-04', 1, 'PG', '1.88 m', 0, 'Second-team All-SEC (2020)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (6, 'Giannis Antetokounmpo', '1994-12-06', 2, 'PF', '2.11 m', 34, 'NBA champion (2021), NBA Finals MVP (2021), NBA All-Star Game MVP (2021)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (7, 'Khris Middleton', '1991-08-12', 2, 'SF', '2.01 m', 22, 'NBA champion (2021), 3× NBA All-Star (2019, 2020, 2022)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (8, 'Jrue Holiday', '1990-6-12', 2, 'PG', '1.91 m', 21, 'NBA champion (2021), NBA All-Star (2013)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (9, 'Bobby Portis', '1995-02-10', 2, 'PF', '2.09 m', 9, 'NBA champion (2021)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (10, 'Serge Ibaka', '1989-09-18', 2, 'PF', '2.08 m', 25, 'NBA champion (2019), 3× NBA All-Defensive First Team (2012–2014)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (11, 'Pascal Siakam', '1994-01-02', 3, 'PF', '2.03 m', 43, 'NBA champion (2019), NBA All-Star (2020)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (12, 'Scottie Barnes', '2001-08-01', 3, 'SF', '2.08 m', 4, 'Third-team All-ACC (2021)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (13, 'Khem Birch', '1992-09-28', 3, 'C', '2.06 m', 24, 'NBA D-League All-Rookie First Team (2015)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (14, 'Gary Trent Jr', '1999-01-18', 3, 'SG', '1.96 m', 33, 'McDonalds All-American (2017)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (15, 'OG Anunoby', '1997-07-17', 3, 'SF', '2.01 m', 3, 'NBA champion (2019)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (16, 'Kevin Durant', '1988-09-29', 4, 'PF', '2.08 m', 7, '2× NBA champion (2017, 2018), 2× NBA Finals MVP (2017, 2018), 12× NBA All-Star (2010–2019, 2021, 2022)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (17, 'Kyrie Irving', '1992-03-23', 4, 'PG', '1.88 m', 11, 'NBA champion (2016), 7× NBA All-Star (2013–2015, 2017–2019, 2021), NBA All-Star Game MVP (2014)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (18, 'Ben Simmons', '1996-07-20', 4, 'PG', '2.11 m', 25, 'NBA All-Star Game MVP (2014), NBA Rookie of the Year (2018)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (19, 'Seth Curry', '1990-08-23', 4, 'PG', '1.88 m', 31, '2× NBA D-League All-Star (2014, 2015)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (20, 'Blake Griffin', '1989-03-16', 4, 'PF', '2.06 m', 2, '6× NBA All-Star (2011–2015, 2019), NBA Rookie of the Year (2011)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (21, 'Devin Booker', '1996-11-30', 5, 'SG', '1.96 m', 1, '3× NBA All-Star (2020–2022), NBA Three-Point Contest champion (2018)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (22, 'Chris Paul', '1985-05-06', 5, 'PG', '1.83 m', 3, '12× NBA All-Star (2008–2016, 2020–2022), NBA All-Star Game MVP (2013)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (23, 'JaVale McGee', '1988-01-19', 5, 'C', '2.13 m', 00, '3× NBA champion (2017, 2018, 2020)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (24, 'Deandre Ayton', '1998-07-23', 5, 'C', '2.11 m', 22, 'NBA All-Rookie First Team (2019)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (25, 'Mikal Bridges', '1996-07-30', 5, 'SF', '1.98 m', 25, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (26, 'Stephen Curry', '1988-03-14', 6, 'PG', '1.88 m', 30, '3× NBA champion (2015, 2017, 2018), 8× NBA All-Star (2014–2019, 2021, 2022), NBA All-Star Game MVP (2022)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (27, 'Klay Thompson', '1990-02-08', 6, 'SG', '1.98 m', 11, '3× NBA champion (2015, 2017, 2018), 5× NBA All-Star (2015–2019)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (28, 'Draymond Green', '1990-03-04', 6, 'PF', '1.98 m', 23, '3× NBA champion (2015, 2017, 2018), 4× NBA All-Star (2016–2018, 2022), NBA Defensive Player of the Year (2017)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (29, 'Andrew Wiggins', '1995-03-23', 6, 'SF', '2.01 m', 22, 'NBA All-Star (2022), NBA Rookie of the Year (2015)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (30, 'Kevon Looney', '1996-03-06', 6, 'C', '2.06 m', 5, '2× NBA champion (2017, 2018)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (31, 'Kawhi Leonard', '1991-06-29', 7, 'SF', '2.01 m', 2, '2× NBA champion (2014, 2019), 2× NBA Finals MVP (2014, 2019), 5× NBA All-Star (2016, 2017, 2019–2021)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (32, 'Paul George', '1990-05-02', 7, 'SF', '2.03 m', 13, '7× NBA All-Star (2013, 2014, 2016–2019, 2021)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (33, 'Marcus Morris Sr', '1989-09-02', 7, 'PF', '2.03 m', 8, 'Big 12 Player of the Year (2011)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (34, 'Ivica Zubac', '1997-03-18', 7, 'C', '2.13 m', 40, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (35, 'Nicolas batum', '1988-12-14', 7, 'PF', '2.03 m', 33, '')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (36, 'Lebron James', '1984-12-30', 8, 'SF', '2.06 m ', 6, '4× NBA champion (2012, 2013, 2016, 2020), 4× NBA Finals MVP (2012, 2013, 2016, 2020), 18× NBA All-Star (2005–2022)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (37, 'Anthony Davis', '1993-03-11', 8, 'C', '2.08 m', 23, 'NBA champion (2020), 8× NBA All-Star (2014–2021), NBA All-Star Game MVP (2017)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (38, 'Russel Westbrook', '1988-11-12', 8, 'PG', '1.91 m', 0, '9× NBA All-Star (2011–2013, 2015–2020), 2× NBA All-Star Game MVP (2015, 2016)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (39, 'Carmelo Anthony', '1984-05-29', 8, 'SF', '2.01 m', 7, '10× NBA All-Star (2007, 2008, 2010–2017)')
INSERT INTO [Players] (pId, pName, pDob, tId, pPosition, pHeight, pNo, pAchievement) VALUES (40, 'Malik Monk', '1998-02-04', 8, 'SG', '1.91 m', 11, '')


INSERT INTO [Products] (proId, pId, proName, proDescription, proQuantity, proPrice, proImg_url) VALUES(1, 1, 'Embiid Jersey', '', 20, 100, 'https://images.footballfanatics.com/FFImage/thumb.aspx?i=/productimages/_2711000/altimages/ff_2711160alt1_full.jpg&w=900') 
INSERT INTO [Products] (proId, pId, proName, proDescription, proQuantity, proPrice, proImg_url) VALUES(1, 1, '', '', , , '') 












