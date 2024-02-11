-- creating the relational structure
if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_Tables

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tables

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_TestRuns

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_TestRuns

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tests

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Tests

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_Views

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)

ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Views

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[Tables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Tables]

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRunTables]

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRunViews]

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[TestRuns]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestRuns]

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[TestTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestTables]

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[TestViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [TestViews]

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[Tests]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Tests]

GO
if exists (select * from dbo.sysobjects where id = object_id(N'[Views]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)

drop table [Views]

GO
CREATE TABLE [Tables] (

	[TableID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO
CREATE TABLE [TestRunTables] (

	[TestRunID] [int] NOT NULL ,

	[TableID] [int] NOT NULL ,

	[StartAt] [datetime] NOT NULL ,

	[EndAt] [datetime] NOT NULL 

) ON [PRIMARY]

GO
CREATE TABLE [TestRunViews] (

	[TestRunID] [int] NOT NULL ,

	[ViewID] [int] NOT NULL ,

	[StartAt] [datetime] NOT NULL ,

	[EndAt] [datetime] NOT NULL 

) ON [PRIMARY]

GO
CREATE TABLE [TestRuns] (

	[TestRunID] [int] IDENTITY (1, 1) NOT NULL ,

	[Description] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,

	[StartAt] [datetime] NULL ,

	[EndAt] [datetime] NULL 

) ON [PRIMARY]

GO
--a table with a multicolumn primary key
CREATE TABLE [TestTables] (

	[TestID] [int] NOT NULL ,

	[TableID] [int] NOT NULL ,

	[NoOfRows] [int] NOT NULL ,

	[Position] [int] NOT NULL 

) ON [PRIMARY]

GO
--a table with a single-column primary key and at least one foreign key
CREATE TABLE [TestViews] (

	[TestID] [int] NOT NULL ,

	[ViewID] [int] NOT NULL 

) ON [PRIMARY]

GO
--table with a single-column primary key and no foreign keys
CREATE TABLE [Tests] (

	[TestID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO
CREATE TABLE [Views] (

	[ViewID] [int] IDENTITY (1, 1) NOT NULL ,

	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 

) ON [PRIMARY]

GO
ALTER TABLE [Tables] WITH NOCHECK ADD 

	CONSTRAINT [PK_Tables] PRIMARY KEY  CLUSTERED 

	(

		[TableID]

	)  ON [PRIMARY] 

GO
ALTER TABLE [TestRunTables] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRunTables] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID],

		[TableID]

	)  ON [PRIMARY] 

GO
ALTER TABLE [TestRunViews] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRunViews] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID],

		[ViewID]

	)  ON [PRIMARY] 

GO
ALTER TABLE [TestRuns] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestRuns] PRIMARY KEY  CLUSTERED 

	(

		[TestRunID]

	)  ON [PRIMARY] 

GO
ALTER TABLE [TestTables] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestTables] PRIMARY KEY  CLUSTERED 

	(

		[TestID],

		[TableID]

	)  ON [PRIMARY] 

GO
ALTER TABLE [TestViews] WITH NOCHECK ADD 

	CONSTRAINT [PK_TestViews] PRIMARY KEY  CLUSTERED 

	(

		[TestID],

		[ViewID]

	)  ON [PRIMARY] 

GO
ALTER TABLE [Tests] WITH NOCHECK ADD 

	CONSTRAINT [PK_Tests] PRIMARY KEY  CLUSTERED 

	(

		[TestID]

	)  ON [PRIMARY] 

GO
ALTER TABLE [Views] WITH NOCHECK ADD 

	CONSTRAINT [PK_Views] PRIMARY KEY  CLUSTERED 

	(

		[ViewID]

	)  ON [PRIMARY] 

