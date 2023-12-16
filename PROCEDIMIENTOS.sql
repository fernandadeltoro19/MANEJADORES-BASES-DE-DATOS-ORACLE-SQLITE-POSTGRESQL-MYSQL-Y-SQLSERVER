---------------------
--PROCEDIMIENTOS
---------------------

--AccreditationControl
--Cargar
CREATE PROCEDURE GetAccreditationData
AS
BEGIN
    SELECT idAccreditation, credits, serviceHours, idStudent, idClub, status
    FROM AccreditationControl
    WHERE status <> 0; 
END;
GO

--Insertar
CREATE PROCEDURE InsertAccreditation
    @credits INT,
    @serviceHours VARCHAR(50),
    @idStudent INT,
    @idClub INT
AS
BEGIN
    INSERT INTO AccreditationControl (credits, serviceHours, idStudent, idClub)
    VALUES (@credits, @serviceHours, @idStudent, @idClub)
END;
GO

--Actualizar
CREATE PROCEDURE UpdateAccreditationData
    @idAccreditation INT,
    @credits INT,
    @serviceHours VARCHAR(50),
    @idStudent INT,
    @idClub INT
AS
BEGIN
    UPDATE AccreditationControl
    SET credits = @credits,
        serviceHours = @serviceHours,
        idStudent = @idStudent,
        idClub = @idClub
    WHERE idAccreditation = @idAccreditation;
END;
GO

--Eliminar
CREATE PROCEDURE UpdateAccreditationStatus
    @idAccreditation INT
AS
BEGIN
    UPDATE AccreditationControl
    SET status = 0
    WHERE idAccreditation = @idAccreditation;
END;
Go

-----------------------------------------------------------
--AttendanceRecord

--Insertar
CREATE PROCEDURE CreateAttendanceRecord
    @date DATE,
    @attended VARCHAR(50),
    @idStudent INT,
    @idClub INT
AS
BEGIN
    INSERT INTO AttendanceRecord ([date], attended, idStudent, idClub)
    VALUES (@date, @attended, @idStudent, @idClub);
END;
GO 

--Cargar
CREATE PROCEDURE GetAttendanceRecords
AS
BEGIN
    SELECT AttendanceRecordId, [date], attended, idStudent, idClub, status
    FROM AttendanceRecord
	WHERE status <> 0; 
END;
GO

--Actualizar
CREATE PROCEDURE UpdateAttendanceRecord
    @AttendanceRecordId INT,
    @date DATE,
    @attended VARCHAR(50),
    @idStudent INT,
    @idClub INT
AS
BEGIN
    UPDATE AttendanceRecord
    SET [date] = @date,
        attended = @attended,
        idStudent = @idStudent,
        idClub = @idClub
    WHERE AttendanceRecordId = @AttendanceRecordId;
END;
GO 

--Eliminar
CREATE PROCEDURE DeleteAttendanceRecord
    @AttendanceRecordId INT
AS
BEGIN
    UPDATE AttendanceRecord
    SET status = 0
    WHERE AttendanceRecordId = @AttendanceRecordId;
END;
GO 

--Club
CREATE PROCEDURE InsertClub
    @name VARCHAR(50),
    @classification VARCHAR(50),
    @idEmployee INT
AS
BEGIN
    INSERT INTO Club (name, classification, idEmployee)
    VALUES (@name, @classification, @idEmployee)
END;
GO 

--Cargar
CREATE PROCEDURE GetClubs
AS
BEGIN
    SELECT idClub, name, classification, idEmployee, status
    FROM Club
END;
GO 

--Actualizar
CREATE PROCEDURE UpdateClub
    @idClub INT,
    @name VARCHAR(50),
    @classification VARCHAR(50),
    @idEmployee INT
AS
BEGIN
    UPDATE Club
    SET name = @name,
        classification = @classification,
        idEmployee = @idEmployee
    WHERE idClub = @idClub;
END;
GO 

--Eliminar
CREATE PROCEDURE DeleteClub
    @idClub INT
AS
BEGIN
    UPDATE Club
    SET status = 0
    WHERE idClub = @idClub;
END;
GO 

