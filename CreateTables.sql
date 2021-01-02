USE UrgentCareCenter

-- Center Table
CREATE TABLE Centers (
	CenterID			int				NOT NULL	IDENTITY(1,1),
	CenterName			varchar(100)	NOT NULL,
	BusinessHour		varchar(100)	NOT NULL,
	ProcedureCapacity	int				NOT NULL
										CHECK (ProcedureCapacity >= 0),
	Location			varchar(100)	NOT NULL,
	Address				varchar(50)		NOT NULL,
	City				varchar(50)		NOT NULL,
	State				varchar(50)		NOT NULL,
	ZipCode				varchar(50)		NOT NULL,
	Phone				varchar(50)		NOT NULL
										CHECK (Phone LIKE '(___)___-____'),

	CONSTRAINT	PK_Center	PRIMARY KEY	CLUSTERED(CenterID ASC)
);

-- Facility Table
CREATE TABLE Facilities (
	RoomID		int			NOT NULL	IDENTITY(1,1),
	CenterID	int			NOT NULL,
	RoomType	varchar(50)	NOT NULL,

	CONSTRAINT PK_Facility			PRIMARY KEY	CLUSTERED(RoomID ASC),
	CONSTRAINT FK_Facility_Center	FOREIGN KEY(CenterID)	REFERENCES Centers(CenterID)
);

-- Medical Equipments Table
CREATE TABLE MedicalEquipments (
	EquipmentID		int				NOT NULL	IDENTITY(1,1),
	CenterID		int				NOT NULL,
	EquipmentName	varchar(100)	NOT NULL,
	Uses			varchar(200)	NOT NULL,

	CONSTRAINT	PK_Equipment		PRIMARY KEY	CLUSTERED(EquipmentID ASC),
	CONSTRAINT	FK_Equipment_Center	FOREIGN KEY(CenterID)	REFERENCES Centers(CenterID)
);

-- Departments Table
CREATE TABLE Departments (
	DeptID		int			NOT NULL	IDENTITY(1,1),
	CenterID	int			NOT NULL,
	DeptName	varchar(50)	NOT NULL,
	Location	varchar(50)	NOT NULL,

	CONSTRAINT	PK_Department	PRIMARY KEY	CLUSTERED(DeptID ASC),
	CONSTRAINT  FK_Dept_Center	FOREIGN KEY (CenterID)	REFERENCES Centers(CenterID)
);

-- Offices Table
CREATE TABLE Offices (
	OfficeID	int			NOT NULL	IDENTITY(1,1),
	DeptID		int			NOT NULL,
	OfficeName	varchar(50)	NOT NULL,
	OfficeNum	int			NOT NULL,
	OfficePhone	varchar(50)	NOT NULL
							CHECK (OfficePhone LIKE '(___)___-____'),
		
	CONSTRAINT	PK_Office			PRIMARY KEY	CLUSTERED(OfficeID ASC),
	CONSTRAINT	FK_Office_Dept		FOREIGN KEY (DeptID)	REFERENCES Departments(DeptID)
);

-- Employees Table
CREATE TABLE Employees (
	EmployeeID			int				NOT NULL IDENTITY(1,1),
	OfficeID			int				NOT NULL,
	FirstName			varchar(50)		NOT NULL,
	LastName			varchar(50)		NOT NULL,
	Address				varchar(100)	NOT NULL,
	apt					varchar(50)		NULL,
	City				varchar(50)		NOT NULL,
	State				varchar(50)		NOT NULL,
	ZipCode				varchar(50)		NOT NULL,
	Phone				varchar(50)		NOT NULL
										CHECK (Phone LIKE '(___)___-____'),
	Email				varchar(50)		NOT NULL,
	WorkSchedule		varchar(100)	NOT NULL,

	CONSTRAINT	PK_Employee			PRIMARY KEY				CLUSTERED(EmployeeID ASC),
	CONSTRAINT	FK_Employee_Office	FOREIGN KEY (OfficeID)	REFERENCES Offices(OfficeID),
);

