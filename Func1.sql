USE UrgentCareCenter
GO
/*
In this function, I would like to see each patient spent after insurance whoever has insurance or not, 
which means that the (total cost in billing - insurance coverage + insurance they paid).
The function returns Patient info, what disease he/she got, items he/she used, and balance due. 
*/

CREATE FUNCTION fnMaxCost()
	RETURNS TABLE

RETURN 
	(SELECT LastName + ', ' + FirstName AS FullName,
		Test, Items, PayOr, TotalCharge - IsNull(CoveragePrice, 0) + IsNull(Cost, 0) AS BalanceDue
	FROM Patients JOIN Billing
		ON Patients.PatientID = Billing.BillID
	JOIN Testing
		ON Patients.PatientID = Testing.TestingID
	LEFT JOIN HealthInsurance
		ON Patients.PatientID = HealthInsurance.PatientID
	LEFT JOIN Coverages
		ON HealthInsurance.HealthInsuranceID = Coverages.HealthInsuranceID);
GO

SELECT * FROM dbo.fnMaxCost()
ORDER BY BalanceDue DESC