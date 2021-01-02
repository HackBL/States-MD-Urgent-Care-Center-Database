USE UrgentCareCenter


SET IDENTITY_INSERT Patients ON
INSERT Patients(PatientID, FirstName, LastName, Gender, Address, apt, City, State, ZipCode, Phone, Email, DOB)
VALUES
(1, 'Mike', 'James', 'Male', '111 3rd Ave', 'apt 5' ,'Syracuse', 'NY', '13201', '(315)333-2553', 'MikeJames@abc.com', '1985-10-12'),
(2, 'Robert', 'Williams', 'Male', '809 Comstock Ave', 'apt 10', 'Syracuse', 'NY', '13210', '(315)285-4910', 'RobertWilliams@abc.com', '1992-05-21'),
(3, 'Ann', 'Whitaker', 'Female', '1045 Irving St', null , 'San Francisco', 'CA', '94130', '(415)957-2058', 'AnnWhitaker@abc.com', '1996-01-20'),
(4, 'Lisa', 'Hurlet', 'Female', '4018 Brighton Ave', 'apt 2', 'Syracuse', 'NY', '13210', '(315)993-0205', 'LisaHurlet@abc.com', '1978-08-25'),
(5, 'John', 'Webber', 'Male', '567 Euclid Ave', null, 'Syracuse', 'NY', '13210', '(315)029-5867', 'JohnWebber@abc.com', '1964-10-28')
SET IDENTITY_INSERT Patients OFF
GO


INSERT Billing(PatientID, Visits, Items, PayOr, PaymentMethod, TotalCharge)
VALUES
(1, '2020-04-13 to 2020-04-18', 'X-Ray, Pharmacy', 'Self', 'Credit Card', 12000),
(2, '2020-05-01 to 2020-05-01', 'Nucleic Acid Amplification Testing', 'Insurance', 'Credit Card', 350),
(3, '2020-06-02 to 2020-07-02', 'NCAT, Laboratory, Intensive Care Unit', 'Insurance', 'Debit Card', 2000),
(4, '2020-07-13 to 2020-07-14', 'Emergency Room', 'Insurance', 'Check', 5000),
(5, '2020-09-08 to 2020-09-13', 'EKG/ECG', 'Self', 'Check', 2800);
GO


SET IDENTITY_INSERT HealthInsurance ON
INSERT HealthInsurance(HealthInsuranceID, PatientID, Policy_Number, Group_Number, Issuer, EffectiveDate, ExpiryDate, Cost)
VALUES
(1, 2, 'AEFG892', 'E59S257213', 'E59S257213', '2019-10-23', '2020-10-22', 1096.25),
(2, 3, '9250DGW', 'B32HS02KCW', 'B32HS02KCW', '2020-02-03', '2021-02-02', 2498.96),
(3, 4, 'ANF2R52', '038SWH7W21', '038SWH7W21', '2020-01-01', '2021-12-31', 3696.27);
SET IDENTITY_INSERT HealthInsurance OFF
GO

INSERT Coverages(HealthInsuranceID, CoverageDetials, CoveragePrice)
VALUES
(1, 'Insurance covers the test of COVID19', 350),
(2, 'Insurance covers the test of COVID-19', 350),
(3, 'Insurance covers the protection of Body Injury', 2000);
GO


INSERT InsuranceCompany(HealthInsuranceID, CompanyName, CompanyPhone, Address, City, State, ZipCode)
VALUES
(1, 'Aetna', '(855)335-1407', '441 S Salina St', 'Syracuse', 'NY', '13202'),
(2, 'Blue Cross', '(415)735-3807', '899 Howard St', 'San Francisco', 'CA', '94103'),
(3, 'Humana', '(315)701-5843', '338 S Salina ST', 'Syracuse', 'NY', '13202');
GO

