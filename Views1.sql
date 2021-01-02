USE UrgentCareCenter
GO
/*
In this view, I select patients who only have insurance. 
The view returns some of patients information and their insurances coverage details.
*/	

CREATE VIEW PatientInsurance
AS
SELECT FirstName + ' ' + LastName AS FullName, Gender, DOB, CoverageDetials, CoveragePrice
FROM Patients JOIN HealthInsurance
	ON Patients.PatientID = HealthInsurance.PatientID
JOIN Coverages
	ON HealthInsurance.HealthInsuranceID = Coverages.HealthInsuranceID;
GO

SELECT * FROM PatientInsurance;