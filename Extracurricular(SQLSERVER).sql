
--CREATE DATABASE Extracurricular;

use Extracurricular;
--AccreditationControl
CREATE TABLE AccreditationControl 
(
    idAccreditation INT PRIMARY KEY IDENTITY(1,1),
    credits INT,
    serviceHours VARCHAR(50),
    idStudent INT,
    idClub INT,
    status INT DEFAULT 1
);

-- AttendanceRecord
CREATE TABLE AttendanceRecord 
(
    AttendanceRecordId INT PRIMARY KEY IDENTITY(1,1),
    [date] DATE,
    attended VARCHAR(50),
    idStudent INT,
    idClub INT,
    status INT DEFAULT 1
);

--CLub
CREATE TABLE Club 
(
    idClub INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    classification VARCHAR(50),
    idEmployee INT,
    status INT DEFAULT 1
);

-- ClubStudent 
CREATE TABLE ClubStudent 
(
    idClubStudent INT PRIMARY KEY IDENTITY(1,1),
    idClub INT,
    idStudent INT,
    status INT DEFAULT 1
);

--ClubSchedule
CREATE TABLE ClubSchedule 
(
    idClubSchedule INT PRIMARY KEY IDENTITY(1,1),
    dayOfWeek DATE,
    startTime TIME,
    endTime TIME,
    idClub INT,
    idEmployee INT,
    status INT DEFAULT 1
);

-- Employee
CREATE TABLE Employee 
(
    idEmployee INT PRIMARY KEY IDENTITY(1,1),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    middleName VARCHAR(50),
    specialty VARCHAR(50),
    status INT DEFAULT 1
);

--Event
CREATE TABLE Event 
(
    idEvent INT PRIMARY KEY IDENTITY(1,1),
    activityToPerform VARCHAR(50),
    [date] DATE,
    idClub INT,
    status INT DEFAULT 1
);

-- Expenses
CREATE TABLE Expenses 
(
    idExpenses INT PRIMARY KEY IDENTITY(1,1),
    expenseDate DATE,
    amount DECIMAL(10, 2),
    expenseDescription VARCHAR(50),
    status INT DEFAULT 1,
    idExpenseType INT
);

-- ExpenseType
CREATE TABLE ExpenseType 
(
    idExpenseType INT PRIMARY KEY IDENTITY(1,1),
    expenseTypeName VARCHAR(50),
    [description] VARCHAR(50),
    status INT DEFAULT 1
);

--ExtraCurricularScholarship
CREATE TABLE ExtraCurricularScholarship 
(
    idScholarship INT PRIMARY KEY IDENTITY(1,1),
    scholarshipAmount DECIMAL(10, 2),
    eligibilityRequirements NVARCHAR(100),
    scholarshipDuration VARCHAR(50),
    [description] NVARCHAR(100),
    status INT DEFAULT 1
);

-- Facility
CREATE TABLE Facility 
(
    idFacility INT PRIMARY KEY IDENTITY(1,1),
    facilityName VARCHAR(50),
    capacity VARCHAR(50),
    [location] VARCHAR(50),
    [Availability] VARCHAR(50),
    status INT DEFAULT 1,
    idClub INT
);

-- Material
CREATE TABLE Material 
(
    idMaterial INT PRIMARY KEY IDENTITY(1,1),
    itemName VARCHAR(50),
    quantity INT,
    itemType VARCHAR(50),
    idMaterialLoan INT,
    idMaterialType INT,
    status INT DEFAULT 1
);

-- Crear la tabla MaterialLoan
CREATE TABLE MaterialLoan 
(
    idMaterialLoan INT PRIMARY KEY IDENTITY(1,1),
    specialty VARCHAR(50),
    article VARCHAR(50),
    entryDate DATE,
    exitDate DATE,
    materialStatus VARCHAR(50),
    idStudent INT,
    idEmployee INT,
    status INT DEFAULT 1
);

-- MaterialType
CREATE TABLE MaterialType 
(
    idMaterialType INT PRIMARY KEY IDENTITY(1,1),
    materialTypeName VARCHAR(50),
    [description] VARCHAR(50),
    status INT DEFAULT 1
);