-- EmployeesInfo Table
CREATE TABLE EmployeesInfo (
	EmployeeID			int				NOT NULL,
	SSN					varchar(20)		NOT NULL
										CHECK (SSN LIKE '___-__-____'),
	PastJob				varchar(50)		NULL,
	CurJob				varchar(50)		NOT NULL,
	Salary				money			NOT NULL
										CHECK (Salary > 0),
	Benefits			varchar(50)		NULL,
	ContractType		varchar(50)		NOT NULL,
	ContractTerm		varchar(200)	NOT NULL,
	Reviews				varchar(200)	NOT NULL,

	CONSTRAINT	PK_EmployeeInfo		PRIMARY KEY					CLUSTERED(EmployeeID ASC),
	CONSTRAINT	FK_Info_Employee	FOREIGN KEY	(EmployeeID)	REFERENCES Employees(EmployeeID),
	CONSTRAINT	Employee_SSN		UNIQUE (SSN),
);

-- Physicians Table
CREATE TABLE Physicians (	-- Physician is an employee
	PhysicianID		int				NOT NULL	IDENTITY(1,1),
	EmployeeID		int				NOT NULL,
	Type			varchar(50)		NOT NULL,
	CONSTRAINT	PK_Physician			PRIMARY KEY		CLUSTERED(PhysicianID ASC),
	CONSTRAINT	FK_Physician_Employee	FOREIGN KEY(EmployeeID)	REFERENCES Employees(EmployeeID)
);

-- Hospitals Table
CREATE TABLE Hospitals (
	HospitalID		int				NOT NULL	IDENTITY(1,1),
	HospitalName	varchar(50)		NOT NULL,
	BusinessHour	varchar(100)	NOT NULL,
	Location		varchar(200)	NOT NULL,
	Address			varchar(50)		NOT NULL,
	City			varchar(50)		NOT NULL,
	State			varchar(50)		NOT NULL,
	ZipCode			varchar(50)		NOT NULL,
	Phone			varchar(50)		NULL
									CHECK (Phone LIKE '(___)___-____'),
	Webside			varchar(100)	NULL,

	CONSTRAINT	PK_Hospital		PRIMARY KEY		CLUSTERED(HospitalID ASC),
);

-- Doctors Table
CREATE TABLE Doctors (
	DoctorID		int				NOT NULL	IDENTITY(1,1),
	FirstName		varchar(50)		NOT NULL,
	LastName		varchar(50)		NOT NULL,
	Type			varchar(50)		NOT NULL,
	WorkSchedule	varchar(100)	NOT NULL,
	Phone			varchar(50)		NULL
									CHECK (Phone LIKE '(___)___-____'),
	Fax				varchar(50)		NULL,
	Email			varchar(50)		NULL,
	Background		varchar(200)	NULL,

	CONSTRAINT	PK_Doctor			PRIMARY KEY				CLUSTERED(DoctorID ASC),
);

-- EmergencyDept Table
CREATE TABLE EmergencyDept (
	EmergDeptID		int				NOT NULL	IDENTITY(1,1),
	HospitalID		int				NOT NULL,
	EmergDeptName	varchar(50)		NOT NULL,
	BusinessHour	varchar(100)	NOT NULL,
	Location		varchar(50)		NULL,
	Address			varchar(50)		NOT NULL,
	City			varchar(50)		NOT NULL,
	State			varchar(50)		NOT NULL,
	ZipCode			varchar(50)		NOT NULL,

	CONSTRAINT PK_EmergencyDept				PRIMARY KEY	(EmergDeptID),
	CONSTRAINT FK_EmergencyDept_Hospital	FOREIGN KEY(HospitalID)	REFERENCES Hospitals(HospitalID)
); 