INSERT PatientHealthHistory(PatientID, Weight, Height, CheckIn, CheckOut, Symptoms, Diagnostics, Procedures)
VALUES
(1, '160lb', '170cm', '2020-04-13 08:00:00', '2020-04-13 10:00:00', 'Heart Burn and Hurt. Feeling Anxious', 'ECG, Echocardiogram, CT', 'Medical Treatment'),
(2, '176lb', '175cm', '2020-04-20 09:30:00', '2020-04-20 11:30:00', 'Coughing, Dizzy', 'Nucleic Acid Amplification Testing', 'Suggestion: Drink more water'),
(3, '130lb', '164cm', '2020-05-28 09:30:00', '2020-05-28 11:30:00', 'Coughing, Fewer, Difficulty Breathing', 'Nucleic Acid Amplification Testing', 'ICU'),
(4, '128lb', '160cm', '2020-07-01 08:30:00', '2020-07-01 10:30:00', 'Need Surgery, Car Accident attacking Body', 'CT, X-Ray', 'Surgery'),
(5, '220lb', '185cm', '2020-09-01 08:30:00', '2020-09-01 10:30:00', 'Tinnitus, Dizzy and Vomiting', 'First Check: ECG, GFR, Blood Lipids, Urinalysis', 'Medical Treatment');
GO


INSERT Testing(HealthHistoryID, Test, Result, ReportToCounty, ReportToState)
VALUES
(1, 'Heart Attact', 'None', 'Onondaga', 'NY'),
(2, 'Covid19', 'Negative', 'Onondaga', 'NY'),
(3, 'Covid19', 'Positive', 'San Francisco', 'CA'),
(4, 'Body Injury', 'Serious', 'Onondaga', 'NY'),
(5, 'Hypertension', 'Serious', 'Onondaga', 'NY');
GO



INSERT Discharge(HealthHistoryID, ExpectTime)
VALUES
(1, '2020-04-18'),
(2, '2020-05-01'),
(3, '2020-07-02'),
(4, '2020-07-14'),
(5, '2020-09-13');
GO



INSERT Vitals(HealthHistoryID, BodyTemperature, PulseRate, RespirationRate, BloodPressure)
VALUES
(1, '97.7F', '130bpm', '20bpm', '130mmHg'),
(2, '98.06', '90bmp', '14bpm', '100mmHg'),
(3, '101.12', '105bpm', '10bpm', '120mmHg'),
(4, '96.8', '140bpm', '22bpm', '140mmHg'),
(5, '97.5', '125bpm', '18bpm', '150mmHg');
GO


SET IDENTITY_INSERT Medications ON
INSERT Medications(MedicationID, MedicalName, Uses, Direction, Warning, ExpiryDate, Price)
VALUES
(1, 'Aspirin', 'It can reduce the risk of heart attact', 'Take 1 or 2 tablets every 4 hours',
'It irritates your stomach lining and can trigger gastrointestinal upset, ulcers and bleeding', '2021-12-20', 20.05),
(2, 'Amoxil', 'Treat bacterial infections', 'Take it every 12 hours with or without food',
'Rash, itching/swelling (especially of the face/tongue/throat), severe dizziness, trouble breathing', '2022-03-12', 10.71),
(3, 'Thiazide diuretics', 'Clear fluid from the body', 'once-a-day dose', 
'Thiazide diuretics can lower potassium and magnesium blood levels since they are both eliminated in urine.', '2021-05-09', 30.25),
(4, 'Opioids', 'Relieve pain', 'Please conduct a doctor', 
'Serious risks of misuse and abuse, which can lead to addiction, overdose and death', '2021-02-02', 6),
(5, 'Tylenol Cough', 'Cough Relief', 'Two tablets every 12 hours', 
'Do not misuse it', '2021-04-12', 20.08),
(6, 'Ambien', 'Help sleep well and fast', 'One tablets a day',
'Misuse leads to tragic injuries or even deaths', '2020-12-20', 10.29),
(7, 'Ibuprofen', 'Reduce Fever', 'Conduct a doctor',
'Do not misuse', '2021-09-13', 13.98);
SET IDENTITY_INSERT Medications OFF
GO




INSERT Costs(HealthHistoryID, MedicationID, Procedures)
VALUES
(1, 1, 'The patient needs Aspirin to reduce heart attact'),
(1, 6, 'Help patient sleep well at night to reduct heart attact'),
(2, 5, 'Relief cough, suggestion: drink more water'),
(3, 2, 'Treatment for bacterial'),
(3, 5, 'Relief cough'),
(3, 7, 'Reduce fever'),
(4, 4, 'Reduce pain'),
(5, 3, 'Treatment for Hypertension'),
(5, 6, 'Help sleep well');
GO


