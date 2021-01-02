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

	SET IDENTITY_INSERT Employees ON
 	SET IDENTITY_INSERT Employees OFF


	INSERT INTO EmployeesInfo(EmployeeID, SSN, PastJob, CurJob, Salary, Benefits, ContractType, ContractTerm, Reviews)

	SET IDENTITY_INSERT Physicians ON
	INSERT Physicians(PhysicianID, EmployeeID, Type)
	VALUES (@PhysicianID, @EmployeeID, 'Family Physician');
	SET IDENTITY_INSERT Physicians OFF

COMMIT TRAN;