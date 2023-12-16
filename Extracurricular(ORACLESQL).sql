-- Crear la tabla AccreditationControl
CREATE TABLE AccreditationControl 
(
    idAccreditation NUMBER PRIMARY KEY,
    credits NUMBER,
    serviceHours VARCHAR2(50),
    idStudent NUMBER,
    idClub NUMBER,
    status NUMBER DEFAULT 1
);

-- Crear la tabla AttendanceRecord
CREATE TABLE AttendanceRecord 
(
    AttendanceRecordId NUMBER PRIMARY KEY,
    "date" DATE,
    attended VARCHAR2(50),
    idStudent NUMBER,
    idClub NUMBER,
    status NUMBER DEFAULT 1
);

-- Crear la tabla Club
CREATE TABLE Club 
(
    idClub NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    classification VARCHAR2(50),
    idEmployee NUMBER,
    status NUMBER DEFAULT 1
);

-- Crear la tabla ClubStudent
CREATE TABLE ClubStudent 
(
    idClubStudent NUMBER PRIMARY KEY,
    idClub NUMBER,
    idStudent NUMBER,
    status NUMBER DEFAULT 1
);

-- Crear la tabla ClubSchedule
CREATE TABLE ClubSchedule 
(
    idClubSchedule NUMBER PRIMARY KEY,
    dayOfWeek DATE,
    startTime TIMESTAMP,
    endTime TIMESTAMP,
    idClub NUMBER,
    idEmployee NUMBER,
    status NUMBER DEFAULT 1
);

-- Crear la tabla Employee
CREATE TABLE Employee 
(
    idEmployee NUMBER PRIMARY KEY,
    firstName VARCHAR2(50),
    lastName VARCHAR2(50),
    middleName VARCHAR2(50),
    specialty VARCHAR2(50),
    status NUMBER DEFAULT 1
);

-- Crear la tabla Event
CREATE TABLE Event 
(
    idEvent NUMBER PRIMARY KEY,
    activityToPerform VARCHAR2(50),
    "date" DATE,
    idClub NUMBER,
    status NUMBER DEFAULT 1
);

-- Crear la tabla Expenses
CREATE TABLE Expenses 
(
    idExpenses NUMBER PRIMARY KEY,
    expenseDate DATE,
    amount NUMBER(10, 2),
    expenseDescription VARCHAR2(50),
    status NUMBER DEFAULT 1,
    idExpenseType NUMBER
);

-- Crear la tabla ExpenseType
CREATE TABLE ExpenseType 
(
    idExpenseType NUMBER PRIMARY KEY,
    expenseTypeName VARCHAR2(50),
    "description" VARCHAR2(50),
    status NUMBER DEFAULT 1
);

-- Crear la tabla ExtraCurricularScholarship
CREATE TABLE ExtraCurricularScholarship 
(
    idScholarship NUMBER PRIMARY KEY,
    scholarshipAmount NUMBER(10, 2),
    eligibilityRequirements NVARCHAR2(100),
    scholarshipDuration VARCHAR2(50),
    "description" NVARCHAR2(100),
    status NUMBER DEFAULT 1
);

-- Crear la tabla Facility
CREATE TABLE Facility 
(
    idFacility NUMBER PRIMARY KEY,
    facilityName VARCHAR2(50),
    capacity VARCHAR2(50),
    "location" VARCHAR2(50),
    "Availability" VARCHAR2(50),
    status NUMBER DEFAULT 1,
    idClub NUMBER
);

-- Crear la tabla Material
CREATE TABLE Material 
(
    idMaterial NUMBER PRIMARY KEY,
    itemName VARCHAR2(50),
    quantity NUMBER,
    itemType VARCHAR2(50),
    idMaterialLoan NUMBER,
    idMaterialType NUMBER,
    status NUMBER DEFAULT 1
);

-- Crear la tabla MaterialLoan
CREATE TABLE MaterialLoan 
(
    idMaterialLoan NUMBER PRIMARY KEY,
    specialty VARCHAR2(50),
    article VARCHAR2(50),
    entryDate DATE,
    exitDate DATE,
    materialStatus VARCHAR2(50),
    idStudent NUMBER,
    idEmployee NUMBER,
    status NUMBER DEFAULT 1
);

-- Crear la tabla MaterialType
CREATE TABLE MaterialType 
(
    idMaterialType NUMBER PRIMARY KEY,
    materialTypeName VARCHAR2(50),
    "description" VARCHAR2(50),
    status NUMBER DEFAULT 1
);

-- Crear la tabla Student
CREATE TABLE Student 
(
    idStudent NUMBER PRIMARY KEY,
    firstName VARCHAR2(50),
    middleName VARCHAR2(50),
    lastName VARCHAR2(50),
    specialty VARCHAR2(50),
    semester NUMBER,
    registrationNumber VARCHAR2(50),
    idScholarship NUMBER,
    status NUMBER DEFAULT 1
);

