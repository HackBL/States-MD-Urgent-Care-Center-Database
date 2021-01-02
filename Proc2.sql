USE UrgentCareCenter
GO
/*
In this procedure, I would like to find out the total earning of a medication based on patients spent.
The procedure returns medication name, Total Earn, number of sold.
*/

CREATE PROC MedicationEarns
	@Name varchar(50) = '%'
AS

SELECT MedicalName, SUM(Price) AS Earn, COUNT(Medications.MedicationID) AS 'Number of sold'
FROM PatientHealthHistory JOIN Costs
	ON PatientHealthHistory.HealthHistoryID = Costs.HealthHistoryID
JOIN Medications
	ON Medications.MedicationID = Costs.MedicationID
GROUP BY MedicalName
	HAVING MedicalName LIKE @Name;
GO

EXEC MedicationEarns 'Ambien';
EXEC MedicationEarns 'Aspirin';
EXEC MedicationEarns 'Tylenol%';
EXEC MedicationEarns 'Ibuprofen';