SET IDENTITY_INSERT Hospitals ON
INSERT Hospitals(HospitalID, HospitalName, BusinessHour, Location, Address, City, State, ZipCode, Phone, Webside)
VALUES
(1, 'Upstate Community Hospital', 'Open 24 hours', 'University Hospital', '4900 Broad Rd', 'Syracuse', 'NY', '13215', '(315)492-5011', 'upstate.edu'),
(2, 'Community General Hospital', 'Open 24 hours', 'Preventive Medicine Associates', '5415 W Genesee St #101', 'Camillus', 'NY', '13031', '(315)468-1997', 'upstate.edu'),
(3, 'Upstate University Hospital', 'Open 24 hours', 'University Hospital', '750 E Adams St', 'Syracuse', 'NY', '13210', '(315)464-5540', 'upstate.edu'),
(4, 'Oneida Health Hospital', 'Open 24 hours', 'Oneida', '321 Fenesee St', 'Oneida', 'NY', '13421', '(315)363-6000', 'oneidahealth.org'),
(5, 'Laguna Honda Hospital', 'Open 24 hours', 'Daly City', '375 Laguna Honda Blvd', 'San Francisco', 'CA', '94116', '(415)759-2300', 'lagunahonda.org');
SET IDENTITY_INSERT Hospitals OFF
GO


INSERT VisitHospital(HealthHistoryID, HospitalID, Date)
VALUES
(1, 1, '2020-04-13 08:00:00'),
(2, 4, '2020-05-01 09:30:00'),
(3, 5, '2020-06-02 09:30:00'),
(4, 3, '2020-07-13 10:30:00'),
(5, 2, '2020-09-08 10:30:00');
GO


INSERT EmergencyDept(HospitalID, EmergDeptName, BusinessHour, Location, Address, City, State, ZipCode)
VALUES
(1, 'Upstate Medical Center Emergency Department', 'Open 24 hours', 'Upstate University Hospital', '750 E Adam St', 'Syracuse', 'NY', '13210'),
(1, 'Upstate Medical Center Emergency Department', 'Open 24 hours', 'Upstate University Hospital', '650 Comstock Ave', 'Syracuse', 'NY', '13210'),
(2, 'Anburn Community Hospital: Emergency Room', 'Open 24 hours', 'Auburn Community Hospital', '17 Lansing St', 'Auburn', 'NY', '13021'),
(3, 'UCSF Emergency Department', 'Open 24 hours', 'UCSF Medical Center', '505 Parnassus Ave', 'San Francisco', 'CA', '94143');
GO


SET IDENTITY_INSERT Doctors ON
INSERT Doctors(DoctorID, FirstName, LastName, Type, WorkSchedule, Phone, Fax, Email, Background)
VALUES
(1, 'Angie', 'McKue', 'Cardiovascular Medicine', '8:00 - 17:00', '(315)483-0295', 'AngieMcKue@fax.com', 'AngieMcKue@abc.com', 'McKue is professional on treatment of Heart Disease'),
(2, 'Lucina', 'Lentsch', 'Internal Medicine', '8:00 - 17:00', null, 'LucinaLentsch@fax.com', 'LucinaLentsch@abc.com', 'Lentsch is good at Internal Medicine'),
(3,  'Katlin', 'Babidge', 'Orthopedics', '8:00 - 17:00', '(315)205-8401', null, 'KatlinBabidge@abc.com', 'Babidge is good at Orthopedics'),
(4, 'Carl', 'Deverille', 'Respiratory', '8:00 - 17:00', '(315)294-0642', 'CarlDeverille@fax.com', 'CarlDeverille@abc.com', 'Deverille is good at Respiratory'),
(5, 'Jodi', 'Clues', 'Respiratory', '8:00 - 17:00', '(415)204-8606', 'JodiClues@fax.com', 'JodiClues@abc.com', 'Clues is good at Respiratory'),
(6, 'Jens', 'Hardy', 'Brain Surgery', '8:00 - 17:00', '(315)285-1406', null, null, null),
(7, 'Lindy', 'Pinn', 'Neuroogy', '8:00 - 17:00', null, null, null, null);
SET IDENTITY_INSERT Doctors OFF
GO


INSERT Works(DoctorID, HospitalID, HiredDate)
VALUES
(1, 1, '09/08/2012'),
(2, 2, '09/08/2012'),
(3, 3, '09/08/2012'),
(4, 4, '09/08/2012'),
(5, 5, '09/08/2012'),
(6, 3, '09/08/2012'),
(7, 4, '09/08/2012');
GO