-- Crear la tabla TypeOfEmployee
CREATE TABLE TypeOfEmployee 
(
    idTypeOfEmployee NUMBER PRIMARY KEY,
    benefits VARCHAR2(50),
    "description" VARCHAR2(50),
    categoryemployee VARCHAR2(50),
    idEmployee NUMBER,
    status NUMBER DEFAULT 1
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
INSERT INTO ExtraCurricularScholarship (idScholarship, scholarshipAmount, eligibilityRequirements, scholarshipDuration, "description")
VALUES
(1, 1000.00, 'Maintain a GPA of 3.5 or higher', 'One academic year', 'Academic Excellence Scholarship');
(2, 800.00, 'Active participation in club activities', 'One academic year', 'Leadership Scholarship');
(3, 1200.00, 'Participate in at least three events', 'One academic year', 'Event Participation Scholarship');

-- Student
INSERT INTO Student (idStudent, firstName, middleName, lastName, specialty, semester, registrationNumber, idScholarship)
VALUES
(1, 'John', 'Edward', 'Doe', 'Computer Science', 3, 'CS12345', 1);
(2, 'Alice', 'Maria', 'Smith', 'Engineering', 2, 'ENG67890', 2);
(3, 'Bob', 'William', 'Johnson', 'Fine Arts', 4, 'FA34567', 3);
(4, 'Emily', 'Grace', 'Clark', 'Biology', 5, 'BIO78901', 1);
(5, 'Sarah', 'Jane', 'Wilson', 'Music', 2, 'MUS23456', 2);
(6, 'David', 'Thomas', 'Brown', 'Physics', 4, 'PHY67890', 3);
(7, 'Olivia', 'Sophia', 'Anderson', 'Computer Science', 2, 'CS23456', 1);
(8, 'Michael', 'Christopher', 'Davis', 'Drama', 3, 'DRM12345', 2);
(9, 'Emma', 'Grace', 'Harris', 'Chemistry', 6, 'CHE56789', 3);
(10, 'William', 'James', 'Lee', 'Physical Education', 2, 'PE23456', 1);

-- Employee
INSERT INTO Employee (idEmployee, firstName, lastName, middleName, specialty)
VALUES
(1, 'John', 'Smith', 'A.', 'Mathematics');
(2, 'Emily', 'Johnson', 'B.', 'Physical Education');
(3, 'Michael', 'Brown', 'C.', 'Art');
(4, 'Jessica', 'Davis', 'D.', 'Biology');
(5, 'Daniel', 'Miller', 'E.', 'Music');
(6, 'Sarah', 'Wilson', 'F.', 'Computer Science');
(7, 'Christopher', 'Jones', 'G.', 'Physics');
(8, 'Linda', 'Martinez', 'H.', 'Theater');
(9, 'David', 'Harris', 'I.', 'Engineering');
(10, 'Olivia', 'Clark', 'J.', 'Swimming');

-- Club
INSERT INTO Club (idClub, name, classification, idEmployee)
VALUES
(1, 'Math Club', 'Academic', 1);
(2, 'Soccer Club', 'Sports', 2);
(3, 'Art Club', 'Cultural', 3);
(4, 'Science Club', 'Academic', 1);
(5, 'Music Club', 'Cultural', 2);
(6, 'Chess Club', 'Academic', 3);
(7, 'Basketball Club', 'Sports', 1);
(8, 'Drama Club', 'Cultural', 2);
(9, 'Programming Club', 'Academic', 3);
(10, 'Swimming Club', 'Sports', 1);

-- AccreditationControl
INSERT INTO AccreditationControl (idAccreditation, credits, serviceHours, idStudent, idClub)
VALUES
(1, 30, '100 hours', 1, 1);
(2, 25, '80 hours', 2, 2);
(3, 35, '120 hours', 3, 1);
(4, 28, '90 hours', 4, 3);
(5, 33, '110 hours', 5, 2);
(6, 29, '95 hours', 6, 1);
(7, 31, '105 hours', 7, 3);
(8, 27, '88 hours', 8, 2);
(9, 32, '108 hours', 9, 3);
(10, 26, '82 hours', 10, 1);

-- AttendanceRecord
INSERT INTO AttendanceRecord (AttendanceRecordId, "date", attended, idStudent, idClub)
VALUES
(1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Yes', 1, 1);
(2, TO_DATE('2023-10-02', 'YYYY-MM-DD'), 'Yes', 2, 2);
(3, TO_DATE('2023-10-03', 'YYYY-MM-DD'), 'No', 3, 1);
(4, TO_DATE('2023-10-04', 'YYYY-MM-DD'), 'Yes', 4, 3);
(5, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 'Yes', 5, 2);
(6, TO_DATE('2023-10-06', 'YYYY-MM-DD'), 'No', 6, 1);
(7, TO_DATE('2023-10-07', 'YYYY-MM-DD'), 'Yes', 7, 3);
(8, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 'Yes', 8, 2);
(9, TO_DATE('2023-10-09', 'YYYY-MM-DD'), 'No', 9, 3);
(10, TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'Yes', 10, 1);

-- ClubStudent
INSERT INTO ClubStudent (idClubStudent, idClub, idStudent)
VALUES
(1, 1, 1);
(2, 2, 2);
(3, 1, 3);
(4, 3, 4);
(5, 2, 5);
(6, 1, 6);
(7, 3, 7);
(8, 2, 8);
(9, 3, 9);
(10, 1, 10);

-- ClubSchedule
INSERT INTO ClubSchedule (idClubSchedule, dayOfWeek, startTime, endTime, idClub, idEmployee)
VALUES
(1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), 1, 1);
(2, TO_DATE('2023-10-02', 'YYYY-MM-DD'), TO_TIMESTAMP('16:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), 2, 2);
(3, TO_DATE('2023-10-03', 'YYYY-MM-DD'), TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 1, 3);
(4, TO_DATE('2023-10-04', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), 3, 1);
(5, TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_TIMESTAMP('16:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), 2, 2);
(6, TO_DATE('2023-10-06', 'YYYY-MM-DD'), TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 1, 3);
(7, TO_DATE('2023-10-07', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), 3, 1);
(8, TO_DATE('2023-10-08', 'YYYY-MM-DD'), TO_TIMESTAMP('16:30:00', 'HH24:MI:SS'), TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), 2, 2);
(9, TO_DATE('2023-10-09', 'YYYY-MM-DD'), TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 3, 3);
(10, TO_DATE('2023-10-10', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), TO_TIMESTAMP('16:00:00', 'HH24:MI:SS'), 1, 1);

-- Event
INSERT INTO Event (idEvent, activityToPerform, "date", idClub)
VALUES
(1, 'Math Quiz', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 1);
(2, 'Soccer Match', TO_DATE('2023-10-20', 'YYYY-MM-DD'), 2);
(3, 'Art Exhibition', TO_DATE('2023-11-05', 'YYYY-MM-DD'), 3);
(4, 'Science Fair', TO_DATE('2023-10-18', 'YYYY-MM-DD'), 1);
(5, 'Music Concert', TO_DATE('2023-10-25', 'YYYY-MM-DD'), 2);
(6, 'Chess Tournament', TO_DATE('2023-11-10', 'YYYY-MM-DD'), 3);
(7, 'Basketball Game', TO_DATE('2023-10-30', 'YYYY-MM-DD'), 1);
(8, 'Drama Play', TO_DATE('2023-11-12', 'YYYY-MM-DD'), 2);
(9, 'Programming Workshop', TO_DATE('2023-11-02', 'YYYY-MM-DD'), 3);
(10, 'Swimming Competition', TO_DATE('2023-11-15', 'YYYY-MM-DD'), 1);

-- ExpenseType
INSERT INTO ExpenseType (idExpenseType, expenseTypeName, "description")
VALUES
(1, 'Advertisement', 'Expenses related to advertising');
(2, 'Transportation', 'Expenses related to transportation');
(3, 'Material', 'Expenses related to materials');

-- Expenses
INSERT INTO Expenses (idExpenses, expenseDate, amount, expenseDescription, idExpenseType)
VALUES
(1, TO_DATE('2023-10-15', 'YYYY-MM-DD'), 500.00, 'Advertisement', 1);
(2, TO_DATE('2023-10-20', 'YYYY-MM-DD'), 300.00, 'Transportation', 2);
(3, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 1000.00, 'Material', 1);
(4, TO_DATE('2023-10-18', 'YYYY-MM-DD'), 750.00, 'Advertisement', 2);
(5, TO_DATE('2023-10-25', 'YYYY-MM-DD'), 600.00, 'Transportation', 1);
(6, TO_DATE('2023-11-10', 'YYYY-MM-DD'), 400.00, 'Material', 2);
(7, TO_DATE('2023-10-30', 'YYYY-MM-DD'), 900.00, 'Advertisement', 1);
(8, TO_DATE('2023-11-12', 'YYYY-MM-DD'), 350.00, 'Transportation', 2);
(9, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 800.00, 'Material', 1);
(10, TO_DATE('2023-11-15', 'YYYY-MM-DD'), 700.00, 'Advertisement', 2);

-- Facility
INSERT INTO Facility (idFacility, facilityName, capacity, "location", "Availability", idClub)
VALUES
(1, 'Auditorium', '500', 'Main Building', 'Available', 1);
(2, 'Sports Field', '1000', 'Sports Complex', 'Occupied', 2);
(3, 'Art Studio', '50', 'Arts Building', 'Available', 3);
(4, 'Science Lab', '30', 'Science Building', 'Under Maintenance', 1);
(5, 'Music Room', '40', 'Arts Building', 'Available', 2);
(6, 'Chess Club Room', '20', 'Main Building', 'Available', 3);
(7, 'Basketball Court', '100', 'Sports Complex', 'Available', 1);
(8, 'Theater', '200', 'Arts Building', 'Occupied', 2);
(9, 'Computer Lab', '30', 'Science Building', 'Available', 3);
(10, 'Swimming Pool', '150', 'Sports Complex', 'Available', 1);

-- MaterialLoan
INSERT INTO MaterialLoan (idMaterialLoan, specialty, article, entryDate, exitDate, materialStatus, idStudent, idEmployee)
VALUES
(1, 'Education', 'Textbooks', TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'In Use', 1, 1);
(2, 'Sports', 'Basketballs', TO_DATE('2023-10-12', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 'In Use', 2, 2);
(3, 'Art', 'Paints and Brushes', TO_DATE('2023-10-08', 'YYYY-MM-DD'), TO_DATE('2023-10-22', 'YYYY-MM-DD'), 'In Use', 3, 3);
(4, 'Science', 'Microscopes', TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 'In Use', 4, 4);
(5, 'Music', 'Keyboards', TO_DATE('2023-10-10', 'YYYY-MM-DD'), TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'In Use', 5, 5);
(6, 'Board Games', 'Chess Sets', TO_DATE('2023-10-07', 'YYYY-MM-DD'), TO_DATE('2023-10-21', 'YYYY-MM-DD'), 'In Use', 6, 6);
(7, 'Technology', 'Laptops', TO_DATE('2023-10-14', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'In Use', 7, 7);
(8, 'Arts', 'Costumes', TO_DATE('2023-10-09', 'YYYY-MM-DD'), TO_DATE('2023-10-23', 'YYYY-MM-DD'), 'In Use', 8, 8);
(9, 'Science', 'Lab Equipment', TO_DATE('2023-10-20', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 'In Use', 9, 9);
(10, 'Sports', 'Swimming Gear', TO_DATE('2023-10-06', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'In Use', 10, 10);

-- MaterialType
INSERT INTO MaterialType (idMaterialType, materialTypeName, "description")
VALUES
(1, 'Educational', 'Materials used for educational purposes');
(2, 'Sports', 'Materials used for sports and games');
(3, 'Art', 'Materials used for artistic activities');
(4, 'Science', 'Materials used for scientific experiments');
(5, 'Music', 'Musical instruments and accessories');
(6, 'Board Games', 'Board games and accessories');
(7, 'Technology', 'Technological equipment and devices');
(8, 'Arts', 'Materials used for performing arts');
(9, 'Science', 'Scientific laboratory equipment');
(10, 'Sports', 'Materials used for sports and physical activities');

-- Material
INSERT INTO Material (idMaterial, itemName, quantity, itemType, idMaterialLoan, idMaterialType)
VALUES
(1, 'Books', 50, 'Educational', 1, 1);
(2, 'Sports Equipment', 20, 'Sports', 2, 2);
(3, 'Art Supplies', 30, 'Art', 3, 3);
(4, 'Lab Equipment', 15, 'Science', 4, 4);
(5, 'Musical Instruments', 40, 'Music', 5, 5);
(6, 'Chess Sets', 10, 'Board Games', 6, 6);
(7, 'Computers', 25, 'Technology', 7, 7);
(8, 'Theater Props', 15, 'Arts', 8, 8);
(9, 'Microscopes', 10, 'Science', 9, 9);
(10, 'Swimming Gear', 50, 'Sports', 10, 10);

-- TypeOfEmployee
INSERT INTO TypeOfEmployee (idTypeOfEmployee, benefits, "description", categoryemployee, idEmployee)
VALUES
(1, 'Healthcare, Paid Leave', 'Full-Time Employee', 'Administrative Staff', 1);
(2, 'Paid Leave', 'Part-Time Employee', 'Administrative Staff', 2);
(3, 'Paid Leave', 'Part-Time Employee', 'Administrative Staff', 3);
(4, 'Healthcare, Paid Leave', 'Full-Time Employee', 'Faculty', 4);
(5, 'Paid Leave', 'Part-Time Employee', 'Faculty', 5);
(6, 'Paid Leave', 'Part-Time Employee', 'Faculty', 6);
(7, 'Healthcare, Paid Leave', 'Full-Time Employee', 'Support Staff', 7);
(8, 'Paid Leave', 'Part-Time Employee', 'Support Staff', 8);
(9, 'Paid Leave', 'Part-Time Employee', 'Support Staff', 9);
(10, 'Healthcare, Paid Leave', 'Full-Time Employee', 'Physical Education Instructor', 10);

