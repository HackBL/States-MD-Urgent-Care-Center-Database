USE UrgentCareCenter
GO
/*
In this view, I would like to find out how much each paitent paid for medications as total. 
It's important to know how much each patient spent on their medications.
*/	

CREATE VIEW MedicationsCost
AS
SELECT LastName + ', ' + FirstName AS FullName, SUM(Price) AS TotalCost
FROM Patients JOIN PatientHealthHistory
	ON Patients.PatientID = PatientHealthHistory.PatientID
JOIN Costs
	ON PatientHealthHistory.HealthHistoryID = Costs.HealthHistoryID
JOIN Medications	
	ON Costs.MedicationID = Medications.MedicationID
GROUP BY LastName, FirstName;
GO

SELECT * FROM MedicationsCost;