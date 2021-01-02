USE UrgentCareCenter
GO

CREATE TRIGGER Patients_INSERT_UPDATE
	ON Patients
	AFTER INSERT, UPDATE
AS
	UPDATE Patients
	SET State = UPPER(State)
	WHERE PatientID IN (SELECT PatientID FROM inserted);
GO

SET IDENTITY_INSERT Patients ON
INSERT Patients(PatientID, FirstName, LastName, Gender, Address, apt, City, State, ZipCode, Phone, Email, DOB)
VALUES
(6, 'John', 'Lee', 'Male', '456 3rd Ave', 'apt 5' ,'Syracuse', 'ny', '13201', '(315)202-8371', 'JohnLee@abc.com', '1985-10-12');
SET IDENTITY_INSERT Patients ON
GO


SELECT * FROM Patients
WHERE PatientID = 6