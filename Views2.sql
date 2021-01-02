USE UrgentCareCenter
GO
/*
In this view, I select which center did patients go based on PatientHealthHistory and their attending physicians.
The views returns patients info and center info
*/

CREATE VIEW WherePatientWent
AS
SELECT DISTINCT Patients.LastName + ', ' + Patients.FirstName AS Patient, Gender, CenterName, 
		 Centers.Address + ', ' + Centers.City + ', ' + Centers.State + ', ' + Centers.ZipCode AS 'Center Location'
FROM Patients JOIN PatientHealthHistory
	ON Patients.PatientID = PatientHealthHistory.PatientID
JOIN Attending
	ON PatientHealthHistory.HealthHistoryID = Attending.HealthHistoryID
JOIN Physicians
	ON Physicians.PhysicianID = Attending.PhysicianID
JOIN Employees
	ON Employees.EmployeeID = Physicians.EmployeeID
JOIN Offices
	ON Employees.OfficeID = Offices.OfficeID
JOIN Departments
	ON Offices.DeptID = Departments.DeptID
JOIN Centers
	ON Centers.CenterID = Departments.CenterID;
GO

SELECT * FROM WherePatientWent;