-- Medication Table
CREATE TABLE Medications (		
	MedicationID	INT				NOT NULL	IDENTITY(1,1),		-- FK Patient(PatientID)
	MedicalName		varchar(50)		NOT NULL,
	Uses			varchar(200)	NOT NULL,
	Direction		varchar(100)	NOT NULL,
	Warning			varchar(200)	NOT NULL,
	ExpiryDate		smalldatetime	NOT NULL,
	Price			money			NOT NULL
									CHECK (Price >= 0),
	CONSTRAINT	PK_Medication		PRIMARY KEY				CLUSTERED(MedicationID ASC),
);

-- Patient Table
CREATE TABLE Patients (
	PatientID			int				NOT NULL	IDENTITY(1,1),
	FirstName			varchar(50)		NOT NULL,
	LastName			varchar(50)		NOT NULL,
	Gender				varchar(50)		NOT NULL,
	Address				varchar(100)	NOT NULL,
	apt					varchar(50)		NULL,
	City				varchar(50)		NOT NULL,
	State				varchar(50)		NOT NULL,
	ZipCode				varchar(50)		NOT NULL,
	Phone				varchar(50)		NOT NULL
										CHECK (Phone LIKE '(___)___-____'),
	Email				varchar(50)		NULL,
	DOB					smalldatetime	NOT NULL,
	CONSTRAINT	PK_Patient		PRIMARY KEY		CLUSTERED(PatientID ASC),
);

-- PatientHealthHistory Table
CREATE TABLE PatientHealthHistory (	
	HealthHistoryID	int				NOT NULL	IDENTITY(1,1),
	PatientID		int				NOT NULL,	
	Weight			varchar(20)		NOT NULL,	
	Height			varchar(20)		NOT NULL,
	CheckIn			smalldatetime	NOT NULL,
	CheckOut		smalldatetime	NOT NULL,
	Symptoms		varchar(200)	NOT NULL,
	Diagnostics		varchar(200)	NOT NULL,
	Procedures		varchar(200)	NOT NULL,	

	CONSTRAINT	PK_PatientHealthHistory		PRIMARY KEY					CLUSTERED(HealthHistoryID ASC),
	CONSTRAINT	FK_History_Patient			FOREIGN KEY	(PatientID)		REFERENCES Patients(PatientID),
);


-- Vitals Table
CREATE TABLE Vitals (
	VitalsID			int			NOT NULL IDENTITY(1,1),
	HealthHistoryID		int			NOT NULL,
	BodyTemperature		varchar(50)	NULL,
	PulseRate			varchar(50)	NULL,
	RespirationRate		varchar(50)	NULL,
	BloodPressure		varchar(50) NULL,

	CONSTRAINT	PK_Vital			PRIMARY KEY						CLUSTERED(VitalsID ASC),
	CONSTRAINT	FK_Vital_Patient	FOREIGN KEY	(HealthHistoryID)	REFERENCES PatientHealthHistory(HealthHistoryID)
);

-- Discharge table
CREATE TABLE Discharge (
	DischargeID			int				NOT NULL	IDENTITY(1,1),
	HealthHistoryID		int				NOT NULL,		
	ExpectTime			smalldatetime	NOT NULL,

	CONSTRAINT	PK_Discharge			PRIMARY KEY						CLUSTERED(DischargeID ASC),
	CONSTRAINT	FK_History_Discharge	FOREIGN KEY	(HealthHistoryID)	REFERENCES PatientHealthHistory(HealthHistoryID)
);

-- Testing
CREATE TABLE Testing (	
	TestingID			int				NOT NULL	IDENTITY(1,1),
	HealthHistoryID		int				NOT NULL,
	Test				varchar(200)	NOT NULL,
	Result				varchar(200)	NOT NULL,
	ReportToCounty		varchar(50)		NOT NULL,
	ReportToState		varchar(50)		NOT NULL,

	CONSTRAINT	PK_Testing			PRIMARY KEY						CLUSTERED(TestingID ASC),
	CONSTRAINT	FK_Testing_Patient	FOREIGN KEY(HealthHistoryID)	REFERENCES PatientHealthHistory(HealthHistoryID)
);