INSERT PrimaryCareDoc(PatientID, DoctorID)
VALUES
(1, 1),
(2, 4),
(3, 5),
(4, 3),
(5, 2);
GO


INSERT Refer(HealthHistoryID, DoctorID, Date, Description)
VALUES
(1, 1, '2020-4-13 08:00:00', 'To See Cardiovascular Medicine Doctor'),
(2, 4, '2020-05-01 09:30:00', 'To See  Doctor'),
(3, 5, '2020-06-02 09:30:00', 'To See  Doctor'),
(4, 3, '2020-07-13 10:30:00', 'To See  Doctor'),
(5, 2, '2020-09-08 10:30:00', 'To See  Doctor');
GO


INSERT Emerg(HealthHistoryID, EmergDeptID, Date)
VALUES
(1, 1, '2020-04-15'),
(3, 2, '2020-06-08');
GO



SET IDENTITY_INSERT Centers ON
INSERT Centers(CenterID, CenterName, BusinessHour, ProcedureCapacity, Location, Address, City, State, ZipCode, Phone)
VALUES
(1, 'States MD Urgent Care Center', 'Open 24 hours', '500', 'Genesee', '3504 W Genesee St', 'Syracuse', 'NY', '13219', '(315)401-0754'),
(2, 'States MD Urgent Care Center', 'Open 24 hours', '300', 'Oneida', '109 Genesee St', 'Oneida', 'NY', '13421', '(315)231-5530'),
(3, 'States MD Urgent Care Center', 'Open 24 hours', '1000', 'Parnassus Campus', '400 Parnassus Ave', 'San Francisco', 'CA', '94122', '(415)353-2602');
SET IDENTITY_INSERT Centers OFF
GO


INSERT Facilities(CenterID, RoomType)
VALUES
(1, 'Wating Room'),
(1, 'Detection Room'),
(1, 'Emergency Room'),
(2, 'Wating Room'),
(2, 'Detection Room'),
(2, 'Emergency Room'),
(3, 'Wating Room'),
(3, 'Detection Room'),
(3, 'Emergency Room');
GO


INSERT MedicalEquipments(CenterID, EquipmentName, Uses)
VALUES
(1, '3M Littmann Classic III Stethoscope', 'Monitor and assesses a wide range of patients'),
(1, 'Philips Heartstart Onsite Home Aed Package', 'Treat people experiencing sudden cardiac arrest'),
(1, 'Air Hawk Worlds Lightest Power Wheelchair', 'Help avoiding unnecessary walking'),
(2, '3M Littmann Classic III Stethoscope', 'Monitor and assesses a wide range of patients'),
(2, 'Philips Heartstart Onsite Home Aed Package', 'Treat people experiencing sudden cardiac arrest'),
(2, 'Air Hawk Worlds Lightest Power Wheelchair', 'Help avoiding unnecessary walking'),
(3, '3M Littmann Classic III Stethoscope', 'Monitor and assesses a wide range of patients'),
(3, 'Philips Heartstart Onsite Home Aed Package', 'Treat people experiencing sudden cardiac arrest'),
(3, 'Air Hawk Worlds Lightest Power Wheelchair', 'Help avoiding unnecessary walking');
GO


INSERT Departments(CenterID, DeptName, Location)
VALUES
(1, 'Emergency Department', 'Emergency Area'),
(1, 'Ambulance Department', 'Ambulance Area'),
(1, 'Physician Department', 'Physician Area'),
(2, 'Emergency Department', 'Emergency Area'),
(2, 'Ambulance Department', 'Ambulance Area'),
(2, 'Physician Department', 'Physician Area'),
(3, 'Emergency Department', 'Emergency Area'),
(3, 'Ambulance Department', 'Ambulance Area'),
(3, 'Physician Department', 'Physician Area');
GO