--ClubStudent
--Insertar
CREATE PROCEDURE CreateClubStudent
    @idClub INT,
    @idStudent INT
AS
BEGIN
    INSERT INTO ClubStudent (idClub, idStudent)
    VALUES (@idClub, @idStudent);
END;
GO 

--Cargar
CREATE PROCEDURE GetClubStudents
AS
BEGIN
    SELECT idClubStudent, idClub, idStudent, status
    FROM ClubStudent
	WHERE status <> 0;
END;
GO 

--Actualizar
CREATE PROCEDURE UpdateClubStudent
    @idClubStudent INT,
    @idClub INT,
    @idStudent INT
AS
BEGIN
    UPDATE ClubStudent
    SET idClub = @idClub,
        idStudent = @idStudent
    WHERE idClubStudent = @idClubStudent;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteClubStudent
    @idClubStudent INT
AS
BEGIN
    UPDATE ClubStudent
    SET status = 0
    WHERE idClubStudent = @idClubStudent;
END;
GO 

--ClubSchedule
--Insertar
CREATE PROCEDURE CreateClubSchedule
    @dayOfWeek DATE,
    @startTime DATETIME,
    @endTime DATETIME,
    @idClub INT,
    @idEmployee INT
AS
BEGIN
    INSERT INTO ClubSchedule (dayOfWeek, startTime, endTime, idClub, idEmployee)
    VALUES (@dayOfWeek, @startTime, @endTime, @idClub, @idEmployee);
END;
GO 

--Cargar
CREATE PROCEDURE GetClubSchedules
AS
BEGIN
    SELECT idClubSchedule, dayOfWeek, startTime, endTime, idClub, idEmployee, status
    FROM ClubSchedule
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateClubSchedule
    @idClubSchedule INT,
    @dayOfWeek DATE,
    @startTime DATETIME,
    @endTime DATETIME,
    @idClub INT,
    @idEmployee INT
AS
BEGIN
    UPDATE ClubSchedule
    SET dayOfWeek = @dayOfWeek,
        startTime = @startTime,
        endTime = @endTime,
        idClub = @idClub,
        idEmployee = @idEmployee
    WHERE idClubSchedule = @idClubSchedule;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteClubSchedule
    @idClubSchedule INT
AS
BEGIN
    UPDATE ClubSchedule
    SET status = 0
    WHERE idClubSchedule = @idClubSchedule;
END;
GO

--Employee

--Insertar
CREATE PROCEDURE CreateEmployee
    @firstName VARCHAR(50),
    @lastName VARCHAR(50),
    @middleName VARCHAR(50),
    @specialty VARCHAR(50)
AS
BEGIN
    INSERT INTO Employee (firstName, lastName, middleName, specialty)
    VALUES (@firstName, @lastName, @middleName, @specialty);
END;
GO

--Cargar
CREATE PROCEDURE GetEmployees
AS
BEGIN
    SELECT idEmployee, firstName, lastName, middleName, specialty, status
    FROM Employee
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateEmployee
    @idEmployee INT,
    @firstName VARCHAR(50),
    @lastName VARCHAR(50),
    @middleName VARCHAR(50),
    @specialty VARCHAR(50)
AS
BEGIN
    UPDATE Employee
    SET firstName = @firstName,
        lastName = @lastName,
        middleName = @middleName,
        specialty = @specialty
    WHERE idEmployee = @idEmployee;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteEmployee
    @idEmployee INT
AS
BEGIN
    UPDATE Employee
    SET status = 0
    WHERE idEmployee = @idEmployee;
END;
GO

--Event
CREATE PROCEDURE CreateEvent
    @activityToPerform VARCHAR(50),
    @date DATE,
    @idClub INT
AS
BEGIN
    INSERT INTO Event (activityToPerform, [date], idClub)
    VALUES (@activityToPerform, @date, @idClub);
END;
GO

--Cargar
CREATE PROCEDURE GetEvents
AS
BEGIN
    SELECT idEvent, activityToPerform, [date], idClub, status
    FROM Event
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateEvent
    @idEvent INT,
    @activityToPerform VARCHAR(50),
    @date DATE,
    @idClub INT