-- Billing
CREATE TABLE Billing (	
	BillID			int				NOT NULL	IDENTITY(1,1),
	PatientID		int				NOT NULL,
	Visits			varchar(50)		NOT NULL,
	Items			varchar(50)		NOT NULL,
	PayOr			varchar(50)		NOT NULL,
	PaymentMethod	varchar(50)		NOT NULL,
	TotalCharge		money			NOT NULL
									CHECK (TotalCharge >= 0),

	CONSTRAINT	PK_Bill			PRIMARY KEY				CLUSTERED(BillID ASC),
	CONSTRAINT	FK_Bill_Patient	FOREIGN KEY(PatientID)		REFERENCES	Patients(PatientID)
);

-- Health Insurance Table
CREATE TABLE HealthInsurance (
	HealthInsuranceID	int					NOT NULL	IDENTITY(1,1),	-- PK
	PatientID			int					NOT NULL,					-- FK Patients(PatientID)
	Policy_Number		varchar(50)			NOT NULL,
	Group_Number		varchar(50)			NOT NULL,
	Issuer				varchar(50)			NOT NULL,
	EffectiveDate		smalldatetime		NOT NULL,
	ExpiryDate			smalldatetime		NOT NULL,
	Cost				money				NOT NULL
											CHECK (Cost >= 0),

	CONSTRAINT	Policy_Info				UNIQUE (Policy_Number),
	CONSTRAINT	PK_HealthInsurance		PRIMARY KEY				CLUSTERED(HealthInsuranceID ASC),
	CONSTRAINT	FK_Patient_Insurance	FOREIGN KEY	(PatientID)	REFERENCES Patients(PatientID)
);

-- Coverages Table
CREATE TABLE Coverages (
	HealthInsuranceID	int				NOT NULL,	-- FK HealthInsurance(HealthInsuranceID)
	CoverageDetials		varchar(500)	NOT NULL,
	CoveragePrice		money			NOT NULL		
										CHECK (CoveragePrice >= 0),			

	CONSTRAINT	PK_Coverage				PRIMARY KEY						CLUSTERED(HealthInsuranceID),
 	CONSTRAINT	FK_Coverage_Insurance	FOREIGN KEY	(HealthInsuranceID)	REFERENCES HealthInsurance(HealthInsuranceID)
);

-- InsuranceCompany Table
CREATE TABLE InsuranceCompany (
	HealthInsuranceID	int				NOT NULL,			-- FK HealthInsurance(HealthInsuranceID)
	CompanyName			varchar(50)		NOT NULL,
	CompanyPhone		varchar(50)		NOT NULL
										CHECK (CompanyPhone LIKE '(___)___-____'),
	Address				varchar(50)		NOT NULL,
	City				varchar(50)		NOT NULL,
	State				varchar(50)		NOT NULL,
	ZipCode				varchar(50)		NOT NULL,

	CONSTRAINT	PK_InsuranceCompany		PRIMARY KEY						CLUSTERED(HealthInsuranceID),
	CONSTRAINT	FK_Company_Insurance	FOREIGN KEY	(HealthInsuranceID)	REFERENCES HealthInsurance(HealthInsuranceID)
);

-- Works Table
CREATE TABLE Works (
	DoctorID	int				NOT NULL,
	HospitalID	int				NOT NULL,
	HiredDate	smalldatetime	NOT NULL,

	CONSTRAINT	PK_Works					PRIMARY KEY					CLUSTERED(DoctorID ASC),
	CONSTRAINT	FK_Works_Doctor				FOREIGN KEY	(DoctorID)		REFERENCES Doctors(DoctorID),
	CONSTRAINT	FK_Works_Hospital			FOREIGN KEY	(HospitalID)	REFERENCES Hospitals(HospitalID)
);