INSERT Offices(DeptID, OfficeName, OfficeNum, OfficePhone)
VALUES
(1, 'Emergency Office #1', '101', '(315)295-0601'),
(1, 'Emergency Office #2', '104', '(315)295-0602'),
(2, 'Ambulance Office #1', '107', '(315)295-0611'),
(2, 'Ambulance Office #2', '100', '(315)295-0612'),
(2, 'Ambulance Office #3', '103', '(315)295-0613'),
(3, 'Physician Office',	'110', '(315)295-0621'),
(4, 'Emergency Office #1', '101', '(315)204-8601'),
(4, 'Emergency Office #2', '104', '(315)204-8602'),
(5, 'Ambulance Office #1', '102', '(315)204-8611'),
(5, 'Ambulance Office #2', '106', '(315)204-8612'),
(6, 'Physician Office', '100', '(315)204-8621'),
(7, 'Emergency Office #1', '102', '(415)230-5901'),
(7, 'Emergency Office #2', '104', '(415)230-5902'),
(7, 'Emergency Office #3', '106', '(415)230-5903'),
(8, 'Ambulance Office #1', '100', '(415)230-5911'),
(8, 'Ambulance Office #2', '108', '(415)230-5912'),
(9, 'Physician Office', '123', '(415)230-5921')
GO


