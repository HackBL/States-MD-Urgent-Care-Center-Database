USE UrgentCareCenter
GO

CREATE FUNCTION fnVisitedHospital
		(@checkIn	smalldatetime,
		 @checkOut	smalldatetime)
		 RETURNS TABLE

RETURN
	(SELECT Patients.LastName + ', ' + Patients.FirstName AS FullName,
			HospitalName, Date AS 'Visit Date'
	FROM Patients JOIN PatientHealthHistory
		ON Patients.PatientID = PatientHealthHistory.PatientID
	JOIN VisitHospital
		ON PatientHealthHistory.HealthHistoryID = VisitHospital.HealthHistoryID
	JOIN Hospitals
		ON VisitHospital.HospitalID = Hospitals.HospitalID
	WHERE Date BETWEEN @checkIn AND @checkOut);
GO

SELECT * FROM dbo.fnVisitedHospital('2020-07-01', '2020-12-12')
SELECT * FROM dbo.fnVisitedHospital('2020-05-01', '2020-08-13')