--Student 
CREATE TABLE Student 
(
    idStudent INT PRIMARY KEY IDENTITY(1,1),
    firstName VARCHAR(50),
    middleName VARCHAR(50),
    lastName VARCHAR(50),
    specialty VARCHAR(50),
    semester INT,
    registrationNumber VARCHAR(50),
    idScholarship INT,
    status INT DEFAULT 1
);

--TypeofEmployee
CREATE TABLE TypeOfEmployee 
(
    idTypeOfEmployee INT PRIMARY KEY IDENTITY(1,1),
    benefits VARCHAR(50),
    [description] VARCHAR(50),
    categoryemployee VARCHAR(50),
    idEmployee INT,
    status INT DEFAULT 1
);

-- Llave foránea en la tabla AccreditationControl
ALTER TABLE AccreditationControl
ADD CONSTRAINT fk_AccreditationControl_Student FOREIGN KEY (idStudent) REFERENCES Student(idStudent);

ALTER TABLE AccreditationControl
ADD CONSTRAINT fk_AccreditationControl_Club FOREIGN KEY (idClub) REFERENCES Club(idClub);

-- Llave foránea en la tabla AttendanceRecord
ALTER TABLE AttendanceRecord
ADD CONSTRAINT fk_AttendanceRecord_Student FOREIGN KEY (idStudent) REFERENCES Student(idStudent);

ALTER TABLE AttendanceRecord
ADD CONSTRAINT fk_AttendanceRecord_Club FOREIGN KEY (idClub) REFERENCES Club(idClub);

-- Llave foránea en la tabla ClubStudent
ALTER TABLE ClubStudent
ADD CONSTRAINT fk_ClubStudent_Club FOREIGN KEY (idClub) REFERENCES Club(idClub);

ALTER TABLE ClubStudent
ADD CONSTRAINT fk_ClubStudent_Student FOREIGN KEY (idStudent) REFERENCES Student(idStudent);

-- Llave foránea en la tabla ClubSchedule
ALTER TABLE ClubSchedule
ADD CONSTRAINT fk_ClubSchedule_Club FOREIGN KEY (idClub) REFERENCES Club(idClub);

ALTER TABLE ClubSchedule
ADD CONSTRAINT fk_ClubSchedule_Employee FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee);

-- Llave foránea en la tabla Event
ALTER TABLE Event
ADD CONSTRAINT fk_Event_Club FOREIGN KEY (idClub) REFERENCES Club(idClub);

-- Llave foránea en la tabla Expenses
ALTER TABLE Expenses
ADD CONSTRAINT fk_Expenses_ExpenseType FOREIGN KEY (idExpenseType) REFERENCES ExpenseType(idExpenseType);

-- Llave foránea en la tabla Facility
ALTER TABLE Facility
ADD CONSTRAINT fk_Facility_Club FOREIGN KEY (idClub) REFERENCES Club(idClub);

-- Llave foránea en la tabla Material
ALTER TABLE Material
ADD CONSTRAINT fk_Material_MaterialLoan FOREIGN KEY (idMaterialLoan) REFERENCES MaterialLoan(idMaterialLoan);

ALTER TABLE Material
ADD CONSTRAINT fk_Material_MaterialType FOREIGN KEY (idMaterialType) REFERENCES MaterialType(idMaterialType);

-- Llave foránea en la tabla Student
ALTER TABLE Student
ADD CONSTRAINT fk_Student_ExtraCurricularScholarship FOREIGN KEY (idScholarship) REFERENCES ExtraCurricularScholarship(idScholarship);

-- Llave foránea en la tabla TypeOfEmployee
ALTER TABLE TypeOfEmployee
ADD CONSTRAINT fk_TypeOfEmployee_Employee FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee);

--INDEX
-- Crear índice para la tabla AccreditationControl
CREATE INDEX idx_AccreditationControl_idStudent ON AccreditationControl (idStudent);

-- Crear índice para la tabla AttendanceRecord
CREATE INDEX idx_AttendanceRecord_idStudent ON AttendanceRecord (idStudent);