-- Attends Table
CREATE TABLE Attending (		-- Attending Physicians for Patients
	HealthHistoryID		int				NOT NULL,
	PhysicianID			int				NOT NULL,
	Date				smalldatetime	NOT NULL,
	Description			varchar(200)	NOT NULL,

	CONSTRAINT		PK_Attending			PRIMARY KEY	(HealthHistoryID, PhysicianID),
	CONSTRAINT		FK_Attending_Patient	FOREIGN KEY (HealthHistoryID)		REFERENCES PatientHealthHistory(HealthHistoryID),
	CONSTRAINT		FK_Attending_Physician	FOREIGN KEY (PhysicianID)	REFERENCES Physicians(PhysicianID),
);

-- Refer Table
CREATE TABLE Refer (
	HealthHistoryID	int	NOT NULL,
	DoctorID		int	NOT NULL,
	Date			smalldatetime	NOT NULL,
	Description		varchar(200)	NOT NULL,

	CONSTRAINT		PK_Refer				PRIMARY KEY	(HealthHistoryID, DoctorID),
	CONSTRAINT		FK_Refer_Patient		FOREIGN KEY (HealthHistoryID)		REFERENCES PatientHealthHistory(HealthHistoryID),
	CONSTRAINT		FK_Refer_Doctor			FOREIGN KEY (DoctorID)		REFERENCES Doctors(DoctorID),
);

-- VisitHospital
CREATE TABLE VisitHospital (
	HealthHistoryID	int				NOT NULL,
	HospitalID	int				NOT NULL,
	Date		smalldatetime	NOT NULL,

	CONSTRAINT		PK_VisitHospital			PRIMARY KEY	(HealthHistoryID, HospitalID),
	CONSTRAINT		FK_VisitHospital_Patient	FOREIGN KEY (HealthHistoryID)		REFERENCES PatientHealthHistory(HealthHistoryID),
	CONSTRAINT		FK_VisitHospital_Hospital	FOREIGN KEY (HospitalID)	REFERENCES Hospitals(HospitalID),
);

-- PrimaryCareDoc Table
CREATE TABLE PrimaryCareDoc (
	PatientID	int		NOT NULL,
	DoctorID	int		NULL,			

	CONSTRAINT	PK_PrimaryCareDoc			PRIMARY KEY					CLUSTERED(PatientID ASC),
	CONSTRAINT	FK_PrimaryCareDoc_Patient	FOREIGN KEY	(PatientID)		REFERENCES Patients(PatientID),
	CONSTRAINT	FK_PrimaryCareDoc_Doctor	FOREIGN KEY	(DoctorID)		REFERENCES Doctors(DoctorID)

);

-- Costs Table
CREATE TABLE Costs (	
	HealthHistoryID		int				NOT NULL,
	MedicationID		int				NOT NULL,
	Procedures			varchar(200)	NOT NULL,

	CONSTRAINT	PK_Cost				PRIMARY KEY	(HealthHistoryID, MedicationID),
	CONSTRAINT	FK_Cost_Patient		FOREIGN KEY(HealthHistoryID)		REFERENCES PatientHealthHistory(HealthHistoryID),
	CONSTRAINT	FK_Cost_Medication	FOREIGN KEY(MedicationID)	REFERENCES Medications(MedicationID),
);

-- Emerg Table
CREATE TABLE Emerg (
	HealthHistoryID		int				NOT NULL,
	EmergDeptID			int				NOT NULL,
	Date				smalldatetime	NOT NULL,

	CONSTRAINT	PK_Emerg PRIMARY KEY(HealthHistoryID),
	CONSTRAINT	FK_Emerg_Patient	FOREIGN KEY(HealthHistoryID) REFERENCES PatientHealthHistory(HealthHistoryID),
	CONSTRAINT	FK_Emerg_EmergDept	FOREIGN KEY(EmergDeptID) REFERENCES EmergencyDept(EmergDeptID)
);
