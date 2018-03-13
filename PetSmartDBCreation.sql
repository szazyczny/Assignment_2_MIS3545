﻿-- Assignment 2 PetSmart DB - Pat Carney, Eddie Lehr, and Sarah Zazyczny

CREATE DATABASE PetSmartDb;
GO

USE PetSmartDb;
GO

-- Create product table


-- Create product category table


-- Create product subcategory table


-- Create pet category table


-- Create pet subcategory table


-- Create customer table


-- Create sales order detail table


-- Create sales territory table


-- Create sales employees table


-- Create contact table



-- Create the customer and order tables
CREATE TABLE Student(
  StudentID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL);

CREATE TABLE Course(
  CourseID bigint NOT NULL PRIMARY KEY,
  CourseTitle varchar(50) NOT NULL,
  Instuctor varchar(50) NOT NULL);

CREATE TABLE CourseEnrollment(
  EnrollmentID bigint NOT NULL PRIMARY KEY,
  StudentID bigint NOT NULL,
  CourseID bigint NOT NULL,
  Grade float NOT NULL);

-- Create the relationship: the first FK in CourseEnrollment
ALTER TABLE CourseEnrollment ADD CONSTRAINT FK_CourseEnrollment_Student 
FOREIGN KEY (StudentID) REFERENCES Student(StudentID);
GO

-- We will use designer view to create another relationship: the second FK in CourseEnrollment


-- Add a few students
INSERT INTO Student (StudentID, FirstName, LastName) VALUES 
(1, 'Yinmeng', 'Tian'),
(2, 'Samuel', 'Gaudet'),
(3, 'Anthony', 'Krichevskiy'),
(4, 'Christian', 'Thompson'),
(5, 'Sang Won', 'Baek'),
(6, 'Matthew', 'Michalke'),
(7, 'Jonathan', 'Marchetti'),
(8, 'Edward', 'Lehr'),
(9, 'Patrick', 'Carney'),
(10, 'Emma', 'Sewell');


-- Add a few courses
INSERT INTO Course(CourseID, CourseTitle, Instuctor) VALUES 
(1, 'MIS3545-BUSINESS INTELLIGENCE AND DATA ANALYTICS', 'Zhi'),
(2, 'MIS3690-WEB TECHNOLOGIES', 'Shankar'),
(3, 'QTM3000-CASE STUDIES IN BUSINESS ANALYTICS', 'Nathan'),
(4, 'QTM3625-FINANCIAL SIMULATION', 'Dessi'),
(5, 'SME2012-MANAGING INFORMATION TECH AND SYSTEMS', 'Clare');
GO

-- If we want to delete SME2012
DELETE FROM Course
WHERE CourseTitle like 'SME%';
GO 


-- We will use data view to add grade data


-- Some queries
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM CourseEnrollment;

GO

-- Create a handy view summarizing students' grades
CREATE VIEW vwStudentGradeSummary WITH SCHEMABINDING AS
 SELECT
   s.StudentID, s.FirstName, s.LastName, 
   ISNULL(COUNT(ce.CourseID), 0) AS NumberOfCourses,
   ISNULL(SUM(ce.Grade), 0) AS TotalGrade
  FROM
   dbo.Student AS s
   LEFT OUTER JOIN dbo.CourseEnrollment AS ce ON s.StudentID = ce.StudentID
  GROUP BY
   s.StudentID, s.FirstName, s.LastName
GO


SELECT * FROM vwStudentGradeSummary;