AS
BEGIN
    UPDATE Event
    SET activityToPerform = @activityToPerform,
        [date] = @date,
        idClub = @idClub
    WHERE idEvent = @idEvent;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteEvent
    @idEvent INT
AS
BEGIN
    UPDATE Event
    SET status = 0
    WHERE idEvent = @idEvent;
END;
GO

--Expenses

--insertar
CREATE PROCEDURE CreateExpense
    @expenseDate DATE,
    @amount DECIMAL(10, 2),
    @expenseDescription VARCHAR(50),
    @idExpenseType INT
AS
BEGIN
    INSERT INTO Expenses (expenseDate, amount, expenseDescription, idExpenseType)
    VALUES (@expenseDate, @amount, @expenseDescription, @idExpenseType);
END;
GO

--Cargar
CREATE PROCEDURE GetExpenses
AS
BEGIN
    SELECT idExpenses, expenseDate, amount, expenseDescription, status, idExpenseType
    FROM Expenses
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateExpense
    @idExpenses INT,
    @expenseDate DATE,
    @amount DECIMAL(10, 2),
    @expenseDescription VARCHAR(50),
    @idExpenseType INT
AS
BEGIN
    UPDATE Expenses
    SET expenseDate = @expenseDate,
        amount = @amount,
        expenseDescription = @expenseDescription,
        idExpenseType = @idExpenseType
    WHERE idExpenses = @idExpenses;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteExpense
    @idExpenses INT
AS
BEGIN
    UPDATE Expenses
    SET status = 0
    WHERE idExpenses = @idExpenses;
END;
GO

--ExpenseType

--Insertar
CREATE PROCEDURE CreateExpenseType
    @expenseTypeName VARCHAR(50),
    @description VARCHAR(50)
AS
BEGIN
    INSERT INTO ExpenseType (expenseTypeName, [description])
    VALUES (@expenseTypeName, @description);
END;
GO

--Cargar
CREATE PROCEDURE GetExpenseTypes
AS
BEGIN
    SELECT idExpenseType, expenseTypeName, [description], status
    FROM ExpenseType
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateExpenseType
    @idExpenseType INT,
    @expenseTypeName VARCHAR(50),
    @description VARCHAR(50)
AS
BEGIN
    UPDATE ExpenseType
    SET expenseTypeName = @expenseTypeName,
        [description] = @description
    WHERE idExpenseType = @idExpenseType;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteExpenseType
    @idExpenseType INT
AS
BEGIN
    UPDATE ExpenseType
    SET status = 0
    WHERE idExpenseType = @idExpenseType;
END;
GO

--ExtraCurricularScholarship

--Insertar
CREATE PROCEDURE CreateScholarship
    @scholarshipAmount DECIMAL(10, 2),
    @eligibilityRequirements NVARCHAR(100),
    @scholarshipDuration VARCHAR(50),
    @description NVARCHAR(100)
AS
BEGIN
    INSERT INTO ExtraCurricularScholarship (scholarshipAmount, eligibilityRequirements, scholarshipDuration, [description])
    VALUES (@scholarshipAmount, @eligibilityRequirements, @scholarshipDuration, @description);
END;
GO

--Cargar
CREATE PROCEDURE GetScholarships
AS
BEGIN
    SELECT idScholarship, scholarshipAmount, eligibilityRequirements, scholarshipDuration, [description], status
    FROM ExtraCurricularScholarship
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateScholarship
    @idScholarship INT,
    @scholarshipAmount DECIMAL(10, 2),
    @eligibilityRequirements NVARCHAR(100),
    @scholarshipDuration VARCHAR(50),
    @description NVARCHAR(100)
AS
BEGIN
    UPDATE ExtraCurricularScholarship
    SET scholarshipAmount = @scholarshipAmount,
        eligibilityRequirements = @eligibilityRequirements,
        scholarshipDuration = @scholarshipDuration,
        [description] = @description
    WHERE idScholarship = @idScholarship;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteScholarship
    @idScholarship INT
AS
BEGIN
    UPDATE ExtraCurricularScholarship
    SET status = 0
    WHERE idScholarship = @idScholarship;
END;
GO

--Facility

