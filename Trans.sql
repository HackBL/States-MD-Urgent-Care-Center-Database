USE UrgentCareCenter
GO

IF EXISTS(SELECT * FROM sys.triggers
			WHERE OBJECT_ID = OBJECT_ID('Physician_New'))
DROP TRIGGER [dbo].[Physician_New]
GO

BEGIN TRAN
	DECLARE @EmployeeID int
	SELECT @EmployeeID = MAX(EmployeeID) + 1
	FROM Employees;

	DECLARE @PhysicianID int
	SELECT @PhysicianID = MAX(PhysicianID) + 1
	FROM Physicians;

	SET IDENTITY_INSERT Employees ON	INSERT INTO Employees(EmployeeID, OfficeID, FirstName, LastName, Address, apt, City, State, ZipCode, Phone, Email, WorkSchedule)	VALUES (@EmployeeID, 17, 'John', 'Han', '65 Walnet St', 'apt 6', 'San Francisco', 'CA', '94101', '(415)202-0395', 'JohnHan@abc.com', '8am - 7pm');
 	SET IDENTITY_INSERT Employees OFF


	INSERT INTO EmployeesInfo(EmployeeID, SSN, PastJob, CurJob, Salary, Benefits, ContractType, ContractTerm, Reviews)	VALUES (@EmployeeID, '182-28-1100', 'Physician', 'Physician', 103500, 'Health Insurance	', 'Cost Plus Contract', '3 years', 'Excellent');

	SET IDENTITY_INSERT Physicians ON
	INSERT Physicians(PhysicianID, EmployeeID, Type)
	VALUES (@PhysicianID, @EmployeeID, 'Family Physician');
	SET IDENTITY_INSERT Physicians OFF

COMMIT TRAN;