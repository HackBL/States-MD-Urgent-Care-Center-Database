USE UrgentCareCenter
GO

-- Have all permissions for the DB
CREATE ROLE AdminEntry	
ALTER ROLE db_owner ADD MEMBER AdminEntry;
GO

-- Have permissions on attenting between Physicians and Patients
CREATE ROLE PhysicianEntry	
GRANT UPDATE, INSERT, DELETE, SELECT ON Attending TO PhysicianEntry;
GO

-- Have permissions to view and manipulate patients' health history information
CREATE ROLE RNEntry
GRANT UPDATE, INSERT, DELETE, SELECT ON PatientHealthHistory TO RNEntry;
GRANT UPDATE, INSERT, DELETE, SELECT ON Vitals TO RNEntry;
GRANT UPDATE, INSERT, DELETE, SELECT ON Discharge TO RNEntry;
GRANT UPDATE, INSERT, DELETE, SELECT ON Testing TO RNEntry;
GO

-- Have permissions to view and manipulate patients' information and their health insurance
CREATE ROLE ReceptionistEntry
GRANT UPDATE, INSERT, DELETE, SELECT ON Patients TO ReceptionistEntry;
GRANT SELECT ON PatientHealthHistory TO ReceptionistEntry;
GRANT SELECT ON HealthInsurance TO ReceptionistEntry;
GRANT SELECT ON InsuranceCompany TO ReceptionistEntry;
GRANT SELECT ON Coverages TO ReceptionistEntry;
GO

-- Have permissions to view patients' billing and their health insurance coverages. 
CREATE ROLE AccountingEntry
GRANT SELECT ON Patients TO AccountingEntry;
GRANT SELECT ON Billing TO AccountingEntry;
GRANT SELECT ON HealthInsurance TO AccountingEntry;
GRANT SELECT ON Coverages TO AccountingEntry;
GO







