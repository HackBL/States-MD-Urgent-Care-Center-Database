USE UrgentCareCenter
GO
/*
In this view, we could find out which center, department and office each physician works.
We use this view to help futher patients find physicians easier by their locations. 
The view returns physician Locations as well as physician information
*/	
CREATE VIEW PhysicianLoc
AS
SELECT Employees.LastName + ', ' + Employees.FirstName AS Physician, 
		Type, WorkSchedule, CenterName, 
		Centers.Address + ', ' + Centers.City + ', ' + Centers.State + ', ' + Centers.ZipCode AS 'Center Location',
		Departments.Location AS 'Department Location',  Offices.OfficeNum AS 'Room Number'
FROM Physicians JOIN Employees
	ON Employees.EmployeeID = Physicians.EmployeeID
JOIN Offices
	ON Offices.OfficeID = Employees.EmployeeID
JOIN Departments
	ON Departments.DeptID = Offices.DeptID
JOIN Centers
	ON Centers.CenterID = Departments.CenterID;
GO

SELECT * FROM PhysicianLoc;