CREATE DATABASE Extracurricular;


--TABLAS
-- Crear la tabla AccreditationControl
CREATE TABLE AccreditationControl 
(
    idAccreditation SERIAL PRIMARY KEY,
    credits INTEGER,
    serviceHours VARCHAR(50),
    idStudent INTEGER,
    idClub INTEGER,
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla AttendanceRecord
CREATE TABLE AttendanceRecord 
(
    AttendanceRecordId SERIAL PRIMARY KEY,
    date DATE,
    attended VARCHAR(50),
    idStudent INTEGER,
    idClub INTEGER,
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla Club
CREATE TABLE Club 
(
    idClub SERIAL PRIMARY KEY,
    name VARCHAR(50),
    classification VARCHAR(50),
    idEmployee INTEGER,
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla ClubStudent
CREATE TABLE ClubStudent 
(
    idClubStudent SERIAL PRIMARY KEY,
    idClub INTEGER,
    idStudent INTEGER,
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla ClubSchedule
CREATE TABLE ClubSchedule 
(
    idClubSchedule SERIAL PRIMARY KEY,
    dayOfWeekk DATE,
    startTime TIME,
    endTime TIME,
    idClub INTEGER,
    idEmployee INTEGER,
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla Employee
CREATE TABLE Employee 
(
    idEmployee SERIAL PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    middleName VARCHAR(50),
    specialty VARCHAR(50),
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla Event
CREATE TABLE Event 
(
    idEvent SERIAL PRIMARY KEY,
    activityToPerform VARCHAR(50),
    date DATE,
    idClub INTEGER,
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla Expenses
CREATE TABLE Expenses 
(
    idExpenses SERIAL PRIMARY KEY,
    expenseDate DATE,
    amount DECIMAL(10, 2),
    expenseDescription VARCHAR(50),
    status BOOLEAN DEFAULT TRUE,
    idExpenseType INTEGER
);

-- Crear la tabla ExpenseType
CREATE TABLE ExpenseType 
(
    idExpenseType SERIAL PRIMARY KEY,
    expenseTypeName VARCHAR(50),
    description VARCHAR(50),
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla ExtraCurricularScholarship
CREATE TABLE ExtraCurricularScholarship 
(
    idScholarship SERIAL PRIMARY KEY,
    scholarshipAmount DECIMAL(10, 2),
    eligibilityRequirements VARCHAR(100),
    scholarshipDuration VARCHAR(50),
    description VARCHAR(100),
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla Facility
CREATE TABLE Facility 
(
    idFacility SERIAL PRIMARY KEY,
    facilityName VARCHAR(50),
    capacity VARCHAR(50),
    location VARCHAR(50),
    availability VARCHAR(50),
    status BOOLEAN DEFAULT TRUE,
    idClub INTEGER
);

-- Crear la tabla Material
CREATE TABLE Material 
(
    idMaterial SERIAL PRIMARY KEY,
    itemName VARCHAR(50),
    quantity INTEGER,
    itemType VARCHAR(50),
    idMaterialLoan INTEGER,
    idMaterialType INTEGER,
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla MaterialLoan
CREATE TABLE MaterialLoan 
(
    idMaterialLoan SERIAL PRIMARY KEY,
    specialty VARCHAR(50),
    article VARCHAR(50),
    entryDate DATE,
    exitDate DATE,
    materialStatus VARCHAR(50),
    idStudent INTEGER,
    idEmployee INTEGER,
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla MaterialType
CREATE TABLE MaterialType 
(
    idMaterialType SERIAL PRIMARY KEY,
    materialTypeName VARCHAR(50),
    description VARCHAR(50),
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla Student
CREATE TABLE Student 
(
    idStudent SERIAL PRIMARY KEY,
    firstName VARCHAR(50),
    middleName VARCHAR(50),
    lastName VARCHAR(50),
    specialty VARCHAR(50),
    semester INTEGER,
    registrationNumber VARCHAR(50),
    idScholarship INTEGER,
    status BOOLEAN DEFAULT TRUE
);

-- Crear la tabla TypeOfEmployee
CREATE TABLE TypeOfEmployee 
(
    idTypeOfEmployee SERIAL PRIMARY KEY,
    benefits VARCHAR(50),
    description VARCHAR(50),
    categoryemployee VARCHAR(50),
    idEmployee INTEGER,
    status BOOLEAN DEFAULT TRUE
);

--FORANEAS
-- Llave foránea en la tabla AccreditationControl
ALTER TABLE AccreditationControl
ADD CONSTRAINT fk_acc_student FOREIGN KEY (idStudent) REFERENCES Student(idStudent);

ALTER TABLE AccreditationControl
ADD CONSTRAINT fk_acc_club FOREIGN KEY (idClub) REFERENCES Club(idClub);

-- Llave foránea en la tabla AttendanceRecord
ALTER TABLE AttendanceRecord
ADD CONSTRAINT fk_att_student FOREIGN KEY (idStudent) REFERENCES Student(idStudent);

ALTER TABLE AttendanceRecord
ADD CONSTRAINT fk_att_club FOREIGN KEY (idClub) REFERENCES Club(idClub);

-- Llave foránea en la tabla ClubStudent
ALTER TABLE ClubStudent
ADD CONSTRAINT fk_club_stud FOREIGN KEY (idClub) REFERENCES Club(idClub);

ALTER TABLE ClubStudent
ADD CONSTRAINT fk_stud_club FOREIGN KEY (idStudent) REFERENCES Student(idStudent);

-- Llave foránea en la tabla ClubSchedule
ALTER TABLE ClubSchedule
ADD CONSTRAINT fk_club_schd_club FOREIGN KEY (idClub) REFERENCES Club(idClub);

ALTER TABLE ClubSchedule
ADD CONSTRAINT fk_club_schd_emp FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee);

-- Llave foránea en la tabla Event
ALTER TABLE Event
ADD CONSTRAINT fk_event_club FOREIGN KEY (idClub) REFERENCES Club(idClub);

-- Llave foránea en la tabla Expenses
ALTER TABLE Expenses
ADD CONSTRAINT fk_expense_type FOREIGN KEY (idExpenseType) REFERENCES ExpenseType(idExpenseType);


-- Llave foránea en la tabla Facility
ALTER TABLE Facility
ADD CONSTRAINT fk_facility_club FOREIGN KEY (idClub) REFERENCES Club(idClub);

-- Llave foránea en la tabla Material
ALTER TABLE Material
ADD CONSTRAINT fk_material_loan FOREIGN KEY (idMaterialLoan) REFERENCES MaterialLoan(idMaterialLoan);

ALTER TABLE Material
ADD CONSTRAINT fk_material_type FOREIGN KEY (idMaterialType) REFERENCES MaterialType(idMaterialType);

-- Llave foránea en la tabla Student
ALTER TABLE Student
ADD CONSTRAINT fk_stud_scholarship FOREIGN KEY (idScholarship) REFERENCES ExtraCurricularScholarship(idScholarship);

-- Llave foránea en la tabla TypeOfEmployee
ALTER TABLE TypeOfEmployee
ADD CONSTRAINT fk_emp_employee FOREIGN KEY (idEmployee) REFERENCES Employee(idEmployee);

--INDICES
-- Crear índice para la tabla AccreditationControl
CREATE INDEX idx_accreditationcontrol_idstudent ON AccreditationControl (idStudent);

-- Crear índice para la tabla AttendanceRecord
CREATE INDEX idx_attendancerecord_idstudent ON AttendanceRecord (idStudent);

-- Crear índice para la tabla ClubStudent
CREATE INDEX idx_clubstudent_idclub ON ClubStudent (idClub);
CREATE INDEX idx_clubstudent_idstudent ON ClubStudent (idStudent);

-- Crear índice para la tabla ClubSchedule
CREATE INDEX idx_clubschedule_idclub ON ClubSchedule (idClub);
CREATE INDEX idx_clubschedule_idemployee ON ClubSchedule (idEmployee);

-- Crear índice para la tabla Event
CREATE INDEX idx_event_idclub ON Event (idClub);

-- Crear índice para la tabla Expenses
CREATE INDEX idx_expenses_expensetypeid ON Expenses (idExpenseType);

-- Crear índice para la tabla Facility
CREATE INDEX idx_facility_idclub ON Facility (idClub);

-- Crear índice para la tabla Material
CREATE INDEX idx_material_idmaterialloan ON Material (idMaterialLoan);
CREATE INDEX idx_material_idmaterialtype ON Material (idMaterialType);

-- Crear índice para la tabla MaterialLoan
CREATE INDEX idx_materialloan_idstudent ON MaterialLoan (idStudent);
CREATE INDEX idx_materialloan_idemployee ON MaterialLoan (idEmployee);

-- Crear índice para la tabla Student
CREATE INDEX idx_student_idstudent ON Student (idStudent);

-- Crear índice para la tabla TypeOfEmployee
CREATE INDEX idx_typeofemployee_idemployee ON TypeOfEmployee (idEmployee);

--INSERTS
-- ExtraCurricularScholarship
INSERT INTO ExtraCurricularScholarship (idScholarship, scholarshipAmount, eligibilityRequirements, scholarshipDuration, "description")
VALUES
(1, 1000.00, 'Maintain a GPA of 3.5 or higher', 'One academic year', 'Academic Excellence Scholarship'),
(2, 800.00, 'Active participation in club activities', 'One academic year', 'Leadership Scholarship'),
(3, 1200.00, 'Participate in at least three events', 'One academic year', 'Event Participation Scholarship');

-- Student
INSERT INTO Student (idStudent, firstName, middleName, lastName, specialty, semester, registrationNumber, idScholarship)
VALUES
(1, 'John', 'Edward', 'Doe', 'Computer Science', 3, 'CS12345', 1),
(2, 'Alice', 'Maria', 'Smith', 'Engineering', 2, 'ENG67890', 2),
(3, 'Bob', 'William', 'Johnson', 'Fine Arts', 4, 'FA34567', 3),
(4, 'Emily', 'Grace', 'Clark', 'Biology', 5, 'BIO78901', 1),
(5, 'Sarah', 'Jane', 'Wilson', 'Music', 2, 'MUS23456', 2),
(6, 'David', 'Thomas', 'Brown', 'Physics', 4, 'PHY67890', 3),
(7, 'Olivia', 'Sophia', 'Anderson', 'Computer Science', 2, 'CS23456', 1),
(8, 'Michael', 'Christopher', 'Davis', 'Drama', 3, 'DRM12345', 2),
(9, 'Emma', 'Grace', 'Harris', 'Chemistry', 6, 'CHE56789', 3),
(10, 'William', 'James', 'Lee', 'Physical Education', 2, 'PE23456', 1);

-- Employee
INSERT INTO Employee (idEmployee, firstName, lastName, middleName, specialty)
VALUES
(1, 'John', 'Smith', 'A.', 'Mathematics'),
(2, 'Emily', 'Johnson', 'B.', 'Physical Education'),
(3, 'Michael', 'Brown', 'C.', 'Art'),
(4, 'Jessica', 'Davis', 'D.', 'Biology'),
(5, 'Daniel', 'Miller', 'E.', 'Music'),
(6, 'Sarah', 'Wilson', 'F.', 'Computer Science'),
(7, 'Christopher', 'Jones', 'G.', 'Physics'),
(8, 'Linda', 'Martinez', 'H.', 'Theater'),
(9, 'David', 'Harris', 'I.', 'Engineering'),
(10, 'Olivia', 'Clark', 'J.', 'Swimming');

-- Club
INSERT INTO Club (idClub, name, classification, idEmployee)
VALUES
(1, 'Math Club', 'Academic', 1),
(2, 'Soccer Club', 'Sports', 2),
(3, 'Art Club', 'Cultural', 3),
(4, 'Science Club', 'Academic', 1),
(5, 'Music Club', 'Cultural', 2),
(6, 'Chess Club', 'Academic', 3),
(7, 'Basketball Club', 'Sports', 1),
(8, 'Drama Club', 'Cultural', 2),
(9, 'Programming Club', 'Academic', 3),
(10, 'Swimming Club', 'Sports', 1);

-- AccreditationControl
INSERT INTO AccreditationControl (idAccreditation, credits, serviceHours, idStudent, idClub)
VALUES
(1, 30, '100 hours', 1, 1),
(2, 25, '80 hours', 2, 2),
(3, 35, '120 hours', 3, 1),
(4, 28, '90 hours', 4, 3),
(5, 33, '110 hours', 5, 2),
(6, 29, '95 hours', 6, 1),
(7, 31, '105 hours', 7, 3),
(8, 27, '88 hours', 8, 2),
(9, 32, '108 hours', 9, 3),
(10, 26, '82 hours', 10, 1);

-- AttendanceRecord
INSERT INTO AttendanceRecord (AttendanceRecordId, "date", attended, idStudent, idClub)
VALUES
(1, '2023-10-01', 'Yes', 1, 1),
(2, '2023-10-02', 'Yes', 2, 2),
(3, '2023-10-03', 'No', 3, 1),
(4, '2023-10-04', 'Yes', 4, 3),
(5, '2023-10-05', 'Yes', 5, 2),
(6, '2023-10-06', 'No', 6, 1),
(7, '2023-10-07', 'Yes', 7, 3),
(8, '2023-10-08', 'Yes', 8, 2),
(9, '2023-10-09', 'No', 9, 3),
(10, '2023-10-10', 'Yes', 10, 1);

-- ClubStudent
INSERT INTO ClubStudent (idClubStudent, idClub, idStudent)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 3),
(4, 3, 4),
(5, 2, 5),
(6, 1, 6),
(7, 3, 7),
(8, 2, 8),
(9, 3, 9),
(10, 1, 10);

-- ClubSchedule
INSERT INTO ClubSchedule (idClubSchedule, "dayofweekk", startTime, endTime, idClub, idEmployee)
VALUES
(1, '2023-10-01', '14:00:00', '16:00:00', 1, 1),
(2, '2023-10-02', '16:30:00', '18:30:00', 2, 2),
(3, '2023-10-03', '15:00:00', '17:00:00', 1, 3),
(4, '2023-10-04', '14:00:00', '16:00:00', 3, 1),
(5, '2023-10-05', '16:30:00', '18:30:00', 2, 2),
(6, '2023-10-06', '15:00:00', '17:00:00', 1, 3),
(7, '2023-10-07', '14:00:00', '16:00:00', 3, 1),
(8, '2023-10-08', '16:30:00', '18:30:00', 2, 2),
(9, '2023-10-09', '15:00:00', '17:00:00', 3, 3),
(10, '2023-10-10', '14:00:00', '16:00:00', 1, 1);

-- Event
INSERT INTO Event (idEvent, activityToPerform, "date", idClub)
VALUES
(1, 'Math Quiz', '2023-10-15', 1),
(2, 'Soccer Match', '2023-10-20', 2),
(3, 'Art Exhibition', '2023-11-05', 3),
(4, 'Science Fair', '2023-10-18', 1),
(5, 'Music Concert', '2023-10-25', 2),
(6, 'Chess Tournament', '2023-11-10', 3),
(7, 'Basketball Game', '2023-10-30', 1),
(8, 'Drama Play', '2023-11-12', 2),
(9, 'Programming Workshop', '2023-11-02', 3),
(10, 'Swimming Competition', '2023-11-15', 1);

-- ExpenseType
INSERT INTO ExpenseType (idExpenseType, expenseTypeName, "description")
VALUES
(1, 'Advertisement', 'Expenses related to advertising'),
(2, 'Transportation', 'Expenses related to transportation'),
(3, 'Material', 'Expenses related to materials');

-- Expenses
INSERT INTO Expenses (idExpenses, expenseDate, amount, expenseDescription, idExpenseType)
VALUES
(1, '2023-10-15', 500.00, 'Advertisement', 1),
(2, '2023-10-20', 300.00, 'Transportation', 2),
(3, '2023-11-05', 1000.00, 'Material', 1),
(4, '2023-10-18', 750.00, 'Advertisement', 2),
(5, '2023-10-25', 600.00, 'Transportation', 1),
(6, '2023-11-10', 400.00, 'Material', 2),
(7, '2023-10-30', 900.00, 'Advertisement', 1),
(8, '2023-11-12', 350.00, 'Transportation', 2),
(9, '2023-11-02', 800.00, 'Material', 1),
(10, '2023-11-15', 700.00, 'Advertisement', 2);

-- Facility
INSERT INTO Facility (idFacility, facilityName, capacity, "location", "availability", idClub)
VALUES
(1, 'Auditorium', '500', 'Main Building', 'Available', 1),
(2, 'Sports Field', '1000', 'Sports Complex', 'Occupied', 2),
(3, 'Art Studio', '50', 'Arts Building', 'Available', 3),
(4, 'Science Lab', '30', 'Science Building', 'Under Maintenance', 1),
(5, 'Music Room', '40', 'Arts Building', 'Available', 2),
(6, 'Chess Club Room', '20', 'Main Building', 'Available', 3),
(7, 'Basketball Court', '100', 'Sports Complex', 'Available', 1),
(8, 'Theater', '200', 'Arts Building', 'Occupied', 2),
(9, 'Computer Lab', '30', 'Science Building', 'Available', 3),
(10, 'Swimming Pool', '150', 'Sports Complex', 'Available', 1);

-- MaterialLoan
INSERT INTO MaterialLoan (idMaterialloan, specialty, article, entryDate, exitdate, materialstatus, idStudent, idEmployee)
VALUES
(1, 'Education', 'Textbooks', '2023-10-05', '2023-12-15', 'In Use', 1, 1),
(2, 'Sports', 'Basketballs', '2023-10-12', '2023-11-30', 'In Use', 2, 2),
(3, 'Art', 'Paints and Brushes', '2023-10-08', '2023-10-22', 'In Use', 3, 3),
(4, 'Science', 'Microscopes', '2023-10-15', '2023-11-30', 'In Use', 4, 4),
(5, 'Music', 'Keyboards', '2023-10-10', '2023-11-20', 'In Use', 5, 5),
(6, 'Board Games', 'Chess Sets', '2023-10-07', '2023-10-21', 'In Use', 6, 6),
(7, 'Technology', 'Laptops', '2023-10-14', '2023-12-15', 'In Use', 7, 7),
(8, 'Arts', 'Costumes', '2023-10-09', '2023-10-23', 'In Use', 8, 8),
(9, 'Science', 'Lab Equipment', '2023-10-20', '2023-11-30', 'In Use', 9, 9),
(10, 'Sports', 'Swimming Gear', '2023-10-06', '2023-12-15', 'In Use', 10, 10);

-- MaterialType
INSERT INTO MaterialType (idMaterialType, materialTypeName, "description")
VALUES
(1, 'Educational', 'Materials used for educational purposes'),
(2, 'Sports', 'Materials used for sports and games'),
(3, 'Art', 'Materials used for artistic activities'),
(4, 'Science', 'Materials used for scientific experiments'),
(5, 'Music', 'Musical instruments and accessories'),
(6, 'Board Games', 'Board games and accessories'),
(7, 'Technology', 'Technological equipment and devices'),
(8, 'Arts', 'Materials used for performing arts'),
(9, 'Science', 'Scientific laboratory equipment'),
(10, 'Sports', 'Materials used for sports and physical activities');

-- Material
INSERT INTO Material (idMaterial, itemName, quantity, itemType, idMaterialLoan, idMaterialType)
VALUES
(1, 'Books', 50, 'Educational', 1, 1),
(2, 'Sports Equipment', 20, 'Sports', 2, 2),
(3, 'Art Supplies', 30, 'Art', 3, 3),
(4, 'Lab Equipment', 15, 'Science', 4, 4),
(5, 'Musical Instruments', 40, 'Music', 5, 5),
(6, 'Chess Sets', 10, 'Board Games', 6, 6),
(7, 'Computers', 25, 'Technology', 7, 7),
(8, 'Theater Props', 15, 'Arts', 8, 8),
(9, 'Microscopes', 10, 'Science', 9, 9),
(10, 'Swimming Gear', 50, 'Sports', 10, 10);

-- TypeOfEmployee
INSERT INTO TypeOfEmployee (idTypeOfEmployee, benefits, "description", categoryemployee, idEmployee)
VALUES
(1, 'Healthcare, Paid Leave', 'Full-Time Employee', 'Administrative Staff', 1),
(2, 'Paid Leave', 'Part-Time Employee', 'Administrative Staff', 2),
(3, 'Paid Leave', 'Part-Time Employee', 'Administrative Staff', 3),
(4, 'Healthcare, Paid Leave', 'Full-Time Employee', 'Faculty', 4),
(5, 'Paid Leave', 'Part-Time Employee', 'Faculty', 5),
(6, 'Paid Leave', 'Part-Time Employee', 'Faculty', 6),
(7, 'Healthcare, Paid Leave', 'Full-Time Employee', 'Support Staff', 7),
(8, 'Paid Leave', 'Part-Time Employee', 'Support Staff', 8),
(9, 'Paid Leave', 'Part-Time Employee', 'Support Staff', 9),
(10, 'Healthcare, Paid Leave', 'Full-Time Employee', 'Physical Education Instructor', 10);


