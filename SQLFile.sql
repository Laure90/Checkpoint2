CREATE DATABASE Checkpoint2
GO

USE Checkpoint2
GO

CREATE TABLE Courses (
	ID_Course INT PRIMARY KEY IDENTITY (1,1),
	CourseName VARCHAR(50) NOT NULL
	);
GO

CREATE TABLE Expeditions (
	ID_Expedition INT PRIMARY KEY IDENTITY (1,1),
	ExpeditionName VARCHAR(80) NOT NULL,
	FK_ID_Course INT FOREIGN KEY (FK_ID_Course) REFERENCES Courses(ID_Course)
	);
GO

CREATE TABLE Quests (
	ID_Quest INT PRIMARY KEY IDENTITY (1,1),
	QuestName VARCHAR(80) NOT NULL,
	FK_ID_Expedition INT FOREIGN KEY (FK_ID_Expedition) REFERENCES Expeditions(ID_Expedition)
	);
GO

CREATE TABLE Agenda_LeadTrainer (
	ID_Agenda_Lead INT PRIMARY KEY IDENTITY (1,1),
	EventName VARCHAR(60) NOT NULL,
	DescriptionEvent VARCHAR (270),
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL
	);

CREATE TABLE Agenda_Trainer (
	ID_Agenda_Trainer INT PRIMARY KEY IDENTITY (1,1),
	EventName VARCHAR(60) NOT NULL,
	DescriptionEvent VARCHAR (270),
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL
	);
CREATE TABLE Agenda_Students (
	ID_Agenda_Student INT PRIMARY KEY IDENTITY (1,1),
	EventName VARCHAR(60) NOT NULL,
	DescriptionEvent VARCHAR (270),
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL
	);

CREATE TABLE LeadTrainer (
	ID_leadTrainer INT PRIMARY KEY IDENTITY (1,1),
	LeadTrainerName VARCHAR(50) NOT NULL,
	FK_ID_Course INT FOREIGN KEY (FK_ID_Course) REFERENCES Courses(ID_Course),
	FK_ID_Agenda_Lead INT FOREIGN KEY (FK_ID_Agenda_Lead) REFERENCES Agenda_LeadTrainer(ID_Agenda_Lead)
	);
GO

CREATE TABLE Trainers (
	ID_Trainer INT PRIMARY KEY IDENTITY (1,1),
	TrainerName VARCHAR(50) NOT NULL,
	FK_ID_leadTrainer INT FOREIGN KEY (FK_ID_leadTrainer) REFERENCES LeadTrainer(ID_leadTrainer),
	FK_ID_Course INT FOREIGN KEY (FK_ID_Course) REFERENCES Courses(ID_Course),
	FK_ID_Agenda_Trainer INT FOREIGN KEY (FK_ID_Agenda_Trainer) REFERENCES Agenda_Trainer(ID_Agenda_Trainer)
	);
GO

CREATE TABLE Students (
	ID_Student INT PRIMARY KEY IDENTITY (1,1),
	StudentName VARCHAR(50) NOT NULL,
	FK_ID_Trainer INT FOREIGN KEY (FK_ID_Trainer) REFERENCES Trainers(ID_Trainer),
	FK_ID_Course INT FOREIGN KEY (FK_ID_Course) REFERENCES Courses(ID_Course),
	FK_ID_Agenda_Student INT FOREIGN KEY (FK_ID_Agenda_Student) REFERENCES Agenda_Students(ID_Agenda_Student)
	);
GO


USE Checkpoint2
GO

INSERT INTO Courses (CourseName) VALUES ('PHP'), ('C#')
GO

INSERT INTO Agenda_LeadTrainer (EventName, DescriptionEvent, StartDate, EndDate) VALUES ('PHP', 'Begin the PHP session', '20200302', '20200831'),
																					('CSharp', 'Begin the CSharp session', '20191209', '20200507')
GO

INSERT INTO Agenda_Trainer (EventName, DescriptionEvent, StartDate, EndDate) VALUES ('PHP', 'Begin the PHP session', '20200302', '20200831'),
																					('CSharp', 'Begin the CSharp session', '20191209', '20200507')
GO

INSERT INTO Agenda_Students (EventName, DescriptionEvent, StartDate, EndDate) VALUES ('First day PHP', 'Begin the first day of PHP session', '20200302', '20200831'),
																					('First day CSharp', 'Begin the first day of CSharp session', '20191209', '20200507')
GO

INSERT INTO LeadTrainer (LeadTrainerName, FK_ID_Course, FK_ID_Agenda_Lead) VALUES ('Bob', 1, 1),
																				('Jane', 2, 2)
GO

INSERT INTO Trainers (TrainerName, FK_ID_Course, FK_ID_Agenda_Trainer) VALUES ('Bobby', 1, 1),
																		('Robert', 1,1),
																		('Jeny', 2,2),
																		('Jeanne', 2,2)
GO

INSERT INTO Students (StudentName, FK_ID_Course, FK_ID_Trainer, FK_ID_Agenda_Student) VALUES ('John', 1, 2, 1),
																					('Jane', 1,2,1),
																					('John', 1, 2, 1),
																					('Jane', 1,2,1),
																					('John', 2, 4, 2),
																					('Jane', 2, 4, 2),
																					('Jane', 2, 4, 2)
GO

INSERT INTO Expeditions (ExpeditionName, FK_ID_Course) VALUES ('Html and CSS', 1), ('PHP', 1), ('POO', 2)
GO

INSERT INTO Quests (QuestName, FK_ID_Expedition) VALUES ('quest1', 1), ('quest2', 1),
														('quest1', 2), ('quest2', 2),
														('quest3', 2), ('quest4', 2),
														('quest1', 3), ('quest2', 3),
														('quest3', 3)
GO

DROP PROCEDURE IF EXISTS sp_GetStudentList
GO

CREATE PROCEDURE sp_GetStudentList
	@TrainerName VARCHAR(50),
	@StudentList VARCHAR(50) OUTPUT
   AS
DECLARE @StudentID INT
DECLARE Students_Cursor CURSOR SCROLL FOR
	SELECT ID_Student FROM Students
OPEN Students_Cursor
FETCH FIRST FROM Students_Cursor INTO @StudentID
WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT Students.StudentName FROM Students INNER JOIN Trainers ON Trainers.ID_Trainer = Students.FK_ID_Trainer
		WHERE Trainers.TrainerName = @TrainerName
		FETCH NEXT FROM Students_Cursor INTO @StudentID
	END
CLOSE Students_Cursor
DEALLOCATE Students_Cursor

DECLARE @ListOfTrainer VARCHAR(50)
EXECUTE sp_GetStudentList 
		@TrainerName = 'Bobby',
		@StudentList = @ListOfTrainer OUTPUT
PRINT @ListOfTrainer
GO