-- Crear índice para la tabla ClubStudent
CREATE INDEX idx_ClubStudent_idClub ON ClubStudent (idClub);
CREATE INDEX idx_ClubStudent_idStudent ON ClubStudent (idStudent);

-- Crear índice para la tabla ClubSchedule
CREATE INDEX idx_ClubSchedule_idClub ON ClubSchedule (idClub);
CREATE INDEX idx_ClubSchedule_idEmployee ON ClubSchedule (idEmployee);

-- Crear índice para la tabla Event
CREATE INDEX idx_Event_idClub ON Event (idClub);

-- Crear índice para la tabla Expenses
CREATE INDEX idx_Expenses_expenseTypeID ON Expenses (idExpenseType);

-- Crear índice para la tabla Facility
CREATE INDEX idx_Facility_idClub ON Facility (idClub);

-- Crear índice para la tabla Material
CREATE INDEX idx_Material_idMaterialLoan ON Material (idMaterialLoan);
CREATE INDEX idx_Material_idMaterialType ON Material (idMaterialType);

-- Crear índice para la tabla MaterialLoan
CREATE INDEX idx_MaterialLoan_idStudent ON MaterialLoan (idStudent);
CREATE INDEX idx_MaterialLoan_idEmployee ON MaterialLoan (idEmployee);

-- Crear índice para la tabla TypeOfEmployee
CREATE INDEX idx_TypeOfEmployee_idEmployee ON TypeOfEmployee (idEmployee);

-- ExtraCurricularScholarship
INSERT INTO ExtraCurricularScholarship (scholarshipAmount, eligibilityRequirements, scholarshipDuration, "description")
VALUES
( 1000.00, 'Maintain a GPA of 3.5 or higher', 'One academic year', 'Academic Excellence Scholarship'),
(800.00, 'Active participation in club activities', 'One academic year', 'Leadership Scholarship'),
(1200.00, 'Participate in at least three events', 'One academic year', 'Event Participation Scholarship');

-- Student
INSERT INTO Student (firstName, middleName, lastName, specialty, semester, registrationNumber, idScholarship)
VALUES
( 'John', 'Edward', 'Doe', 'Computer Science', 3, 'CS12345', 1),
('Alice', 'Maria', 'Smith', 'Engineering', 2, 'ENG67890', 2),
('Bob', 'William', 'Johnson', 'Fine Arts', 4, 'FA34567', 3),
('Emily', 'Grace', 'Clark', 'Biology', 5, 'BIO78901', 1),
('Sarah', 'Jane', 'Wilson', 'Music', 2, 'MUS23456', 2),
('David', 'Thomas', 'Brown', 'Physics', 4, 'PHY67890', 3),
('Olivia', 'Sophia', 'Anderson', 'Computer Science', 2, 'CS23456', 1),
('Michael', 'Christopher', 'Davis', 'Drama', 3, 'DRM12345', 2),
('Emma', 'Grace', 'Harris', 'Chemistry', 6, 'CHE56789', 3),
('William', 'James', 'Lee', 'Physical Education', 2, 'PE23456', 1);

-- Employee
INSERT INTO Employee (firstName, lastName, middleName, specialty)
VALUES
('John', 'Smith', 'A.', 'Mathematics'),
( 'Emily', 'Johnson', 'B.', 'Physical Education'),
( 'Michael', 'Brown', 'C.', 'Art'),
('Jessica', 'Davis', 'D.', 'Biology'),
('Daniel', 'Miller', 'E.', 'Music'),
('Sarah', 'Wilson', 'F.', 'Computer Science'),
('Christopher', 'Jones', 'G.', 'Physics'),
('Linda', 'Martinez', 'H.', 'Theater'),
('David', 'Harris', 'I.', 'Engineering'),
('Olivia', 'Clark', 'J.', 'Swimming');

-- Club
INSERT INTO Club (name, classification, idEmployee)
VALUES
('Math Club', 'Academic', 1),
('Soccer Club', 'Sports', 2),
('Art Club', 'Cultural', 3),
('Science Club', 'Academic', 1),
('Music Club', 'Cultural', 2),
('Chess Club', 'Academic', 3),
('Basketball Club', 'Sports', 1),
('Drama Club', 'Cultural', 2),
('Programming Club', 'Academic', 3),
('Swimming Club', 'Sports', 1);