INSERT Employees(OfficeID, FirstName, LastName, Address, apt, City, State, ZipCode, Phone, Email, WorkSchedule)
VALUES
(1, 'Sophia', 'Jackson', '111 1st st', 'apt 5', 'Syracuse', 'NY', '13210', '(315)593-1023', 'SophiaJackson@abc.com', '9am - 5pm'),
(1, 'Emma', 'Aiden',  '222 2st st', null, 'Syracuse', 'NY', '13210', '(315)020-3928', 'EmmaAiden@abc.com', '9am - 5pm'),
(2, 'Olivia', 'Lucas',  '333 23st st', 'apt 1', 'Syracuse', 'NY', '13210', '(315)203-9571', 'OliviaLucas@abc.com', '9am - 5pm'),
(2, 'Ava', 'Liam', '444 23st st', null, 'Syracuse', 'NY', '13210', '(315)103-8261', 'AvaLiam@abc.com',  '9am - 5pm'),
(3, 'Rajesh', 'Menon',  '555 1st st', null, 'Syracuse', 'NY', '13210', '(315)192-0386', 'RajeshMenon@abc.com',  '11am - 11pm'),
(3, 'Kriti', 'Sharma',  '666 4th st', 'apt 6', 'Syracuse', 'NY', '13210', '(315)205-9261', 'KritiSharma@abc.com', '11am - 11pm'),
(3, 'Pallavi', 'Roy',  '777 23rd st', null, 'Syracuse', 'NY', '13210', '(315)201-9562', 'PallaviRoy@abc.com',  '11am - 11pm'),
(4, 'Aman', 'Verma',  '888 3rd st', null, 'Syracuse', 'NY', '13210', '(315)101-8262', 'AmanVerma@abc.com', '5am - 5pm'),
(4, 'John', 'Turner',  '999 3rd st', 'apt 3', 'Syracuse', 'NY', '13210', '(315)000-1928', 'JohnTurner@abc.com', '5am - 5pm'),
(4, 'Anders', 'Maria', '345 Winchell Pl', null, 'Syracuse', 'NY', '13210', '(765)555-7878', 'AndersMaria@abc.com', '5am - 5pm'),
(5, 'Trujillo', 'Ana',  '1298 E Smathers St', null, 'Syracuse', 'NY', '13210', '(501)555-7733', 'TrujilloAna@abc.com',  '8am - 8pm'),
(5, 'Moreno', 'Antonio',  '6925 N Parkland Ave', null, 'Syracuse', 'NY', '13210', '(253)555-8332', 'MorenoAntonio@abc.com', '8am - 8pm'),
(5, 'Hardy', 'Thomas',  '83 d''Urberville Ln', null, 'Syracuse', 'NY', '13210', '(478)555-1139', 'HardyThomas@abc.com',  '8am - 8pm'),
(6, 'Berglund', 'Christina',  '22717 E 73rd Ave', null, 'Syracuse', 'NY', '13210', '(319)555-1139', 'BerglundChristina@abc.com', '8am - 5pm'),
(6, 'Moos', 'Hanna',  '1778 N Bovine Ave', null, 'Syracuse', 'NY', '13210', '(309)555-8755', 'MoosHanna@abc.com', '11am - 7pm'),
(6, 'Citeaux', 'Fred',  '1234 Main St', null, 'Syracuse', 'NY', '13210', '(309)555-1914', 'CiteauxFred@abc.com', '3pm - 11pm'),
(6, 'Summer', 'Martin',  '1877 Ete Ct', 'apt 11', 'Syracuse', 'NY', '13210', '(337)555-9441', 'SummerMartin@abc.com', '8am - 5pm'),
(7, 'Lebihan', 'Laurence',  '717 E Michigan Ave', null, 'Syracuse', 'NY', '13210', '(312)555-9441', 'LebihanLaurence@abc.com', '8am - 5pm'),
(7, 'Lincoln', 'Elizabeth',  '4562 Rt 78 E', null, 'Syracuse', 'NY', '13210', '(360)555-2680', 'LincolnElizabeth@abc.com', '8am - 5pm'),
(8, 'Snyder', 'Howard',  '2732 Baker Blvd.', null, 'Syracuse', 'NY', '13210', '(503)555-7555', 'SnyderHoward@abc.com', '11am - 7pm'),
(8, 'Latimer', 'Yoshi',  'City Center Plaza 516 Main St.', null, 'Syracuse', 'NY', '13210', '(503)555-6874', 'LatimerYoshi@abc.com', '11am - 7pm'),
(9, 'Steel', 'John',  '12 Orchestra Terrace', null, 'Syracuse', 'NY', '13210', '(509)555-7969', 'SteelJohn@abc.com',  '11am - 11pm'),
(9, 'Yorres', 'Jaime',  '87 Polk St. Suite 5', null, 'Syracuse',  'NY', '13210', '(415)555-5938', 'YorresJaime@abc.com',  '11am - 11pm'),
(9, 'Wilson', 'Fran',  '89 Chiaroscuro Rd.', null, 'Syracuse', 'NY', '13210', '(503)555-9573', 'WilsonFran@abc.com',  '11am - 11pm'),
(10, 'Phillips', 'Rene',  '2743 Bering St.', null, 'Syracuse', 'NY', '13210', '(907)555-7584', 'PhillipsRene@abc.com', '5am - 5pm'),
(10, 'Wilson', 'Paula',  '2817 Milton Dr.', null, 'Syracuse', 'NY', '13210', '(505)555-5939', 'WilsonPaula@abc.com', '5am - 5pm'),
(10, 'Pavarotti', 'Jose',  '187 Suffolk Ln.', null, 'Syracuse', 'NY', '13210', '(208)555-8097', 'PavarottiJose@abc.com','5am - 5pm'),
(11, 'Braunschweiger', 'Art',  'P.O. Box 555', null, 'Syracuse', 'NY', '13210', '(307)555-4680', 'BraunschweigerArt@abc.com',  '8am - 5pm'),
(11, 'Nixon', 'Liz',  '89 Jefferson Way Suite 2', null, 'Syracuse', 'NY', '13210', '(401)555-3612', 'NixonLiz@abc.com',  '8am - 5pm'),
(12, 'Wong', 'Liu',  '55 Grizzly Peak Rd.', 'apt 1', 'San Francisco', 'CA', '94101', '(406)555-5834', 'WongLiu@abc.com', '8am - 11pm'),
(12, 'Nagy', 'Helvetius', '722 DaVinci Blvd.', null, 'San Francisco', 'CA', '94101', '(351)555-1219', 'NagyHelvetius@abc.com', '8am - 11pm'),
(13, 'Jablonski', 'Karl',  '305 - 14th Ave. S.', 'Suite 3B', 'San Francisco', 'CA', '94101', '(206)555-4112', 'JablonskiKarl@abc.com', '8am - 8pm'),
(13, 'Chelan', 'Donna',  '2299 E Baylor Dr', null, 'San Francisco', 'CA', '94101', '(469)555-8828', 'ChelanDonna@abc.com', '8am - 8pm'),
(14, 'Moos', 'Li',  '1778 N Bovine Ave', null, 'San Francisco', 'CA', '94101', '(415)024-8521', 'MoosLi@abc.com', '11am - 7pm'),
(15, 'Citeaux', 'Fran',  '1234 Main St', null, 'San Francisco', 'CA', '94101', '(415)204-8271', 'CiteauxFran@abc.com', '8am - 5pm'),
(15, 'Summer', 'Jose',  '1877 Ete Ct', 'apt 11', 'San Francisco', 'CA', '94101', '(415)281-7321', 'SummerJose@abc.com','8am - 5pm'),
(16, 'Lebihan', 'Martin',  '717 E Michigan Ave', null, 'San Francisco', 'CA', '94101', '(415)201-0000', 'LebihanMartin@abc.com', '11am - 11pm'),
(16, 'Lincoln', 'Menon',  '4562 Rt 78 E', null, 'San Francisco', 'CA', '94101', '(415)222-1111', 'LincolnMenon@abc.com', '11am - 11pm'),
(17, 'Snyder', 'Aiden',  '2732 Baker Blvd.', null, 'San Francisco', 'CA', '94101', '(415)223-5501', 'SnyderAiden@abc.com', '8am - 7pm'),
(17, 'Latimer', 'Hanna',  'City Center Plaza 516 Main St.', null, 'San Francisco', 'CA', '94101', '(415)221-0405', 'LatimerHanna@abc.com',  '8am - 7pm');
GO


