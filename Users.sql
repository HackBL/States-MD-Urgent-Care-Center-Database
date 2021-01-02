USE UrgentCareCenter
GO

-- Assign Robert as administrator to manage all database
CREATE LOGIN Administrator WITH PASSWORD = '123456',
DEFAULT_DATABASE = UrgentCareCenter;
CREATE USER Robert FOR LOGIN Administrator;
ALTER ROLE AdminEntry ADD MEMBER Robert;
GO

-- Assign Berglund as one of the physicians to manage attending between physicians and patients
CREATE LOGIN Physician WITH PASSWORD = '123456',
DEFAULT_DATABASE = UrgentCareCenter;
CREATE USER Berglund FOR LOGIN Physician;
ALTER ROLE PhysicianEntry ADD MEMBER Berglund;
GO

-- Assign Emma as one of the RNs to manage patients' health history information
CREATE LOGIN Nurse WITH PASSWORD = '123456',
DEFAULT_DATABASE = UrgentCareCenter;
CREATE USER Emma FOR LOGIN Nurse;
ALTER ROLE RNEntry ADD MEMBER Emma;
GO

-- Assign John as receptionist to view and manipulate patients' information and their health insurance
CREATE LOGIN Reception WITH PASSWORD = '123456',
DEFAULT_DATABASE = UrgentCareCenter;
CREATE USER John FOR LOGIN Reception;
ALTER ROLE ReceptionistEntry ADD MEMBER John;
GO

-- Assign Kevin as Accounting to view patients' billing and their health insurance coverages
CREATE LOGIN Accounting WITH PASSWORD = '123456',
DEFAULT_DATABASE = UrgentCareCenter;
CREATE USER Kevin FOR LOGIN Accounting;
ALTER ROLE AccountingEntry ADD MEMBER Kevin;
GO