-- AccreditationControl
INSERT INTO AccreditationControl (credits, serviceHours, idStudent, idClub)
VALUES
(30, '100 hours', 1, 1),
(25, '80 hours', 2, 2),
(35, '120 hours', 3, 1),
(28, '90 hours', 4, 3),
(33, '110 hours', 5, 2),
(29, '95 hours', 6, 1),
(31, '105 hours', 7, 3),
(27, '88 hours', 8, 2),
(32, '108 hours', 9, 3),
(26, '82 hours', 10, 1);

-- AttendanceRecord
INSERT INTO AttendanceRecord ([date], attended, idStudent, idClub)
VALUES
('2023-10-01', 'Yes', 1, 1),
('2023-10-02', 'Yes', 2, 2),
('2023-10-03', 'No', 3, 1),
('2023-10-04', 'Yes', 4, 3),
('2023-10-05', 'Yes', 5, 2),
('2023-10-06', 'No', 6, 1),
('2023-10-07', 'Yes', 7, 3),
('2023-10-08', 'Yes', 8, 2),
('2023-10-09', 'No', 9, 3),
('2023-10-10', 'Yes', 10, 1);


-- ClubStudent
INSERT INTO ClubStudent (idClub, idStudent)
VALUES
( 1, 1),
( 2, 2),
( 1, 3),
( 3, 4),
( 2, 5),
( 1, 6),
( 3, 7),
( 2, 8),
( 3, 9),
( 1, 10);

-- ClubSchedule
INSERT INTO ClubSchedule (dayOfWeek, startTime, endTime, idClub, idEmployee)
VALUES
('2023-10-01', '14:00:00', '16:00:00', 1, 1),
('2023-10-02', '16:30:00', '18:30:00', 2, 2),
('2023-10-03', '15:00:00', '17:00:00', 1, 3),
('2023-10-04', '14:00:00', '16:00:00', 3, 1),
( '2023-10-05', '16:30:00', '18:30:00', 2, 2),
('2023-10-06', '15:00:00', '17:00:00', 1, 3),
('2023-10-07', '14:00:00', '16:00:00', 3, 1),
('2023-10-08', '16:30:00', '18:30:00', 2, 2),
('2023-10-09', '15:00:00', '17:00:00', 3, 3),
('2023-10-10', '14:00:00', '16:00:00', 1, 1);
INSERT INTO Event (activityToPerform, [date], idClub)
VALUES
('Math Quiz', '2023-10-15', 1),
('Soccer Match', '2023-10-20', 2),
('Art Exhibition', '2023-11-05', 3),
('Science Fair', '2023-10-18', 1),
('Music Concert', '2023-10-25', 2),
('Chess Tournament', '2023-11-10', 3),
('Basketball Game', '2023-10-30', 1),
('Drama Play', '2023-11-12', 2),
('Programming Workshop', '2023-11-02', 3),
('Swimming Competition', '2023-11-15', 1);

-- ExpenseType
INSERT INTO ExpenseType ( expenseTypeName, "description")
VALUES
( 'Advertisement', 'Expenses related to advertising'),
('Transportation', 'Expenses related to transportation'),
( 'Material', 'Expenses related to materials');

-- Expenses
INSERT INTO Expenses (expenseDate, amount, expenseDescription, idExpenseType)
VALUES
('2023-10-15', 500.00, 'Advertisement', 1),
('2023-10-20', 300.00, 'Transportation', 2),
('2023-11-05', 1000.00, 'Material', 1),
('2023-10-18', 750.00, 'Advertisement', 2),
('2023-10-25', 600.00, 'Transportation', 1),
('2023-11-10', 400.00, 'Material', 2),
('2023-10-30', 900.00, 'Advertisement', 1),
('2023-11-12', 350.00, 'Transportation', 2),
('2023-11-02', 800.00, 'Material', 1),
('2023-11-15', 700.00, 'Advertisement', 2);

