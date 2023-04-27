
CREATE DATABASE Covid19RMS;\


USE Covid19RMS
-- -- -- Create Patient Table -- -- -- 
IF OBJECT_ID('dbo.Patient', 'U') IS NOT NULL 
	DROP TABLE dbo.Patient; 
Else
	CREATE TABLE Patient
	(PatientID int not null identity (100000,1) PRIMARY KEY,
	[Name] varchar(20),
	ContactNumber CHAR(10) unique, --Table level check constraint for Contact Number to be unique,
	DateOfBirth date,
	StreetName varchar(50),
	City varchar(15),
	[State] varchar(15),
	ZipCode varchar(5),
	CONSTRAINT Chk_ContactNumber CHECK (ContactNumber not like '%[^0-9]%') --Table level check constraint for Contact Number to be 10 digits
	);

-- Non clustered index of patient table
CREATE INDEX Patient_Name_Index ON Patient([Name]);


-- -- -- Create Allergy Table -- -- -- 
IF OBJECT_ID('dbo.Allergy', 'U') IS NOT NULL 
	DROP TABLE dbo.Allergy; 
Else
	CREATE TABLE Allergy
	(AllergyID int not null identity (1000,1) PRIMARY KEY,
	AllergyName varchar(25),
	AllergyCategory varchar(25)
	);


-- -- -- Create Symptoms Table -- -- -- 
IF OBJECT_ID('dbo.Symptoms', 'U') IS NOT NULL 
	DROP TABLE dbo.Symptoms; 
Else
	CREATE TABLE Symptoms
	(SymptomID int not null identity (2000,1) PRIMARY KEY,
	SymptomName varchar(25)
	);


-- -- -- Create Symptoms Table -- -- -- 
IF OBJECT_ID('dbo.Possess', 'U') IS NOT NULL 
	DROP TABLE dbo.Possess; 
