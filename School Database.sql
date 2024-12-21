CREATE TABLE Students1(
	StudentID INT PRIMARY KEY,
	first_name VARCHAR (20) NOT NULL,
	last_name VARCHAR (20) NOT NULL,
	birth_date VARCHAR (15),
	enrollment_year VARCHAR (5)
);

INSERT INTO Students1 (StudentID, first_name, last_name, birth_date, enrollment_year)
VALUES (1, 'Nikola', 'Atanasov', '01.08.2003', '2022'),
(2, 'Aleksandar', 'Dimitrievski', '06.09.2000', '2019'),
(3, 'Hristina', 'Trajanovska', '11.04.2001', '2020'),
(4, 'Bojan', 'Krstevski', '23.12.2002', '2021'),
(5, 'Lina', 'Arsova', '07.11.2000', '2020'),
(6, 'Ivan', 'Angelovski', '15.03.2002', '2021'),
(7, 'Rade', 'Spirovski', '18.02.2001', '2020'),
(8, 'Mila', 'Spasova', '29.05.2004', '2023'),
(9, 'Martin', 'Temelkovski', '30.06.2000', '2019'),
(10, 'Aleksandra', 'Ivanova', '25.07.1997', '2018');

SELECT * FROM Students1;

CREATE TABLE Professors(
	ProfessorID INT PRIMARY KEY,
	first_name VARCHAR (20) NOT NULL,
	last_name VARCHAR (20) NOT NULL,
	department VARCHAR (30),
	hire_date VARCHAR (15)
);

INSERT INTO Professors(ProfessorID, first_name, last_name, department, hire_date)
VALUES (1, 'Todor', 'Ivanov', 'Finansii', '06.09.1995'),
(2, 'Igor', 'Velevski', 'Istorija', '13.08.1991'),
(3, 'Tanja', 'Lozanovska', 'Fizika', '31.03.1998'),
(4, 'Mishko', 'Radevski', 'Menadzment', '01.06.2000'),
(5, 'Ivana', 'Mishevska', 'Matematika', '08.10.2005'),
(6, 'Vancho', 'Mladenovski', 'Arhitektura', '11.09.2008'),
(7, 'Elena', 'Ristova', 'Psihologija', '28.02.1999'),
(8, 'Vladimir', 'Petrevski', 'Ekonomija', '09.07.2006'),
(9, 'Marina', 'Ilieva', 'Farmacija', '07.09.2004'),
(10, 'Aleksandra', 'Trajkovska', 'Veterina', '15.12.1994');

SELECT * FROM Professors;

CREATE TABLE subjects1(
	SubjectID INT PRIMARY KEY,
	subject_name VARCHAR (40) NOT NULL,
	ProfessorID INT,

	FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID) ,
);

INSERT INTO subjects1(subjectID, subject_name, ProfessorID)
VALUES (1, 'Anatomija', 9),
(2, 'Geometrija', 5),
(3, 'Bankarstvo', 1),
(4, 'Bazi na podatoci', NULL),
(5, 'Star vek', 2),
(6, 'Ustavno pravo', NULL),
(7, 'Semejna psihologija',7),
(8, 'Kriminologija', NULL);

SELECT * FROM subjects1;

-- 3. Establish relationships between the tables, such as associating each subject with a professor through the Professor ID column.

SELECT 
subjects1.SubjectID,
subjects1.subject_name,
Professors.ProfessorID,
Professors.first_name,
Professors.last_name
FROM subjects1
JOIN Professors
ON subjects1.ProfessorID = Professors.ProfessorID;


-- Query 1: Retrieve a list of all students enrolled after a specific year (e.g., 2020).

SELECT * FROM Students1 WHERE enrollment_year > 2020;


-- Query 2: Find the subjects taught by a particular professor by using the professor's ID.

SELECT
Professors.ProfessorID,
Professors.first_name,
Professors.last_name,
subjects1.subject_name
FROM Professors
JOIN subjects1
ON subjects1.ProfessorID = Professors.ProfessorID;

-- tuka mozhe da se dodava primer <WHERE professors.ProfessorID = 1>, za da se najde profesorot so ID = 1 itn... --


 --Query 3: List all students' names and enrollment years, filtered by department.
 ---------(for example, list all students under a department where professors belong).


 CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    SubjectID INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students1(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects1(SubjectID)
);

INSERT INTO Enrollments(EnrollmentID, StudentID, SubjectID)
VALUES (1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 8),
(6, 6, 7),
(7, 7, 6),
(8, 8, 5),
(9, 9, 3),
(10, 10, 7);



SELECT students1.first_name, Students1.last_name, Students1.enrollment_year, Professors.department, Professors.first_name, Professors.last_name
 FROM Students1
 JOIN Enrollments ON students1.StudentID = enrollments.StudentID
 JOIN subjects1 ON Students1.studentID = subjects1.subjectID
 JOIN Professors ON subjects1.ProfessorID = professors.ProfessorID;