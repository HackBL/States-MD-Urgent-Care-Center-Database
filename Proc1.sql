USE UrgentCareCenter
GO
/*
In this procedure, I would like to see how much each position of employee from center earns averagely in a state. 
The procedure will return current job title, avg earns, locations.
*/


CREATE PROC spAvgEarning
	@State		varchar(50) = NULL,
	@Position	varchar(50) = NULL
AS
IF @State IS NULL OR @Position IS NULL
	THROW 50001, 'Error due to  @State and @Positon require non-null values!', 1;

SELECT CurJob AS Position,  Centers.State AS State, AVG(Salary) AS 'Average Salary'
FROM Employees JOIN EmployeesInfo
	ON Employees.EmployeeID = EmployeesInfo.EmployeeID
JOIN Offices
	ON Offices.OfficeID = Employees.OfficeID
JOIN Departments
	ON Departments.DeptID = Offices.DeptID
JOIN Centers
	ON Centers.CenterID = Departments.CenterID
WHERE Centers.State LIKE @State AND
		CurJob LIKE @Position
GROUP BY CurJob, Centers.State;
GO


BEGIN TRY
	EXEC spAvgEarning 'NY', 'Physician'
END TRY
BEGIN CATCH
	PRINT 'An Error Occurred!';
	PRINT 'Error Number: ' + CONVERT(varchar, ERROR_NUMBER());
	PRINT 'Error Message: ' + CONVERT(varchar, ERROR_MESSAGE());
END CATCH