Else
	CREATE TABLE Possess
	( SerialNo int not null identity(1,1) PRIMARY KEY,
	  AllergyID int not null,
	  PatientID int not null,
	  PossessedDate Date,
	  CONSTRAINT Possess_FK1 FOREIGN KEY(AllergyID) REFERENCES Allergy(AllergyID) ON DELETE CASCADE,
      CONSTRAINT Possess_FK2 FOREIGN KEY(PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE
    );


-- -- -- Create Experiences Table -- -- -- 
IF OBJECT_ID('dbo.Experiences', 'U') IS NOT NULL 
	DROP TABLE dbo.Experiences; 
Else
	CREATE TABLE Experiences
	( SerialNo int not null identity(1,1) PRIMARY KEY,
	  SymptomID int not null,
	  PatientID int not null,
	  ExperiencedDate Date,
	  CONSTRAINT Experiences_FK1 FOREIGN KEY(SymptomID) REFERENCES Symptoms(SymptomID) ON DELETE CASCADE,
	  CONSTRAINT Experiences_FK2 FOREIGN KEY(PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE
	);


-- -- -- Create Hospital Table -- -- -- 
CREATE Table Hospital(
    HospitalID VARCHAR(10) NOT NULL PRIMARY KEY,
    HospitalType VARCHAR(25),
    Zip VARCHAR(5),
    [State] VARCHAR(15),
    City VARCHAR(15),
    Street VARCHAR(50),
    ContactNumber CHAR(10) unique, --Table level check constraint for Contact Number to be unique
    [Name] VARCHAR(50),
	CONSTRAINT Chk_ContactNumber_H CHECK (ContactNumber not like '%[^0-9]%') --Table level check constraint for Contact Number to be 10 digits
);

-- Non clustered index of Hospital table
CREATE NONCLUSTERED INDEX Hospital_Zip_Index ON Hospital(zip);


-- -- -- Create VaccinationCentre Table -- -- -- 
CREATE TABLE VaccinationCentre
(
CentreID VARCHAR(10) NOT NULL PRIMARY KEY,
StaffCount int,
ZipCode int,
[State] varchar(15),
City varchar(15),
StreetName varchar(30),
ContactNumber CHAR(10) unique, -- Table level check constraint for Contact Number to be unique,
[Name] varchar(50),
CONSTRAINT Chk_ContactNumber_V CHECK (ContactNumber not like '%[^0-9]%') -- Table level check constraint for Contact Number to be 10 digits
);


-- -- -- Create Visits Table -- -- -- 
CREATE TABLE Visits
(
VisitID int not null identity (10000,1) PRIMARY KEY,
VisitReason varchar(50),
PatientID int not null,
HospitalID VARCHAR(10),
CentreID VARCHAR(10),
CONSTRAINT Visits_FK1 FOREIGN KEY(PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE,
CONSTRAINT Visits_FK2 FOREIGN KEY(HospitalID) REFERENCES Hospital(HospitalID) ON DELETE CASCADE,
CONSTRAINT Visits_FK3 FOREIGN KEY(CentreID) REFERENCES VaccinationCentre(CentreID) ON DELETE CASCADE
);


-- -- -- Create Distributor Table -- -- -- 
CREATE TABLE Distributor
(
DistributorLicenseID bigint not null identity (3000,1) PRIMARY KEY,
[Name] varchar(50),
Website varchar(50),
CentreID VARCHAR(10) not null,
CONSTRAINT Distributor_FK FOREIGN KEY(CentreID) REFERENCES VaccinationCentre(CentreID) ON DELETE CASCADE
);

-- Non clustered index of Distributor table
CREATE INDEX Distributor_Name_Index ON Distributor([Name]);


-- -- -- Create Vaccine Table -- -- -- 
CREATE TABLE Vaccine
(
BatchNumber bigint not null PRIMARY KEY,
Company varchar(50),
SideEffects varchar(50),
DistributorLicenseID bigint not null,
CONSTRAINT Vaccine_FK FOREIGN KEY(DistributorLicenseID) REFERENCES Distributor(DistributorLicenseID) ON DELETE CASCADE
);

-- Non clustered index of Vaccine table
CREATE INDEX Company_Name_Index ON Vaccine(Company);


-- -- -- Create Employee Table -- -- -- 
CREATE TABLE Employee
(EmployeeID int not null identity (20000,1) PRIMARY KEY,
 SSN VARCHAR(12) not null,
 HospitalID VARCHAR(10),
 [Name] varchar(50),
 DateOfBirth date,
 ContactNumber CHAR(10) UNIQUE, -- Table level check constraint for Contact Number to be unique,
 Department varchar(25),
 CONSTRAINT Employee_FK1 FOREIGN KEY(HospitalID) REFERENCES Hospital(HospitalID) ON DELETE CASCADE,
 CONSTRAINT Chk_ContactNumber_E CHECK (ContactNumber not like '%[^0-9]%') --Table level check constraint for Contact Number to be 10 digits
);

-- Non clustered index of Employee table
CREATE INDEX [Name] ON Employee([Name]);


-- -- -- Create Doctor Table -- -- -- 
CREATE TABLE Doctor
(DoctorID int not null PRIMARY KEY,
 LicenseNo int not null,
 Speciality varchar(25)
);

-- Non clustered index of Doctor table
CREATE INDEX Doctor_Speciality ON Doctor(Speciality);


-- -- -- Create Nurse Table -- -- -- 
CREATE TABLE Nurse
(NurseID int not null PRIMARY KEY,
 StateLicenseNo int not null,
 [Shift] varchar(25),
 Position varchar(25)
);

-- Non clustered index of Doctor table
CREATE INDEX Nurse_Position ON Nurse(Position);


-- -- -- Create Staff Table -- -- -- 
CREATE TABLE Staff
(StaffID int not null PRIMARY KEY,
 Roles varchar(25),
 Agency varchar(25)
);

-- Non clustered index of Staff table
CREATE INDEX Staff_Roles ON Staff(Roles);


-- -- -- Create Rooms Table -- -- -- 
CREATE TABLE Rooms
(RoomNumber int not null identity (100,1) PRIMARY KEY,
 [Room Type] varchar(25),
  HospitalID VARCHAR(10),
 CONSTRAINT Room_FK1 FOREIGN KEY(HospitalID) REFERENCES Hospital(HospitalID) ON DELETE CASCADE
);

-- Non clustered index of Rooms table
CREATE INDEX Room_Type ON Rooms([Room Type]);


-- -- -- Create Prescription Table -- -- -- 
CREATE TABLE Prescription(
    PrescriptionID INT NOT NULL IDENTITY(7001,1) PRIMARY KEY,
    DoctorID int not null,
    [Name] VARCHAR(75),
    PrescriptionHistory VARCHAR(75),
    CONSTRAINT Prescription_FK1 FOREIGN KEY(DoctorID) REFERENCES Doctor(DoctorID) ON DELETE CASCADE
);


-- -- -- Create Test Table -- -- -- 
CREATE TABLE Test(
    TestID INT NOT NULL IDENTITY(50001,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    Date_of_Testing Date,
    Time_of_Testing Time,
    Result VARCHAR(50),
    CONSTRAINT Test_FK1 FOREIGN KEY(PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE
);


-- -- -- Create Medication Table -- -- -- 
CREATE TABLE Medication(
    MedicationID INT NOT NULL IDENTITY(8001,1),
    ProductID INT NOT NULL ,
    PrescriptionID INT NOT NULL,
    [Name] VARCHAR(20) unique, --Table level check constraint for Contact Number to be unique
    Composition VARCHAR(50),
    Manufacturer VARCHAR(25),
    ManufacturerDate Date,
    ExpiryDate Date,
    CONSTRAINT Medication_PK PRIMARY KEY(MedicationID, ProductID),
    CONSTRAINT Medication_FK1 FOREIGN KEY(PrescriptionID) REFERENCES Prescription(PrescriptionID) ON DELETE CASCADE,
	CONSTRAINT Medication_Chck_date CHECK(ExpiryDate > ManufacturerDate) -- Table level check constraint to ensure that the Expiry Date will be a 
																		 -- date later than that of manufactured date
);