GO
ALTER TABLE [TestRunTables] ADD 

	CONSTRAINT [FK_TestRunTables_Tables] FOREIGN KEY 

	(

		[TableID]

	) REFERENCES [Tables] (

		[TableID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestRunTables_TestRuns] FOREIGN KEY 

	(

		[TestRunID]

	) REFERENCES [TestRuns] (

		[TestRunID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO
ALTER TABLE [TestRunViews] ADD 

	CONSTRAINT [FK_TestRunViews_TestRuns] FOREIGN KEY 

	(

		[TestRunID]

	) REFERENCES [TestRuns] (

		[TestRunID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestRunViews_Views] FOREIGN KEY 

	(

		[ViewID]

	) REFERENCES [Views] (

		[ViewID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO
ALTER TABLE [TestTables] ADD 

	CONSTRAINT [FK_TestTables_Tables] FOREIGN KEY 

	(

		[TableID]

	) REFERENCES [Tables] (

		[TableID]

	) ON DELETE CASCADE  ON UPDATE CASCADE ,

	CONSTRAINT [FK_TestTables_Tests] FOREIGN KEY 

	(

		[TestID]

	) REFERENCES [Tests] (

		[TestID]

	) ON DELETE CASCADE  ON UPDATE CASCADE 

GO
ALTER TABLE [TestViews] ADD 

	CONSTRAINT [FK_TestViews_Tests] FOREIGN KEY 

	(

		[TestID]

	) REFERENCES [Tests] (

		[TestID]

	),

	CONSTRAINT [FK_TestViews_Views] FOREIGN KEY 

	(

		[ViewID]

	) REFERENCES [Views] (

		[ViewID]

	)

GO

---------------------------------
USE BiaDecor2 

GO
--a view with a SELECT statement operating on one table
CREATE OR ALTER VIEW ViewOneTable
AS
	SELECT * FROM Magazine
GO

--a view with a SELECT statement that operates on at least 2 different tables and contains at least one JOIN operator
CREATE OR ALTER VIEW ViewTwoTables
AS
	--show the list of the clients and their orders
	SELECT
    c.Nume AS Nume,
    c.Tel AS NrTel,
    co.Item,
    co.Valoare,
    co.PayMethod
	FROM
		Clienti c
	LEFT JOIN
		Comenzi co ON c.ComenziClientiID = co.ComenziID;
GO
--a view with a SELECT statement that has a GROUP BY clause, operates on at least 2 different tables and contains at least one JOIN operator
--afiseaza numele clientilor si numarul de comenzi pe care acestia le-au plasat
CREATE OR ALTER VIEW ViewGroupBy
AS
	SELECT C.Nume AS Nume, COUNT(Co.ComenziID) AS Numar_de_comenzi
	FROM Clienti C
	JOIN Comenzi Co ON C.ComenziClientiID = Co.ComenziID
	GROUP BY C.Nume;
GO

CREATE OR ALTER PROCEDURE delete_table
	@no_of_rows INT,
	@table_name VARCHAR(30)
AS
BEGIN
	DECLARE @last_row INT

	IF @table_name='Magazine'
	BEGIN
	IF (SELECT COUNT(*) FROM Magazine)<@no_of_rows
	BEGIN
		PRINT ('Too many rows to delete')
		RETURN 1
	END
	ELSE
	BEGIN
		SET @last_row = (SELECT MAX(MagazineID) FROM Magazine) - @no_of_rows
		DELETE FROM Magazine
		WHERE MagazineID>@last_row
	END
	END

	ELSE IF @table_name='Comezni'
	BEGIN
	IF (SELECT COUNT(*) FROM Comenzi)<@no_of_rows
	BEGIN
		PRINT ('Too many rows to delete')
		RETURN 1
	END
	ELSE
	BEGIN
		SET @last_row = (SELECT MAX(ComenziID) FROM Comenzi) - @no_of_rows

		DELETE FROM Comenzi
		WHERE ComenziID>@last_row
	END
	END

	ELSE IF @table_name='Angajati'
	BEGIN
	IF (SELECT COUNT(*) FROM Angajati)<@no_of_rows
	BEGIN
		PRINT ('Too many rows to delete')
		RETURN 1
	END
	ELSE
	BEGIN
		SET @last_row = (SELECT MAX(AngajatID) FROM Angajati) - @no_of_rows

		DELETE FROM Angajati
		WHERE AngajatID>@last_row
	END
	END

	ELSE IF @table_name='Clienti'
	BEGIN	
	IF (SELECT COUNT(*) FROM Clienti)<@no_of_rows
	BEGIN
		PRINT ('Too many rows to delete')
		RETURN 1
	END

	ELSE
	BEGIN
		DELETE FROM Clienti
		WHERE ClientiID>=@no_of_rows
	
	END
	END

	ELSE
	BEGIN
		PRINT('Not a valid table name')
		RETURN 1
	END
END
GO

CREATE OR ALTER PROCEDURE insert_table
	@no_of_rows INT,
	@table_name VARCHAR(30)
AS
BEGIN
	DECLARE @input_id INT
	DECLARE @maxId INT
	SET @maxId = ISNULL((SELECT MAX(MagazineID) FROM Magazine), 0)
	DECLARE @maxId1 INT
	SET @maxId1 = ISNULL((SELECT MAX(ComenziID) FROM Comenzi), 0)
	DECLARE @maxId2 INT
	SET @maxId2 = ISNULL((SELECT MAX(ClientiID) FROM Clienti), 0)
	DECLARE @maxId3 INT
	SET @maxId3 = ISNULL((SELECT MAX(AngajatID) FROM Angajati), 0)
	IF @table_name='Magazine'
	BEGIN
		SET @input_id = @maxId+1
		WHILE @no_of_rows > 0
		BEGIN
			INSERT INTO Magazine(MagazineID,Nume,Strada) VALUES(@input_id,'BiaDecor','Cal. Aradului')
			SET @input_id=@input_id+1
			SET @no_of_rows=@no_of_rows-1
		END
	END

	ELSE IF @table_name='Comezni'
	BEGIN
		SET @input_id = @maxId1+1
		WHILE @no_of_rows > 0
		BEGIN
			INSERT INTO Comenzi(ComenziID,Item,Valoare,PayMethod) VALUES(@input_id,'Perdea',100,'cash')

			SET @input_id=@input_id+1
			SET @no_of_rows=@no_of_rows-1
			PRINT 'Inserted into Comenzi. Rows affected: ' + CAST(@no_of_rows AS NVARCHAR(10))
		END
	END

	ELSE IF @table_name='Clienti'
	BEGIN
		SET @input_id = @maxId2 + 1;

		DECLARE @fk1 INT
		SET @fk1 = (SELECT TOP 1 AngajatID FROM Angajati);

		DECLARE @fk2 INT
		SET @fk2 = (SELECT TOP 1 ComenziID FROM Comenzi);

		WHILE @no_of_rows > 0
		BEGIN
			INSERT INTO Clienti(ClientiID, ClientiAngajatiID, ComenziClientiID, Nume, Tel)
			VALUES (@input_id, @fk1, @fk2, 'Ion Popa', '0770222222');

			SET @input_id = @input_id + 1;
			SET @no_of_rows = @no_of_rows - 1;
		END
	END

	ELSE IF @table_name='Angajati'
	BEGIN
	SET @input_id = @maxId3+1
	PRINT(@input_id)
	DECLARE @fk INT
	SET @fk=(SELECT TOP 1 MagazineID FROM Magazine)
		WHILE @no_of_rows > 0
		BEGIN
			INSERT INTO Angajati(AngajatID,MagazinID,Nume,Experienta) VALUES(@input_id,@fk,'Ana Maria',5)

			SET @input_id = @input_id+1
			SET @no_of_rows=@no_of_rows-1
			
			PRINT(@input_id)

		END
	END

	ELSE
	BEGIN
		PRINT('Not a valid table name')
		RETURN 1
	END
END
GO

CREATE OR ALTER PROCEDURE select_view
	@view_name VARCHAR(30)
AS
BEGIN
	IF @view_name='ViewOneTable'
	BEGIN 
		SELECT * FROM ViewOneTable
	END

	ELSE IF @view_name='ViewTwoTables'
	BEGIN 
		SELECT * FROM ViewTwoTables
	END

	ELSE IF @view_name='ViewGroupBy'
	BEGIN 
		SELECT * FROM ViewGroupBy
	END

	ELSE
	BEGIN 
		PRINT('Not a valid view name')
		RETURN 1
	END
END
GO

DELETE FROM Tables
INSERT INTO Tables VALUES ('Magazine'),('Comezni'),('Angajati'),('Clienti')
GO

DELETE FROM Views
INSERT INTO Views VALUES ('ViewOneTable'),('ViewTwoTables'),('ViewGroupBy')
GO

DELETE FROM Tests
INSERT INTO Tests VALUES ('test_10'),('test_100'),('test_1000'),('test_5000')
GO

DELETE FROM TestViews
INSERT INTO TestViews(TestID,ViewID) VALUES (1,1)
INSERT INTO TestViews(TestID,ViewID) VALUES (1,2)
INSERT INTO TestViews(TestID,ViewID) VALUES (1,3)
INSERT INTO TestViews(TestID,ViewID) VALUES (2,1)
INSERT INTO TestViews(TestID,ViewID) VALUES (2,2)
INSERT INTO TestViews(TestID,ViewID) VALUES (2,3)
INSERT INTO TestViews(TestID,ViewID) VALUES (3,1)
INSERT INTO TestViews(TestID,ViewID) VALUES (3,2)
INSERT INTO TestViews(TestID,ViewID) VALUES (3,3)
INSERT INTO TestViews(TestID,ViewID) VALUES (4,1)
INSERT INTO TestViews(TestID,ViewID) VALUES (4,2)
INSERT INTO TestViews(TestID,ViewID) VALUES (4,3)
GO

DELETE FROM TestTables
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (1,1,10,1)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (1,2,10,2)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (1,3,10,3)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (1,4,10,4)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (2,1,100,1)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (2,2,100,2)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (2,3,100,3)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (2,4,100,4)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (3,1,1000,1)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (3,2,1000,2)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (3,3,1000,3)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (3,4,1000,4)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (4,1,5000,1)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (4,2,5000,2)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (4,3,5000,3)
INSERT INTO TestTables(TestId, TableID, NoOfRows, Position) VALUES (4,4,5000,4)

GO

DELETE FROM TestRuns
DELETE FROM TestRunTables
DELETE FROM TestRunViews
GO


CREATE OR ALTER PROCEDURE mainTest
	@testID INT
AS
BEGIN
	-- Insert a new row into the TestRuns table with the current date and time
	INSERT INTO TestRuns VALUES ((SELECT Name FROM Tests WHERE TestID=@testID), GETDATE(), GETDATE())

	-- Retrieve the latest TestRunID from the TestRuns table
	DECLARE @testRunID INT
	SET @testRunID = (SELECT MAX(TestRunID) FROM TestRuns)

	-- Declare variables for cursor-based operations
	DECLARE @noOfRows INT
	DECLARE @tableID INT
	DECLARE @tableName VARCHAR(30)
	DECLARE @startAt DATETIME
	DECLARE @endAt DATETIME
	DECLARE @viewID INT
	DECLARE @viewName VARCHAR(30)

	-- Cursor for deleting rows from tables based on TestTables data
	DECLARE testDeleteCursor CURSOR FOR
		SELECT TableID, NoOfRows
		FROM TestTables
		WHERE TestID = @testID
		ORDER BY Position DESC

	-- Open the delete cursor
	OPEN testDeleteCursor

	-- Fetch the first row from the delete cursor
	FETCH NEXT FROM testDeleteCursor INTO @tableID, @noOfRows

	-- Loop through rows and execute delete_table procedure
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @tableName = (SELECT Name FROM Tables WHERE TableID = @tableID)
		EXEC delete_table @noOfRows, @tableName

		-- Fetch the next row
		FETCH NEXT FROM testDeleteCursor INTO @tableID, @noOfRows
	END

	-- Close and deallocate the delete cursor
	CLOSE testDeleteCursor
	DEALLOCATE testDeleteCursor

	-- Cursor for inserting rows into tables based on TestTables data
	DECLARE testInsertCursor CURSOR FOR
		SELECT TableID, NoOfRows
		FROM TestTables
		WHERE TestID = @testID
		ORDER BY Position ASC

	-- Open the insert cursor
	OPEN testInsertCursor

	-- Fetch the first row from the insert cursor
	FETCH NEXT FROM testInsertCursor INTO @tableID, @noOfRows

	-- Loop through rows and execute insert_table procedure
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @tableName = (SELECT Name FROM Tables WHERE TableID = @tableID)
		SET @startAt = GETDATE()
		EXEC insert_table @noOfRows, @tableName
		SET @endAt = GETDATE()

		-- Insert into TestRunTables with timing information
		INSERT INTO TestRunTables VALUES (@testRunID, @tableID, @startAt, @endAt)

		-- Fetch the next row
		FETCH NEXT FROM testInsertCursor INTO @tableID, @noOfRows
	END

	-- Close and deallocate the insert cursor
	CLOSE testInsertCursor
	DEALLOCATE testInsertCursor

	-- Cursor for executing views based on TestViews data
	DECLARE testViewCursor CURSOR FOR
		SELECT ViewID
		FROM TestViews
		WHERE TestID = @testID

	-- Open the view cursor
	OPEN testViewCursor

	-- Fetch the first row from the view cursor
	FETCH NEXT FROM testViewCursor INTO @viewID

	-- Loop through rows and execute select_view procedure
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @viewName = (SELECT Name FROM Views WHERE ViewID = @viewID)
		SET @startAt = GETDATE()
		EXEC select_view @viewName
		SET @endAt = GETDATE()

		-- Insert into TestRunViews with timing information
		INSERT INTO TestRunViews VALUES (@testRunID, @viewID, @startAt, @endAt)

		-- Fetch the next row
		FETCH NEXT FROM testViewCursor INTO @viewID
	END

	-- Close and deallocate the view cursor
	CLOSE testViewCursor
	DEALLOCATE testViewCursor

	-- Update the EndAt column in TestRuns table with the current date and time
	UPDATE TestRuns
	SET EndAt = GETDATE()
	WHERE TestRunID = @testRunID
END
GO

EXEC mainTest 1
EXEC mainTest 2
EXEC mainTest 3
EXEC mainTest 4
SELECT * FROM Tests
SELECT * FROM Tables
SELECT * FROM TestTables
SELECT * FROM Views 
SELECT * FROM TestViews 
ALTER TABLE TestRuns
ADD DurationInSeconds AS DATEDIFF(MILLISECOND, StartAt, EndAt) / 1000.0;
ALTER TABLE TestRunTables
ADD DurationInSeconds AS DATEDIFF(MILLISECOND, StartAt, EndAt) / 1000.0;
ALTER TABLE TestRunViews
ADD DurationInSeconds AS DATEDIFF(MILLISECOND, StartAt, EndAt) / 1000.0;
SELECT * FROM TestRuns
SELECT * FROM TestRunTables 
SELECT * FROM TestRunViews





