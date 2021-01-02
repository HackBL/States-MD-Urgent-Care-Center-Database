USE UrgentCareCenter
GO
/*
In this trigger, every patient has to have billing information.
So the trigger avoids billing of patients to be deleted. 
Once billing is deleted without deleting corresponse patient, it will throw error
*/

CREATE TRIGGER Billing_DELETE_RI
	ON Billing
	AFTER DELETE
AS
	IF EXISTS (SELECT * FROM Deleted JOIN Patients
					ON Deleted.BillID = Patients.PatientID)
		BEGIN
			;
			THROW 50002, 'BillingID in use.', 1;
			ROLLBACK TRAN;
		END;
GO

DELETE FROM Billing
WHERE BillID = 1