--Insertar
CREATE PROCEDURE CreateFacility
    @facilityName VARCHAR(50),
    @capacity VARCHAR(50),
    @location VARCHAR(50),
    @Availability VARCHAR(50),
    @idClub INT
AS
BEGIN
    INSERT INTO Facility (facilityName, capacity, [location], [Availability], idClub)
    VALUES (@facilityName, @capacity, @location, @Availability, @idClub);
END;
GO

--Cargar
CREATE PROCEDURE GetFacilities
AS
BEGIN
    SELECT idFacility, facilityName, capacity, [location], [Availability], status, idClub
    FROM Facility
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateFacility
    @idFacility INT,
    @facilityName VARCHAR(50),
    @capacity VARCHAR(50),
    @location VARCHAR(50),
    @Availability VARCHAR(50),
    @idClub INT
AS
BEGIN
    UPDATE Facility
    SET facilityName = @facilityName,
        capacity = @capacity,
        [location] = @location,
        [Availability] = @Availability,
        idClub = @idClub
    WHERE idFacility = @idFacility;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteFacility
    @idFacility INT
AS
BEGIN
    UPDATE Facility
    SET status = 0
    WHERE idFacility = @idFacility;
END;
GO

--Material

--Insertar
CREATE PROCEDURE CreateMaterial
    @itemName VARCHAR(50),
    @quantity INT,
    @itemType VARCHAR(50),
    @idMaterialLoan INT,
    @idMaterialType INT
AS
BEGIN
    INSERT INTO Material (itemName, quantity, itemType, idMaterialLoan, idMaterialType)
    VALUES (@itemName, @quantity, @itemType, @idMaterialLoan, @idMaterialType);
END;
GO

--Cargar
CREATE PROCEDURE GetMaterials
AS
BEGIN
    SELECT idMaterial, itemName, quantity, itemType, idMaterialLoan, idMaterialType, status
    FROM Material
	WHERE status <> 0;

END;
GO

--Actualizar
CREATE PROCEDURE UpdateMaterial
    @idMaterial INT,
    @itemName VARCHAR(50),
    @quantity INT,
    @itemType VARCHAR(50),
    @idMaterialLoan INT,
    @idMaterialType INT
AS
BEGIN
    UPDATE Material
    SET itemName = @itemName,
        quantity = @quantity,
        itemType = @itemType,
        idMaterialLoan = @idMaterialLoan,
        idMaterialType = @idMaterialType
    WHERE idMaterial = @idMaterial;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteMaterial
    @idMaterial INT
AS
BEGIN
    UPDATE Material
    SET status = 0
    WHERE idMaterial = @idMaterial;
END;
GO

--MaterialLoan

--Insertar
CREATE PROCEDURE CreateMaterialLoan
    @specialty VARCHAR(50),
    @article VARCHAR(50),
    @entryDate DATE,
    @exitDate DATE,
    @materialStatus VARCHAR(50),
    @idStudent INT,
    @idEmployee INT
AS
BEGIN
    INSERT INTO MaterialLoan (specialty, article, entryDate, exitDate, materialStatus, idStudent, idEmployee)
    VALUES (@specialty, @article, @entryDate, @exitDate, @materialStatus, @idStudent, @idEmployee);
END;
GO

--Cargar
CREATE PROCEDURE GetMaterialLoans
AS
BEGIN
    SELECT idMaterialLoan, specialty, article, entryDate, exitDate, materialStatus, idStudent, idEmployee, status
    FROM MaterialLoan
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateMaterialLoan
    @idMaterialLoan INT,
    @specialty VARCHAR(50),
    @article VARCHAR(50),
    @entryDate DATE,
    @exitDate DATE,
    @materialStatus VARCHAR(50),
    @idStudent INT,
    @idEmployee INT
AS
BEGIN
    UPDATE MaterialLoan
    SET specialty = @specialty,
        article = @article,
        entryDate = @entryDate,
        exitDate = @exitDate,
        materialStatus = @materialStatus,
        idStudent = @idStudent,
        idEmployee = @idEmployee
    WHERE idMaterialLoan = @idMaterialLoan;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteMaterialLoan
    @idMaterialLoan INT