INSERT EmployeesInfo(EmployeeID, SSN, PastJob, CurJob, Salary, Benefits, ContractType, ContractTerm, Reviews)
VALUES
(1, '123-45-6789',  null, 'Nurse', 54000, 'Insurance provided', 'Lump Sum Contract', '1 year', 'Excellent'),
(2, '204-12-5292', 'Nurse', 'Nurse', 79000, 'Stocks & Insurance', 'Cost Plus Contract', '5 years', 'Excellent'),
(3, '103-20-1059',  null, 'Nurse', 53000, 'Insurance','Lump Sum Contract', '2 years', 'Excellent'),
(4, '103-20-1048',  'Nurse', 'Nurse', 83000, 'Stocks & Insurance', 'Cost Plus Contract', '10 years', 'Excellent'),
(5,  '283-10-2057', 'Driver', 'Driver', 53000, 'Health Insurance, extra PTO', 'Unit Price Contract', '2 years', 'Good'),
(6, '401-12-1957',  null, 'Aid man', 76000, 'Health Insurance, extra PTO, stock', 'Cost Plus Contract', '3 years', 'Good'),
(7, '201-20-0271',  'Aid man', 'Aid man', 87000, 'Health Insurance, extra PTO, stock',
'Cost Plus Contract', '5 years', 'Excellent'),
(8, '185-20-1462',  null, 'Driver', 58000, 'Health Insurance, extra PTO', 'Cost Plus Contract', '2 years', 'Excellent'),
(9,  '291-10-2947',  null, 'Aid man', 78000, 'Health Insurance, stock', 'Incentive Contract', '2 years', 'Excellent'),
(10, '295-18-2058', null, 'Aid man', 68000, 'Health Insurance','Cost Plus Contract', '2 years', 'Excellent'),
(11, '204-19-0597',  'Driver', 'Driver', 68500, 'Health Insurance','Cost Plus Contract', '3 years', 'Good'),
(12,  '502-19-0003',  'Aid man', 'Aid man', 78000, 'Health Insurance, extra PTO','Incentive Contract', '5 years', 'Excellent'),
(13, '205-19-2756',  'Aid man', 'Aid man', 78000, 'Health Insurance, extra PTO','Incentive Contract', '5 years', 'Excellent'),
(14, '693-01-2846', null, 'Physician', 90000, 'Health Insurance, extra PTO','Cost Plus Contract', '5 years', 'Excellent'),
(15,  '295-10-1297',  'Physician', 'Physician', 130000, 'Health Insurance, extra PTO','Cost Plus Contract', '10 years', 'Excellent'),
(16, '201-49-1908',  'Physician', 'Physician', 135000, 'Health Insurance, extra PTO','Cost Plus Contract', '8 years', 'Excellent'),
(17,  '293-10-0298',  null, 'Physician', 125000, 'Health Insurance, extra PTO','Incentive Contract', '3 years', 'Excellent'),
(18,  '201-75-0991',  null, 'Nurse', 65000, 'Health Insurance, extra PTO','Lump Sum Contract', '1 years', 'Good'),
(19,  '124-20-1122', 'Nurse', 'Nurse', 75000, 'Health Insurance, extra PTO','Cost Plus Contract', '3 years', 'Excellent'),
(20,  '105-27-1902', 'Nurse', 'Nurse', 77000, 'Health Insurance, extra PTO','Cost Plus Contract', '3 years', 'Excellent'),
(21,  '182-00-1038',  'Nurse', 'Nurse', 77000, 'Health Insurance, extra PTO','Cost Plus Contract', '3 years', 'Excellent'),
(22,  '193-00-2001','Driver', 'Driver', 54000, 'Health Insurance, extra PTO','Cost Plus Contract', '2 years', 'Excellent'),
(23,  '183-19-0023', null, 'Aid man', 65000, 'Health Insurance, extra PTO','Cost Plus Contract', '2 years', 'Excellent'),
(24, '104-20-1977',  'Aid man', 'Aid man', 68000, 'Health Insurance, extra PTO','Cost Plus Contract', '3 years', 'Excellent'),
(25,  '010-20-4184', 'Driver', 'Driver', 52000, 'Health Insurance, extra PTO','Cost Plus Contract', '2 years', 'Excellent'),
(26,  '103-77-0287',  'Aid man', 'Aid man', 67900, 'Health Insurance, extra PTO','Cost Plus Contract', '2 years', 'Excellent'),
(27, '942-01-2856',  'Aid man', 'Aid man', 68000, 'Health Insurance, extra PTO','Cost Plus Contract', '2 years', 'Excellent'),
(28,  '293-10-1912','Physician', 'Physician', 98000, 'Health Insurance, extra PTO','Cost Plus Contract', '5 years', 'Excellent'),
(29, '859-10-2857', 'Physician', 'Physician', 130200, 'Health Insurance, extra PTO','Cost Plus Contract', '5 years', 'Excellent'),
(30, '492-10-6749',  'Nurse', 'Nurse', 69000, 'Health Insurance, extra PTO','Cost Plus Contract', '3 years', 'Excellent'),
(31,  '591-19-0059', 'Nurse', 'Nurse', 69000, 'Health Insurance, extra PTO','Cost Plus Contract', '5 years', 'Excellent'),
(32, '195-20-3957',  null, 'Nurse', 60000, 'Health Insurance, extra PTO','Cost Plus Contract', '4 years', 'Good'),
(33, '195-10-5867', 'Nurse', 'Nurse', 68000, 'Health Insurance, extra PTO','Cost Plus Contract', '3 years', 'Excellent'),
(34, '295-10-0101', 'Nurse', 'Nurse', 78000, 'Health Insurance, extra PTO','Cost Plus Contract', '10 years', 'Excellent'),
(35,'201-49-0202',  'Driver', 'Driver', 65000, 'Health Insurance, extra PTO','Cost Plus Contract', '3 years', 'Excellent'),
(36, '293-10-0303', null, 'Aid man', 78000, 'Health Insurance, extra PTO','Incentive Contract', '3 years', 'Excellent'),
(37, '201-75-0404', null, 'Driver', 65000, 'Health Insurance, extra PTO','Lump Sum Contract', '1 years', 'Good'),
(38,  '124-20-0505', 'Aid man', 'Aid man', 75000, 'Health Insurance, extra PTO','Cost Plus Contract', '3 years', 'Excellent'),
(39, '105-27-0606', 'Physician', 'Physician', 100000, 'Health Insurance, extra PTO','Cost Plus Contract', '3 years', 'Excellent'),
(40,'182-00-0707','Physician', 'Physician', 103000, 'Health Insurance, extra PTO','Cost Plus Contract', '3 years', 'Excellent');
GO