INSERT INTO Facility (facilityName, capacity, "location", "Availability", idClub)
VALUES
('Auditorium', '500', 'Main Building', 'Available', 1),
('Sports Field', '1000', 'Sports Complex', 'Occupied', 2),
('Art Studio', '50', 'Arts Building', 'Available', 3),
('Science Lab', '30', 'Science Building', 'Under Maintenance', 1),
('Music Room', '40', 'Arts Building', 'Available', 2),
('Chess Club Room', '20', 'Main Building', 'Available', 3),
('Basketball Court', '100', 'Sports Complex', 'Available', 1),
('Theater', '200', 'Arts Building', 'Occupied', 2),
('Computer Lab', '30', 'Science Building', 'Available', 3),
('Swimming Pool', '150', 'Sports Complex', 'Available', 1);

-- MaterialLoan
INSERT INTO MaterialLoan (specialty, article, entryDate, exitDate, materialStatus, idStudent, idEmployee)
VALUES
('Education', 'Textbooks', '2023-10-05', '2023-12-15', 'In Use', 1, 1),
('Sports', 'Basketballs', '2023-10-12', '2023-11-30', 'In Use', 2, 2),
('Art', 'Paints and Brushes', '2023-10-08', '2023-10-22', 'In Use', 3, 3),
('Science', 'Microscopes', '2023-10-15', '2023-11-30', 'In Use', 4, 4),
('Music', 'Keyboards', '2023-10-10', '2023-11-20', 'In Use', 5, 5),
('Board Games', 'Chess Sets', '2023-10-07', '2023-10-21', 'In Use', 6, 6),
('Technology', 'Laptops', '2023-10-14', '2023-12-15', 'In Use', 7, 7),
('Arts', 'Costumes', '2023-10-09', '2023-10-23', 'In Use', 8, 8),
('Science', 'Lab Equipment', '2023-10-20', '2023-11-30', 'In Use', 9, 9),
('Sports', 'Swimming Gear', '2023-10-06', '2023-12-15', 'In Use', 10, 10);

-- MaterialType
INSERT INTO MaterialType (materialTypeName, "description")
VALUES
('Educational', 'Materials used for educational purposes'),
('Sports', 'Materials used for sports and games'),
('Art', 'Materials used for artistic activities'),
('Science', 'Materials used for scientific experiments'),
('Music', 'Musical instruments and accessories'),
('Board Games', 'Board games and accessories'),
('Technology', 'Technological equipment and devices'),
('Arts', 'Materials used for performing arts'),
('Science', 'Scientific laboratory equipment'),
('Sports', 'Materials used for sports and physical activities');

-- Material
-- Material
INSERT INTO Material (itemName, quantity, itemType, idMaterialLoan, idMaterialType)
VALUES
('Books', 50, 'Educational', 1, 1),
('Sports Equipment', 20, 'Sports', 2, 2),
('Art Supplies', 30, 'Art', 3, 3),
('Lab Equipment', 15, 'Science', 4, 4),
('Musical Instruments', 40, 'Music', 5, 5),
('Chess Sets', 10, 'Board Games', 6, 6),
('Computers', 25, 'Technology', 7, 7),
('Theater Props', 15, 'Arts', 8, 8),
('Microscopes', 10, 'Science', 9, 9),
('Swimming Gear', 50, 'Sports', 10, 10);

-- TypeOfEmployee
INSERT INTO TypeOfEmployee (benefits, "description", categoryemployee, idEmployee)
VALUES
('Healthcare, Paid Leave', 'Full-Time Employee', 'Administrative Staff', 1),
('Paid Leave', 'Part-Time Employee', 'Administrative Staff', 2),
('Paid Leave', 'Part-Time Employee', 'Administrative Staff', 3),
('Healthcare, Paid Leave', 'Full-Time Employee', 'Faculty', 4),
('Paid Leave', 'Part-Time Employee', 'Faculty', 5),
('Paid Leave', 'Part-Time Employee', 'Faculty', 6),
('Healthcare, Paid Leave', 'Full-Time Employee', 'Support Staff', 7),
('Paid Leave', 'Part-Time Employee', 'Support Staff', 8),
('Paid Leave', 'Part-Time Employee', 'Support Staff', 9),
('Healthcare, Paid Leave', 'Full-Time Employee', 'Physical Education Instructor', 10);
