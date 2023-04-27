USE ABC
-- -- -- Stored Procedure for Employee Supertype and Doctor, Nurse, Staff its subtypes -- -- --
-- -- -- The SP is inserting the data into the super and corresponding subtype depending on its employee type -- -- --

GO
CREATE PROCEDURE AssignEmployee 
@SSN varchar(12), 
@HospitalID varchar(12), 
@Name varchar(50), 
@DOB date,
@ContactNumber char(10),
@Profession varchar(15),
@LicenseNumber int,
@Speciality varchar(25),
@Shift varchar(25),
@Position varchar(25),
@Role varchar(25),
@Agency varchar(25),
@Message varchar(50) OUTPUT
AS 
BEGIN
declare @department varchar(25)

IF @Profession = 'Doctor' or @Profession = 'Nurse'
	BEGIN
	(SELECT 1 FROM Doctor)
	set @department = 'Medical Staff'
	END
--IF (@Profession <> 'Doctor' or @Profession <> 'Nurse'
ELSE
	BEGIN
	(SELECT 1 FROM Nurse)
	set @department = 'Admin'
	END

INSERT INTO Employee (SSN,HospitalID,[Name],DateOfBirth, ContactNumber, Department) 
VALUES (@SSN,@HospitalID,@Name,@DOB,@ContactNumber,@department)

IF @Profession = 'Doctor'
	BEGIN
	(SELECT 1 FROM Doctor)
	 INSERT INTO Doctor SELECT EmployeeID,@LicenseNumber, @Speciality FROM Employee WHERE ContactNumber = @ContactNumber
	 set @Message = 'Doctor Record Inserted'
	 END
ELSE
IF @Profession = 'Nurse'
	BEGIN
	(SELECT 1 FROM Nurse)
	 INSERT INTO Nurse SELECT EmployeeID,@LicenseNumber, @Shift, @Position FROM Employee WHERE ContactNumber = @ContactNumber
	 set @Message = 'Nurse Record Inserted'
	 END

--IF (@Profession <> 'Doctor' or @Profession <> 'Nurse')
ELSE
	BEGIN
	(SELECT 1 FROM Staff)
	INSERT INTO Staff SELECT EmployeeID,@Role, @Agency FROM Employee WHERE ContactNumber = @ContactNumber
	 set @Message = 'Staff Record Inserted'
	 END

END

-- -- -- Execution of Stored Procedure to insert values in the Doctor table -- -- --

declare @SSN varchar(12),
@HospitalID varchar(12),
@Name varchar(50),
@DOB date,
@ContactNumber char(10),
@Profession varchar(15),
@LicenseNumber int,
@Speciality varchar(25),
@Shift varchar(25),
@Position varchar(25),
@Role varchar(25),
@Agency varchar(25),
@Message varchar(50)
SET @SSN = 123-45-6789
SET @HospitalID = 'H001'
SET @Name = 'Tom'
SET @DOB = '01-11-1980'
SET @ContactNumber = '61712372312'
SET @Profession = 'Doctor'
SET @LicenseNumber = 251
SET @Speciality = 'Nephrologist'
SET @Shift = ' '
SET @Position = ' '
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message

SET @SSN = 123-45-6789
SET @HospitalID = 'H002'
SET @Name = 'Dick'
SET @DOB = '02-12-1981'
SET @ContactNumber = '6173482389'
SET @Profession = 'Doctor'
SET @LicenseNumber = 252
SET @Speciality = 'Radiologist'
SET @Shift = ' '
SET @Position = ' '
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 123-45-6789
SET @HospitalID = 'H003'   
SET @Name = 'Harry'
SET @DOB = '03-13-1982'
SET @ContactNumber = '6178743275'
SET @Profession = 'Doctor'
SET @LicenseNumber = 253
SET @Speciality = 'Intensivist'
SET @Shift = ' '
SET @Position = ' '
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message

SET @SSN = 123-45-6789
SET @HospitalID = 'H004' 
SET @Name = 'Swapnil'
SET @DOB = '04-14-1983'
SET @ContactNumber = '6170976574'
SET @Profession = 'Doctor'
SET @LicenseNumber = 254
SET @Speciality = 'Pulmonologist'
SET @Shift = ' '
SET @Position = ' '
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 123-45-6789
SET @HospitalID = 'H005' 
SET @Name = 'Richard' 
SET @DOB = '05-15-1984'
SET @ContactNumber = '6179875637'
SET @Profession = 'Doctor'
SET @LicenseNumber = 255
SET @Speciality = 'Radiologist'
SET @Shift = ' '
SET @Position = ' '
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 123-45-6789
SET @HospitalID = 'H006'
SET @Name = 'Nik'
SET @DOB = '06-16-1985'
SET @ContactNumber = '6178562362'
SET @Profession = 'Doctor'
SET @LicenseNumber = 256
SET @Speciality = 'Nephrologist'
SET @Shift = ' '
SET @Position = ' '
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 123-45-6789
SET @HospitalID = 'H007'
SET @Name = 'Paul'
SET @DOB = '07-17-1986'
SET @ContactNumber = '6173237685'
SET @Profession = 'Doctor'
SET @LicenseNumber = 257
SET @Speciality = 'Intensivist'
SET @Shift = ' '
SET @Position = ' '
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message

SELECT * FROM Doctor;

-- -- -- Execution of Stored Procedure to insert values in the Nurse table -- -- --


SET @SSN = 121-45-6789
SET @HospitalID = 'H001'
SET @Name = 'Mia'
SET @DOB = '08-18-1987'
SET @ContactNumber = '6176537582'
SET @Profession = 'Nurse'
SET @LicenseNumber = 678
SET @Speciality = ''
SET @Shift = 'Day'
SET @Position = 'ER'
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 100-40-6789
SET @HospitalID = 'H002'
SET @Name = 'Clara'
SET @DOB = '09-19-1988'
SET @ContactNumber = '6177428432'
SET @Profession = 'Nurse'
SET @LicenseNumber = 677
SET @Speciality = ''
SET @Shift = 'Night'
SET @Position = 'Critical Care'
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 100-40-6700
SET @HospitalID = 'H003'
SET @Name = 'Mary'
SET @DOB = '10-20-1989'
SET @ContactNumber = '6177428434'
SET @Profession = 'Nurse'
SET @LicenseNumber = 678
SET @Speciality = ''
SET @Shift = 'Day'
SET @Position = 'Head Nurse'
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 101-40-600
SET @HospitalID = 'H003'
SET @Name = 'Elizabeth'
SET @DOB = '11-21-1990'
SET @ContactNumber = '6177428435'
SET @Profession = 'Nurse'
SET @LicenseNumber = 679
SET @Speciality = ''
SET @Shift = 'Day'
SET @Position = 'Case Manager'
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message

SET @SSN = 101-40-601
SET @HospitalID = 'H001'
SET @Name = 'Elizabeth'
SET @DOB = '11-21-1990'
SET @ContactNumber = '6177428436'
SET @Profession = 'Nurse'
SET @LicenseNumber = 679
SET @Speciality = ''
SET @Shift = 'Night'
SET @Position = 'ER'
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 101-40-602
SET @HospitalID = 'H002'
SET @Name = 'Margaret'
SET @DOB = '12-22-1983'
SET @ContactNumber = '6178723623'
SET @Profession = 'Nurse'
SET @LicenseNumber = 612
SET @Speciality = ''
SET @Shift = 'Day'
SET @Position = 'Critical Care'
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 101-40-603
SET @HospitalID = 'H003'
SET @Name = 'Eliza'
SET @DOB = '01-18-1985'
SET @ContactNumber = '6176531234'
SET @Profession = 'Nurse'
SET @LicenseNumber = 615
SET @Speciality = ''
SET @Shift = 'Night'
SET @Position = 'Head Nurse'
SET @Role = ''
SET @Agency = ''
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message

select * FROM Nurse;

-- -- -- Execution of Stored Procedure to insert values in the Staff table -- -- --


SET @SSN = 123-45-6789
SET @HospitalID = 'H001'   
SET @Name = 'Isabella'
SET @DOB = '12-21-2000'
SET @ContactNumber = '6179876543'
SET @Profession = 'Staff' 
SET @LicenseNumber = 301
SET @Speciality = ''
SET @Shift = ' '
SET @Position = ' '
SET @Role = 'Driver'
SET @Agency = 'Transport'
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 234-56-7891 
SET @HospitalID = 'H002'  
SET @Name = 'Zain'
SET @DOB = '03-23-1999'
SET @ContactNumber = '6171673852'  
SET @Profession = 'Staff' 
SET @LicenseNumber = 302
SET @Speciality = ''
SET @Shift = ' '
SET @Position = ' '
SET @Role = 'Security Guard'
SET @Agency = 'Security'
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 345-67-8912
SET @HospitalID = 'H003'    
SET @Name = 'David'
SET @DOB = '01-12-1998'
SET @ContactNumber = '6178725642'
SET @Profession = 'Staff' 
SET @LicenseNumber = 303  
SET @Speciality = ''
SET @Shift = ' '
SET @Position = ' '
SET @Role = 'Cook'
SET @Agency = 'Food Service'
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN =  456-78-9123
SET @HospitalID = 'H001'    
SET @Name = 'Heath'
SET @DOB = '02-23-1997'
SET @ContactNumber = '6172952658'
SET @Profession = 'Staff' 
SET @LicenseNumber = 304  
SET @Speciality = ''
SET @Shift = ' '
SET @Position = ' '
SET @Role = 'Janitor'
SET @Agency = 'Cleaning and Disinfecton'
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN =  789-12-3456
SET @HospitalID = 'H002'    
SET @Name = 'Peter'
SET @DOB = '05-30-1996'
SET @ContactNumber = '6172366783'
SET @Profession = 'Staff' 
SET @LicenseNumber = 305  
SET @Speciality = ''
SET @Shift = ' '
SET @Position = ' '
SET @Role = 'Reciptionist'
SET @Agency = 'Administration'
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 012-34-5678
SET @HospitalID = 'H003'    
SET @Name = 'Lily'
SET @DOB = '08-11-2001'
SET @ContactNumber = '6176332378'
SET @Profession = 'Staff' 
SET @LicenseNumber = 306  
SET @Speciality = ''
SET @Shift = ' '
SET @Position = ' '
SET @Role = 'Caterer'
SET @Agency = 'Food Service'
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message


SET @SSN = 130-24-8752
SET @HospitalID = 'H004'    
SET @Name = 'Robben'
SET @DOB = '06-01-1998'
SET @ContactNumber = '6172386723'
SET @Profession = 'Staff' 
SET @LicenseNumber = 307 
SET @Speciality = ''
SET @Shift = ' '
SET @Position = ' '
SET @Role = 'Janitor'
SET @Agency = 'Cleaning and Disinfecton'
EXEC AssignEmployee @SSN, @HospitalID,@Name,@DOB,@ContactNumber,@Profession,@LicenseNumber,@Speciality,@Shift,@Position,
@Role,@Agency,@Message
print @Message

SELECT * FROM Staff;

-- -- -- Insert Statements to enter records in Prescription Table -- -- -- 
INSERT INTO Prescription (DoctorID, [Name], PrescriptionHistory) VALUES (20000, 'Suzie Kris', 'ZinCovit,Limcee,B Complex - 1 x 3 times a day, Paracetamol if fever' );
INSERT INTO Prescription (DoctorID, [Name], PrescriptionHistory) VALUES (20001, 'Sherell Wisozk', 'ZinCovit,Limcee,B Complex - 1 x 3 times a day, Paracetamol if fever' );
INSERT INTO Prescription (DoctorID, [Name], PrescriptionHistory) VALUES (20002, 'Kenna Shanahan', 'ZinCovit,Limcee,B Complex - 1 x 3 times a day, Paracetamol if fever' );
INSERT INTO Prescription (DoctorID, [Name], PrescriptionHistory) VALUES (20003, 'Adalberto Kreiger', 'ZinCovit,Limcee,B Complex - 1 x 3 times a day, Paracetamol if fever' );
INSERT INTO Prescription (DoctorID, [Name], PrescriptionHistory) VALUES (20000, 'Joie Williamson', 'ZinCovit,Limcee,B Complex - 1 x 3 times a day, Paracetamol if fever' );
INSERT INTO Prescription (DoctorID, [Name], PrescriptionHistory) VALUES (20001, 'Suzie Kris', 'Multivitamins - 1x 2 times a day, Vitamin D - once a week' );
INSERT INTO Prescription (DoctorID, [Name], PrescriptionHistory) VALUES (20002, 'Sherell Wisozk', 'Multivitamins - 1x 2 times a day, Vitamin D - once a week' );
INSERT INTO Prescription (DoctorID, [Name], PrescriptionHistory) VALUES (20003, 'Kenna Shanahan', 'Multivitamins - 1x 2 times a day, Vitamin D - once a week' );
INSERT INTO Prescription (DoctorID, [Name], PrescriptionHistory) VALUES (20004, 'Adalberto Kreiger', 'Multivitamins - 1x 2 times a day, Vitamin D - once a week' );
INSERT INTO Prescription (DoctorID, [Name], PrescriptionHistory) VALUES (20004, 'Joie Williamson', 'Multivitamins - 1x 2 times a day, Vitamin D - once a week' );

SELECT * FROM Prescription;


-- -- -- Insert Statements to enter records in Medication Table -- -- -- 
INSERT INTO Medication (ProductID, PrescriptionID, [Name], Composition, Manufacturer, ManufacturerDate, ExpiryDate)
    VALUES (5001, 7001, 'ZinCovit',' zinc 22 mg','Apex Labs','01/25/2021','03/27/2025');
INSERT INTO Medication (ProductID, PrescriptionID, [Name], Composition, Manufacturer, ManufacturerDate, ExpiryDate)
    VALUES (5002, 7001, 'Limcee','Ascorbic Acid (Vit C) 500 mg','Abbott Health Care','02/20/2021','06/25/2027');
INSERT INTO Medication (ProductID, PrescriptionID, [Name], Composition, Manufacturer, ManufacturerDate, ExpiryDate)
    VALUES (5003, 7002, 'B Complex','riboflavin (vitamin B2)','AdvaCare','03/22/2020','07/28/2025');
INSERT INTO Medication (ProductID, PrescriptionID, [Name], Composition, Manufacturer, ManufacturerDate, ExpiryDate)
    VALUES (5004, 7002, 'Dolo 650','Paracetamol-650mg','Micro Labs LTD','04/22/2021','08/28/2025');
INSERT INTO Medication (ProductID, PrescriptionID, [Name], Composition, Manufacturer, ManufacturerDate, ExpiryDate)
    VALUES (5005, 7003, 'Sinarest','Phenylephrine (decongestant)','Centaur Pharmaceuticals','01/22/2022','08/28/2030');
INSERT INTO Medication (ProductID, PrescriptionID, [Name], Composition, Manufacturer, ManufacturerDate, ExpiryDate)
    VALUES (5006, 7003, 'Crocin','Paracetamol IP 650mg','GSK Consumer Healthcare','11/22/2022','05/28/2024');
INSERT INTO Medication (ProductID, PrescriptionID, [Name], Composition, Manufacturer, ManufacturerDate, ExpiryDate)
    VALUES (5007, 7004, 'Metaplus','Paracetamol 650mg','Themis Medicare Ltd.','02/12/2020','12/30/2028');
INSERT INTO Medication (ProductID, PrescriptionID, [Name], Composition, Manufacturer, ManufacturerDate, ExpiryDate)
    VALUES (5008, 7004, 'Azicip 500',' Azithromycin ','Cipla Ltd.','03/09/2021','02/02/2029');
INSERT INTO Medication (ProductID, PrescriptionID, [Name], Composition, Manufacturer, ManufacturerDate, ExpiryDate)
    VALUES (5009, 7007, 'Pan-D',' Pantoprazole 40mg ','Alkem Laboratories Ltd','05/06/2021','07/07/2030');
INSERT INTO Medication (ProductID, PrescriptionID, [Name], Composition, Manufacturer, ManufacturerDate, ExpiryDate)
    VALUES (5010, 7007, 'Amoxicillin','Magnesium Stearate (E572)','Micro Labs LTD','10/23/2020','01/01/2035');

SELECT * FROM Medication;



-- -- -- Stored Procedure Get Nearest Hospital -- -- --
-- -- -- The SP is used to fetch the nearest hospital to a Patient on the basis of Zipcode of the Hospital and the patient -- -- --

GO
CREATE PROCEDURE Get_Nearest_Hospital @PatientName varchar(50), 
@HospitalName varchar(50) OUTPUT,
@ErrorMessage varchar(50) OUTPUT
AS
BEGIN

IF NOT EXISTS
	(SELECT 1 FROM Patient WHERE [Name] = @PatientName)
	set @ErrorMessage = 'Patient with Name : ' + @PatientName + 'not found'
	--set @HospitalName = ' '
ELSE IF EXISTS
	(SELECT 1 FROM Hospital WHERE Zip in (SELECT ZipCode FROM Patient WHERE [Name] = @PatientName))
	set @HospitalName = (SELECT [Name] FROM Hospital WHERE Zip in (SELECT ZipCode FROM Patient WHERE [Name] = @PatientName))
	--set @ErrorMessage = 'Patient Found'
	--RETURN; --@HospitalName
END;

-- -- -- Execution of Stored Procedure to Find the nearest Hospital for a Patient -- -- --

declare @HospitalName varchar(50), @PatientName varchar(50), @ErrorMessage varchar(50)
set @PatientName = 'Lore McDermott'
EXEC Get_Nearest_Hospital @PatientName ,@HospitalName output, @ErrorMessage output
print @HospitalName
print @ErrorMessage

declare @HospitalName varchar(50), @PatientName varchar(50), @ErrorMessage varchar(50)
set @PatientName = 'Nithin'
EXEC Get_Nearest_Hospital @PatientName ,@HospitalName output, @ErrorMessage output
print @HospitalName
print @ErrorMessage





-- -- -- Stored Procedure Admit_Patient -- -- --
-- -- -- The SP is created to assisst in admitting a patient to a hospital -- -- --

GO
CREATE PROCEDURE Admit_Patient 
@PatientName varchar(50), 
@SymptomsExperienced varchar(100),
@VisitReason varchar(50),
--@Allergies varchar(100),
@Message varchar(50) OUTPUT AS
BEGIN 
declare @PatientID int
declare @CenterID varchar(10)
declare @HospitalID varchar(10)

IF @VisitReason <> 'Checkup' or @VisitReason <> 'Vaccination'
	set @Message = 'Invalid Visit Reason'
	
IF @VisitReason = 'Checkup'
	declare @HospitalName varchar(50), @PatientNameProc varchar(50), @ErrorMessage varchar(50)
	set @PatientNameProc = @PatientName
	EXEC Get_Nearest_Hospital @PatientName ,@HospitalName output, @ErrorMessage output
	print @HospitalName
	print @ErrorMessage

	IF @ErrorMessage = ' ' and @VisitReason <> 'Vaccination'
		 (SELECT PatientID FROM Patient WHERE [Name] = @PatientName)
		  set @PatientID = (SELECT PatientID FROM Patient WHERE [Name] = @PatientName)
		  set @HospitalID = (SELECT HospitalID from Hospital WHERE [Name] = @HospitalName)
		  INSERT INTO Experiences(SymptomID, PatientID, ExperiencedDate)  
		  SELECT SymptomID, @PatientID, GETDATE() FROM Symptoms WHERE SymptomName in (SELECT * FROM string_split(@SymptomsExperienced,','))
		  INSERT INTO Visits(VisitReason, PatientID, HospitalID) VALUES (@VisitReason,@PatientID,@HospitalID)

	IF @ErrorMessage != ' '
		(SELECT 1 FROM Patient)
		set @Message = @ErrorMessage

IF @VisitReason = 'Vaccination'
	set @PatientID = (SELECT PatientID FROM Patient WHERE [Name] = @PatientName)
	IF NOT EXISTS
		(SELECT 1 FROM Visits WHERE PatientID = @PatientID)
		set @VisitReason = 'Vaccination Dose 1'
		set @CenterID = (SELECT CentreID FROM VaccinationCentre WHERE ZipCode = (SELECT ZipCode from Patient WHERE PatientID = @PatientID))
		INSERT INTO Visits(VisitReason, PatientID) VALUES (@VisitReason,@PatientID)
	IF EXISTS
		(SELECT 1 FROM Visits WHERE PatientID = @PatientID and VisitReason = 'Vaccinated Dose 1')
		set @VisitReason = 'Vaccination Dose 2'
		INSERT INTO Visits(VisitReason, PatientID, CentreID) VALUES (@VisitReason,@PatientID,@CenterID)
END;

-- -- -- Execution of Stored Procedure to Admit a patient in a hospital -- -- --

declare @PatientName varchar(50), @SymptomsExperienced varchar(100),@VisitReason varchar(50) @Message varchar(50)
set @PatientName = 'Lore McDermott'
set @VisitReason = 'Checkup'
set @SymptomsExperienced = 'Fever,Cough,Chills,'
EXEC Admit_Patient @PatientName ,@SymptomsExperienced,@VisitReason, @Message output
print @Message

declare @PatientName varchar(50), @SymptomsExperienced varchar(100),@VisitReason varchar(50), @Message varchar(50)
set @PatientName = 'Davina Ratke'
set @VisitReason = 'Checkup'
set @SymptomsExperienced = 'Difficulty Breathing,Loss of taste or smell,Chills'
EXEC Admit_Patient @PatientName ,@SymptomsExperienced,@VisitReason, @Message output
print @Message





-- -- -- Stored Procedure TestScheduler -- -- --
-- -- -- The SP is created to schedule a test for a patient -- -- --

GO
CREATE PROCEDURE TestScheduler 
@PatientName varchar(50),
@Message varchar(100) OUTPUT
AS
BEGIN

declare @PatientID int
declare @Count int
declare @Date date

set @PatientID = (SELECT PatientID FROM Patient WHERE [Name] = @PatientName)
set @Date = GETDATE()

IF @PatientID = ' '
	set @Message = 'Patient not Found'
ELSE
	IF EXISTS
		(SELECT 1 FROM Test WHERE PatientID = @PatientID)
		
		set @Count = (SELECT COUNT(*) FROM Test WHERE Date_of_Testing = GETDATE())
		BEGIN
		IF (@Count >= 150)
			set @Date = (SELECT DATEADD(DAY,1,GETDATE()) AS DateAdd)
			set @Message = 'Test Scheduled for ' + (SELECT CONVERT (varchar,@Date)) + ', a Person from our Team will contact you, Thank you!'
		

		IF @Count <150
			set @Message = 'Test Scheduled for ' + (SELECT CONVERT (varchar,@Date)) + ', a Person from our Team will contact you, Thank you!'
		
		END

END;

-- -- -- Execution of Stored Procedure to Schedule a test for a patient -- -- --

declare @PatientName varchar(50), --@SymptomsExperienced varchar(100), 
@Message varchar(100)
set @PatientName = 'Lore McDermott'
--set @SymptomsExperienced = 'Fever,Cough,Chills'
EXEC TestScheduler @PatientName ,--@SymptomsExperienced, 
@Message output
print @Message

declare @PatientName varchar(50), 
@Message varchar(100)
set @PatientName = 'Davina Ratke'
EXEC TestScheduler @PatientName ,
@Message output
print @Message





-- -- -- Stored Procedure VaccinationScheduler -- -- --
-- -- -- The SP is created to display the vaccination status in the visits table -- -- --

GO
CREATE PROCEDURE VaccinationScheduler 
@PatientName varchar(50),
@Message varchar(100) OUTPUT
AS
BEGIN

declare @PatientID int
declare @VisitReason varchar(50)

set @PatientID = (SELECT PatientID FROM Patient WHERE [Name] = @PatientName)

IF NOT EXISTS
	(SELECT 1 FROM Visits WHERE PatientID = @PatientID)
	set @VisitReason = 'Vaccination Dose 1'
	INSERT INTO Visits(VisitReason, PatientID) VALUES (@VisitReason,@PatientID)
IF EXISTS
	(SELECT 1 FROM Visits WHERE PatientID = @PatientID and VisitReason = 'Vaccinated Dose 1')
	set @VisitReason = 'Vaccination Dose 2'
	INSERT INTO Visits(VisitReason, PatientID) VALUES (@VisitReason,@PatientID)

END;

-- -- -- Execution of Stored Procedure for vaccination status of a patient -- -- --