INSERT Physicians(EmployeeID, Type)
VALUES
(14, 'Family Physician'),
(15, 'Internists'),
(16, 'Surgeons'),
(17, 'Anesthesiologist'),
(28, 'Family Physician'),
(29, 'Internists'),
(39, 'Family Physician'),
(40, 'Internists');
GO


INSERT Attending(HealthHistoryID, PhysicianID, Date, Description)
VALUES
(1, 1, '2020-04-05 08:00:00', 'Mike feels bad on heart, Berglund helps him'),
(1, 2, '2020-04-05 08:00:00', 'Mike feels bad on heart, Moos helps him'),
(2, 4, '2020-04-29 09:30:00', 'Robert cough, Summer helps him'),
(3, 7, '2020-06-01 09:30:00', 'Ann feels getting covid19, Snyder helps her'),
(3, 8, '2020-06-01 09:30:00', 'Ann feels getting covid19, Latimer helps her'),
(4, 5, '2020-07-13 10:00:00', 'Lisa get car accidients to hurt body, Braunschweiger helps her'),
(4, 6, '2020-07-13 10:00:00', 'Lisa get car accidients to hurt body, Nixon helps her'),
(5, 3, '2020-09-07 15:30:00', 'John feels dizzy (hypertension), Citeaux helps him'),
(5, 4, '2020-09-07 15:30:00', 'John feels dizzy (hypertension), Summer helps him');
GO