AS
BEGIN
    UPDATE MaterialLoan
    SET status = 0
    WHERE idMaterialLoan = @idMaterialLoan;
END;
GO

--MaterialType

--Insertar
CREATE PROCEDURE CreateMaterialType
    @materialTypeName VARCHAR(50),
    @description VARCHAR(50)
AS
BEGIN
    INSERT INTO MaterialType (materialTypeName, [description])
    VALUES (@materialTypeName, @description);
END;
GO

--Cargar
CREATE PROCEDURE GetMaterialTypes
AS
BEGIN
    SELECT idMaterialType, materialTypeName, [description], status
    FROM MaterialType
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateMaterialType
    @idMaterialType INT,
    @materialTypeName VARCHAR(50),
    @description VARCHAR(50)
AS
BEGIN
    UPDATE MaterialType
    SET materialTypeName = @materialTypeName,
        [description] = @description
    WHERE idMaterialType = @idMaterialType;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteMaterialType
    @idMaterialType INT
AS
BEGIN
    UPDATE MaterialType
    SET status = 0
    WHERE idMaterialType = @idMaterialType;
END;
GO

--Student

--Insertar
CREATE PROCEDURE CreateStudent
    @firstName VARCHAR(50),
    @middleName VARCHAR(50),
    @lastName VARCHAR(50),
    @specialty VARCHAR(50),
    @semester INT,
    @registrationNumber VARCHAR(50),
    @idScholarship INT
AS
BEGIN
    INSERT INTO Student (firstName, middleName, lastName, specialty, semester, registrationNumber, idScholarship)
    VALUES (@firstName, @middleName, @lastName, @specialty, @semester, @registrationNumber, @idScholarship);
END;
GO

--Cargar
CREATE PROCEDURE GetStudents
AS
BEGIN
    SELECT idStudent, firstName, middleName, lastName, specialty, semester, registrationNumber, idScholarship, status
    FROM Student

END;
GO

--Actualizar
CREATE PROCEDURE UpdateStudent
    @idStudent INT,
    @firstName VARCHAR(50),
    @middleName VARCHAR(50),
    @lastName VARCHAR(50),
    @specialty VARCHAR(50),
    @semester INT,
    @registrationNumber VARCHAR(50),
    @idScholarship INT
AS
BEGIN
    UPDATE Student
    SET firstName = @firstName,
        middleName = @middleName,
        lastName = @lastName,
        specialty = @specialty,
        semester = @semester,
        registrationNumber = @registrationNumber,
        idScholarship = @idScholarship
    WHERE idStudent = @idStudent;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteStudent
    @idStudent INT
AS
BEGIN
    UPDATE Student
    SET status = 0
    WHERE idStudent = @idStudent;
END;
GO

--TypeofEmployee

--Insertar
CREATE PROCEDURE CreateTypeOfEmployee
    @benefits VARCHAR(50),
    @description VARCHAR(50),
    @categoryemployee VARCHAR(50),
    @idEmployee INT
AS
BEGIN
    INSERT INTO TypeOfEmployee (benefits, [description], categoryemployee, idEmployee)
    VALUES (@benefits, @description, @categoryemployee, @idEmployee);
END;
GO

--Cargar
CREATE PROCEDURE GetTypeOfEmployees
AS
BEGIN
    SELECT idTypeOfEmployee, benefits, [description], categoryemployee, idEmployee, status
    FROM TypeOfEmployee
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateTypeOfEmployee
    @idTypeOfEmployee INT,
    @benefits VARCHAR(50),
    @description VARCHAR(50),
    @categoryemployee VARCHAR(50),
    @idEmployee INT
AS
BEGIN
    UPDATE TypeOfEmployee
    SET benefits = @benefits,
        [description] = @description,
        categoryemployee = @categoryemployee,
        idEmployee = @idEmployee
    WHERE idTypeOfEmployee = @idTypeOfEmployee;
END
GO

--Eliminar
CREATE PROCEDURE DeleteTypeOfEmployee
    @idTypeOfEmployee INT
AS
BEGIN
    UPDATE TypeOfEmployee
    SET status = 0
    WHERE idTypeOfEmployee = @idTypeOfEmployee;
END
