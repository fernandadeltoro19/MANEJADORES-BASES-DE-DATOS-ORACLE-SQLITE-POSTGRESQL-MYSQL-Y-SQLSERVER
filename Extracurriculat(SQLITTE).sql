CREATE DATABASE Extracurricular;
USE Extracurricular;

-- Tabla AccreditationControl 
CREATE TABLE AccreditationControl (
    idAccreditation INTEGER PRIMARY KEY AUTOINCREMENT,
    credits INTEGER,
    serviceHours TEXT,
    idStudent INTEGER,
    idClub INTEGER,
    status INTEGER DEFAULT 1,
    FOREIGN KEY (idStudent) REFERENCES Student(idStudent),
    FOREIGN KEY (idClub) REFERENCES Club(idClub)
);

-- Tabla AttendanceRecord 
CREATE TABLE AttendanceRecord (
    AttendanceRecordId INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATE,
    attended TEXT,
    idStudent INTEGER,
    idClub INTEGER,
    status INTEGER DEFAULT 1,
    FOREIGN KEY (idStudent) REFERENCES Student(idStudent),
    FOREIGN KEY (idClub) REFERENCES Club(idClub)
);

-- Tabla Club 
CREATE TABLE Club (
    idClub INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50),
    classification VARCHAR(50),
    idEmployee INTEGER,
    status INTEGER DEFAULT 1
);

-- Tabla ClubStudent 
CREATE TABLE ClubStudent (
    idClubStudent INTEGER PRIMARY KEY AUTOINCREMENT,
    idClub INTEGER,
    idStudent INTEGER,
    status INTEGER DEFAULT 1,
    FOREIGN KEY (idClub) REFERENCES Club(idClub),
    FOREIGN KEY (idStudent) REFERENCES Student(idStudent)
);

-- Tabla ClubSchedule 
CREATE TABLE ClubSchedule (
    idClubSchedule INTEGER PRIMARY KEY AUTOINCREMENT,
    dayOfWeek DATE,
    startTime TIME,
    endTime TIME,
    idClub INTEGER,
    idEmployee INTEGER,
    status INTEGER DEFAULT 1,
    FOREIGN KEY (idClub) REFERENCES Club(idClub),
    FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee)
);
-- Employee
CREATE TABLE Employee (
    idEmployee INTEGER PRIMARY KEY AUTOINCREMENT,
    firstName TEXT,
    lastName TEXT,
    middleName TEXT,
    specialty TEXT,
    status INTEGER DEFAULT 1
);

-- Event
CREATE TABLE Event (
    idEvent INTEGER PRIMARY KEY AUTOINCREMENT,
    activityToPerform TEXT,
    date DATE,
    idClub INTEGER,
    status INTEGER DEFAULT 1,
    FOREIGN KEY (idClub) REFERENCES Club(idClub)
);

-- Expenses
CREATE TABLE Expenses (
    idExpenses INTEGER PRIMARY KEY AUTOINCREMENT,
    expenseDate DATE,
    amount NUMERIC(10, 2),
    expenseDescription TEXT,
    status INTEGER DEFAULT 1,
    idExpenseType INTEGER,
    FOREIGN KEY (idExpenseType) REFERENCES ExpenseType(idExpenseType)
);

-- ExpenseType
CREATE TABLE ExpenseType (
    idExpenseType INTEGER PRIMARY KEY AUTOINCREMENT,
    expenseTypeName TEXT,
    description TEXT,
    status INTEGER DEFAULT 1
);

-- ExtraCurricularScholarship
CREATE TABLE ExtraCurricularScholarship (
    idScholarship INTEGER PRIMARY KEY AUTOINCREMENT,
    scholarshipAmount NUMERIC(10, 2),
    eligibilityRequirements TEXT,
    scholarshipDuration TEXT,
    description TEXT,
    status INTEGER DEFAULT 1
);

-- Facility
CREATE TABLE Facility (
    idFacility INTEGER PRIMARY KEY AUTOINCREMENT,
    facilityName TEXT,
    capacity TEXT,
    location TEXT,
    Availability TEXT,
    status INTEGER DEFAULT 1,
    idClub INTEGER,
    FOREIGN KEY (idClub) REFERENCES Club(idClub)
);

-- Material
CREATE TABLE Material (
    idMaterial INTEGER PRIMARY KEY AUTOINCREMENT,
    itemName TEXT,
    quantity INTEGER,
    itemType TEXT,
    idMaterialLoan INTEGER,
    idMaterialType INTEGER,
    status INTEGER DEFAULT 1,
    FOREIGN KEY (idMaterialLoan) REFERENCES MaterialLoan(idMaterialLoan),
    FOREIGN KEY (idMaterialType) REFERENCES MaterialType(idMaterialType)
);

-- MaterialLoan
CREATE TABLE MaterialLoan (
    idMaterialLoan INTEGER PRIMARY KEY AUTOINCREMENT,
    specialty TEXT,
    article TEXT,
    entryDate DATE,
    exitDate DATE,
    materialStatus TEXT,
    idStudent INTEGER,
    idEmployee INTEGER,
    status INTEGER DEFAULT 1,
    FOREIGN KEY (idStudent) REFERENCES Student(idStudent),
    FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee)
);

-- MaterialType
CREATE TABLE MaterialType (
    idMaterialType INTEGER PRIMARY KEY AUTOINCREMENT,
    materialTypeName TEXT,
    description TEXT,
    status INTEGER DEFAULT 1
);

-- Student
CREATE TABLE Student (
    idStudent INTEGER PRIMARY KEY AUTOINCREMENT,
    firstName TEXT,
    middleName TEXT,
    lastName TEXT,
    specialty TEXT,
    semester INTEGER,
    registrationNumber TEXT,
    idScholarship INTEGER,
    status INTEGER DEFAULT 1,
    FOREIGN KEY (idScholarship) REFERENCES ExtraCurricularScholarship(idScholarship)
);

-- TypeOfEmployee
CREATE TABLE TypeOfEmployee (
    idTypeOfEmployee INTEGER PRIMARY KEY AUTOINCREMENT,
    benefits TEXT,
    description TEXT,
    categoryemployee TEXT,
    idEmployee INTEGER,
    status INTEGER DEFAULT 1,
    FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee)
);

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

