USE Covid19RMS;

-- -- -- Insert Statements to enter records in Patient Table -- -- -- 
INSERT INTO Patient ([Name], ContactNumber, DateOfBirth, StreetName, City, [State], ZipCode) VALUES ('Suzie Kris',9785438907,'1990/09/12', 'Calmut Street', 'Boston', 'Massachusetts', '02120');
INSERT INTO Patient ([Name], ContactNumber, DateOfBirth, StreetName, City, [State], ZipCode) VALUES ('Sherell Wisozk',6173459078, '1985/08/13', '47 Lamson Street', 'NewYork', 'NewYork', '02128');
INSERT INTO Patient ([Name], ContactNumber, DateOfBirth, StreetName, City, [State], ZipCode) VALUES ('Kenna Shanahan',8573123490, '1986/07/15', '3 Avery Street', 'San Fransisco', 'California', '02111');
INSERT INTO Patient ([Name], ContactNumber, DateOfBirth, StreetName, City, [State], ZipCode) VALUES ('Adalberto Kreiger', 6473210987, '1991/01/11', '377 Commonwealth Ave', 'Boston', 'Massachusetts', '02115');
INSERT INTO Patient ([Name], ContactNumber, DateOfBirth, StreetName, City, [State], ZipCode) VALUES ('Joie Williamson', 9786541345, '1992/02/23', '31 Circuit Street', 'NewYork', 'NewYork', '02119');
INSERT INTO Patient ([Name], ContactNumber, DateOfBirth, StreetName, City, [State], ZipCode) VALUES ('Davina Ratke', 6134567890, '1978/02/21', '221 Massachusetts Avenue', 'Orelando', 'Florida', '02123');
INSERT INTO Patient ([Name], ContactNumber, DateOfBirth, StreetName, City, [State], ZipCode) VALUES ('Lizeth Rogahn', 8574316730, '1994/12/30', '294 Athens Street', 'San Fransisco', 'California', '02127');
INSERT INTO Patient ([Name], ContactNumber, DateOfBirth, StreetName, City, [State], ZipCode) VALUES ('Truman Schultz', 9871234562, '1992/11/25', '48 Waterman Road', 'Orelando', 'Florida', '02131');
INSERT INTO Patient ([Name], ContactNumber, DateOfBirth, StreetName, City, [State], ZipCode) VALUES ('Seymour Weissnat', 7480931450, '1984/06/15', '108 Litchfield Street', 'NewYork', 'NewYork', '02135');
INSERT INTO Patient ([Name], ContactNumber, DateOfBirth, StreetName, City, [State], ZipCode) VALUES ('Lore McDermott', 6178934109, '1989/05/25', '25 Sherman Street', 'Boston', 'Massachusetts', '02149');

SELECT * FROM Patient;

-- -- -- Insert Statements to enter records in Symptoms Table -- -- -- 
INSERT INTO Symptoms (SymptomName) VALUES ('Fever');
INSERT INTO Symptoms (SymptomName) VALUES ('Chills');
INSERT INTO Symptoms (SymptomName) VALUES ('Cough');
INSERT INTO Symptoms (SymptomName) VALUES ('Difficulty Breathing');
INSERT INTO Symptoms (SymptomName) VALUES ('Fatigue');
INSERT INTO Symptoms (SymptomName) VALUES ('Body Aches');
INSERT INTO Symptoms (SymptomName) VALUES ('Headache');
INSERT INTO Symptoms (SymptomName) VALUES ('Loss of taste or smell');
INSERT INTO Symptoms (SymptomName) VALUES ('Sore Throat');
INSERT INTO Symptoms (SymptomName) VALUES ('Congestion or Runny Nose');
INSERT INTO Symptoms (SymptomName) VALUES ('Nausea or Vommiting');
INSERT INTO Symptoms (SymptomName) VALUES ('Diarrhea');
INSERT INTO Symptoms (SymptomName) VALUES ('Chills');

SELECT * FROM Symptoms;

-- -- -- Insert Statements to enter records in Allergy Table -- -- -- 
INSERT INTO Allergy (AllergyName, AllergyCategory) VALUES ('Grass and Tree pollen', 'Common Allergy');
INSERT INTO Allergy (AllergyName, AllergyCategory) VALUES ('Dust Mites','Dust Allergy');
INSERT INTO Allergy (AllergyName, AllergyCategory) VALUES ('Food', 'Food Allergy');
INSERT INTO Allergy (AllergyName, AllergyCategory) VALUES ('Medicines', 'Drug Allergy');
INSERT INTO Allergy (AllergyName, AllergyCategory) VALUES ('Latex', 'Latex Allergy');
INSERT INTO Allergy (AllergyName, AllergyCategory) VALUES ('Mould', 'Mold Allergy');
INSERT INTO Allergy (AllergyName, AllergyCategory) VALUES ('Household Chemicals', 'Chemical Allergy');
INSERT INTO Allergy (AllergyName, AllergyCategory) VALUES ('Stinging Insect', 'Insect Allergy');
INSERT INTO Allergy (AllergyName, AllergyCategory) VALUES ('Fungi', 'Mold Allergy');
INSERT INTO Allergy (AllergyName, AllergyCategory) VALUES ('Animal Dander', 'Pet Allergy');

SELECT * FROM Allergy;

-- -- -- Insert Statements to enter records in Possess Table -- -- -- 
INSERT INTO Possess (AllergyID,PatientID,PossessedDate) VALUES (1001, 100000, '2020/01/01');
INSERT INTO Possess (AllergyID,PatientID,PossessedDate) VALUES (1000, 100001, '2020/05/11');
INSERT INTO Possess (AllergyID,PatientID,PossessedDate) VALUES (1003, 100002, '2020/03/25');
INSERT INTO Possess (AllergyID,PatientID,PossessedDate) VALUES (1004, 100003, '2020/11/20');
INSERT INTO Possess (AllergyID,PatientID,PossessedDate) VALUES (1005, 100004, '2020/10/29');
INSERT INTO Possess (AllergyID,PatientID,PossessedDate) VALUES (1009, 100005, '2020/12/05');
INSERT INTO Possess (AllergyID,PatientID,PossessedDate) VALUES (1003, 100001, '2020/05/11');
INSERT INTO Possess (AllergyID,PatientID,PossessedDate) VALUES (1001, 100002, '2020/03/25');
INSERT INTO Possess (AllergyID,PatientID,PossessedDate) VALUES (1009, 100003, '2020/11/20');
INSERT INTO Possess (AllergyID,PatientID,PossessedDate) VALUES (1003, 100000, '2020/01/01');

SELECT * FROM Possess;

-- -- -- Insert Statements to enter records in Experiences Table -- -- -- 
-- INSERT INTO Experiences (SymptomID,PatientID,ExperiencedDate) VALUES (2000, 100000, '2021/01/20');
-- INSERT INTO Experiences (SymptomID,PatientID,ExperiencedDate) VALUES (2001, 100000, '2021/01/20');
-- INSERT INTO Experiences (SymptomID,PatientID,ExperiencedDate) VALUES (2002, 100000, '2021/01/20');
-- INSERT INTO Experiences (SymptomID,PatientID,ExperiencedDate) VALUES (2003, 100001, '2021/05/23');
-- INSERT INTO Experiences (SymptomID,PatientID,ExperiencedDate) VALUES (2004, 100001, '2021/05/23');
-- INSERT INTO Experiences (SymptomID,PatientID,ExperiencedDate) VALUES (2005, 100001, '2021/05/23');
-- INSERT INTO Experiences (SymptomID,PatientID,ExperiencedDate) VALUES (2006, 100002, '2021/11/01');
-- INSERT INTO Experiences (SymptomID,PatientID,ExperiencedDate) VALUES (2007, 100002, '2021/11/01');
-- INSERT INTO Experiences (SymptomID,PatientID,ExperiencedDate) VALUES (2008, 100002, '2021/11/01');
-- INSERT INTO Experiences (SymptomID,PatientID,ExperiencedDate) VALUES (2009, 100002, '2021/11/01');

-- SELECT * FROM Experiences;

-- -- -- Insert Statements to enter records in Hospital Table -- -- -- 
INSERT INTO Hospital VALUES ('H001', 'Small', '02128', 'New York', 'New York', '49 Robinwood Ave', '8976542345', 'Arbour Hospital');
INSERT INTO Hospital VALUES ('H002', 'Medium', '02115', 'Massachusetts', 'Boston', '75 Francis St', '6789876543', 'Brigham Hospital');
INSERT INTO Hospital VALUES ('H003', 'Large', '02119', 'New York', 'New York', '1 Boston Medical Center', '7865435627', 'Boston Medical Center');
INSERT INTO Hospital VALUES ('H004', 'Small', '02111', 'California', 'San Fransisco', '800 Washington St', '8764567999', 'Tufts Medical Center');
INSERT INTO Hospital VALUES ('H005', 'Medium', '02149', 'Massachusetts', 'Boston', '55 Fruit St', '5678987098', 'Massachusetts General Hospital');
INSERT INTO Hospital VALUES ('H006', 'Large', '02123', 'Florida', 'Orlando', '2100 Dorchester Ave', '9897654536', 'Carney Hospital');
INSERT INTO Hospital VALUES ('H007', 'Small', '02135', 'New York', 'New York', '185 Pilgrim Road', '5643254367', 'Beth Israel Deaconess Medical Center');
INSERT INTO Hospital VALUES ('H008', 'Medium', '02127', 'California', 'San Fransisco', '409 W Broadway', '7789871212', 'South Boston Community Health Center');
INSERT INTO Hospital VALUES ('H009', 'Large', '02120', 'Massachusetts', 'Boston', '125 Parker Hill Ave', '6767898765', 'New England Baptist Hospital' );
INSERT INTO Hospital VALUES ('H010', 'Small', '02131', 'Florida', 'Orlando', '170 Morton St', '6758987899', 'Lemuel Shattuck Hospital' );

SELECT * FROM Hospital;

-- -- -- Insert Statements to enter records in VaccinationCentre Table -- -- -- 
INSERT INTO VaccinationCentre(CentreID, StaffCount,ZipCode,[State],City,StreetName,ContactNumber,[Name]) VALUES ('C0001', 10,'02120','Boston','Massachusetts','Boylston Street',9885438907,'CVS Pharmacy');
INSERT INTO VaccinationCentre(CentreID, StaffCount,ZipCode,[State],City,StreetName,ContactNumber,[Name]) VALUES ('C0002',15,'02128','New York','New York','Newburry Street',9185438907,'Sudbury Pharmacy');
INSERT INTO VaccinationCentre(CentreID, StaffCount,ZipCode,[State],City,StreetName,ContactNumber,[Name]) VALUES ('C0003',10,'02111','San Fransisco','California','Commonwealth Ave',9785438906,'Walpole Pharmacy');
INSERT INTO VaccinationCentre(CentreID, StaffCount,ZipCode,[State],City,StreetName,ContactNumber,[Name]) VALUES ('C0004',12,'02115','Boston','Massachusetts','Huntington Ave',9785438901,'Walgreens');
INSERT INTO VaccinationCentre(CentreID, StaffCount,ZipCode,[State],City,StreetName,ContactNumber,[Name]) VALUES ('C0005',11,'02119','New York','New York','South Huntington Ave',9785338907,'Hannaford');
INSERT INTO VaccinationCentre(CentreID, StaffCount,ZipCode,[State],City,StreetName,ContactNumber,[Name]) VALUES ('C0006',20,'02123','Orlando','Florida','Mission Main' ,9785538907,'Walmart');
INSERT INTO VaccinationCentre(CentreID, StaffCount,ZipCode,[State],City,StreetName,ContactNumber,[Name]) VALUES ('C0007',18,'02127','San Fransisco','California','Park Street',9785838907,'Walgreens');
INSERT INTO VaccinationCentre(CentreID, StaffCount,ZipCode,[State],City,StreetName,ContactNumber,[Name]) VALUES ('C0008',30,'02131','Orlando','Florida','Downtown Crossing',9785638907,'Wegmans');
INSERT INTO VaccinationCentre(CentreID, StaffCount,ZipCode,[State],City,StreetName,ContactNumber,[Name]) VALUES ('C0009',25,'02135','New York','New York','Copley',9785138907,'Walmart');
INSERT INTO VaccinationCentre(CentreID, StaffCount,ZipCode,[State],City,StreetName,ContactNumber,[Name]) VALUES ('C0010',22,'02149','Boston','Massachusetts','Fenway',9285438907,'CVS Pharmacy');

SELECT * FROM VaccinationCentre;

select * FROM employee;

-- -- -- Insert Statements to enter records in Distributor Table -- -- -- 
INSERT INTO Distributor([Name] ,Website, CentreID) VALUES('GlaxoSmithKline','https://www.gsk.com/', 'C0001');
INSERT INTO Distributor([Name] ,Website, CentreID) VALUES('Sanofi','https://www.sanofi.com/', 'C0002');
INSERT INTO Distributor([Name] ,Website, CentreID) VALUES('McKesson','https://www.mckesson.com/', 'C0003');
INSERT INTO Distributor([Name] ,Website, CentreID) VALUES('Novavax','https://www.novavax.com/', 'C0004');
INSERT INTO Distributor([Name] ,Website, CentreID) VALUES('EmergentBioSolutions','https://www.emergentbiosolutions.com/', 'C0005');
INSERT INTO Distributor([Name] ,Website, CentreID) VALUES('Catalent','https://www.catalent.com/', 'C0006');
INSERT INTO Distributor([Name] ,Website, CentreID) VALUES('Pfizer','https://www.pfizer.com/', 'C0007');
INSERT INTO Distributor([Name] ,Website, CentreID) VALUES('AstraZeneca','https://www.astrazeneca.com/', 'C0008');
INSERT INTO Distributor([Name] ,Website, CentreID) VALUES('Modernatx','https://www.modernatx.com/', 'C0009');
INSERT INTO Distributor([Name] ,Website, CentreID) VALUES('Biontech','https://biontech.de/', 'C0010');

SELECT * FROM Distributor;

-- -- -- Insert Statements to enter records in Vaccine Table -- -- -- 
INSERT INTO Vaccine(BatchNumber, Company, SideEffects, DistributorLicenseID) VALUES (564789, 'Pfizer', 'Fever', 3001);
INSERT INTO Vaccine(BatchNumber, Company, SideEffects, DistributorLicenseID) VALUES (598476, 'Moderna', 'Body Pain', 3002);
INSERT INTO Vaccine(BatchNumber, Company, SideEffects, DistributorLicenseID) VALUES (589584, 'Johnson & Johnson', 'Headache', 3003);
INSERT INTO Vaccine(BatchNumber, Company, SideEffects, DistributorLicenseID) VALUES (556744, 'AstraZeneca', 'Fatigue', 3004);
INSERT INTO Vaccine(BatchNumber, Company, SideEffects, DistributorLicenseID) VALUES (598473, 'Covishield', 'Nausea', 3005);
INSERT INTO Vaccine(BatchNumber, Company, SideEffects, DistributorLicenseID) VALUES (556784, 'Pfizer', 'Fever', 3006);
INSERT INTO Vaccine(BatchNumber, Company, SideEffects, DistributorLicenseID) VALUES (534521, 'Moderna', 'Body Pain', 3007);
INSERT INTO Vaccine(BatchNumber, Company, SideEffects, DistributorLicenseID) VALUES (598076, 'Johnson & Johnson', 'Headache', 3008);
INSERT INTO Vaccine(BatchNumber, Company, SideEffects, DistributorLicenseID) VALUES (512093, 'AstraZeneca', 'Fatigue', 3009);
INSERT INTO Vaccine(BatchNumber, Company, SideEffects, DistributorLicenseID) VALUES (576543, 'Covishield', 'Nausea', 3000);

SELECT * FROM Vaccine;

-- -- -- Insert Statements to enter records in Rooms Table -- -- -- 
INSERT INTO Rooms([Room Type], HospitalID) VALUES('ICU', 'H001');
INSERT INTO Rooms([Room Type], HospitalID) VALUES('General', 'H002');
INSERT INTO Rooms([Room Type], HospitalID) VALUES('Deluxe', 'H003');
INSERT INTO Rooms([Room Type], HospitalID) VALUES('Single Occupancy', 'H004');
INSERT INTO Rooms([Room Type], HospitalID) VALUES('Double Occupancy', 'H005');
INSERT INTO Rooms([Room Type], HospitalID) VALUES('ICU', 'H006');
INSERT INTO Rooms([Room Type], HospitalID) VALUES('General', 'H007');
INSERT INTO Rooms([Room Type], HospitalID) VALUES('Deluxe', 'H008');
INSERT INTO Rooms([Room Type], HospitalID) VALUES('Single Occupancy', 'H009');
INSERT INTO Rooms([Room Type], HospitalID) VALUES('Double Occupancy', 'H010');

SELECT * FROM Rooms;

-- -- -- Insert Statements to enter records in Test Table -- -- -- 
INSERT INTO Test (PatientID, Date_of_Testing, Time_of_Testing, Result) VALUES (100000, '2021/01/21', '08:30', 'Positive - Detected' );
INSERT INTO Test (PatientID, Date_of_Testing, Time_of_Testing, Result) VALUES (100000, '2021/02/13', '17:00', 'Negative' );
INSERT INTO Test (PatientID, Date_of_Testing, Time_of_Testing, Result) VALUES (100000, '2021/02/20', '09:00', 'Negative' );
INSERT INTO Test (PatientID, Date_of_Testing, Time_of_Testing, Result) VALUES (100001, '2021/05/23', '18:00', 'Positive - Detected' );
INSERT INTO Test (PatientID, Date_of_Testing, Time_of_Testing, Result) VALUES (100001, '2021/06/20', '09:00', 'Negative' );
INSERT INTO Test (PatientID, Date_of_Testing, Time_of_Testing, Result) VALUES (100006, '2020/08/16', '15:00', 'Positive - Detected' );
INSERT INTO Test (PatientID, Date_of_Testing, Time_of_Testing, Result) VALUES (100006, '2020/09/01', '17:00', 'Negative' );
INSERT INTO Test (PatientID, Date_of_Testing, Time_of_Testing, Result) VALUES (100002, '2021/11/01', '11:00', 'Positive - Detected');
INSERT INTO Test (PatientID, Date_of_Testing, Time_of_Testing, Result) VALUES (100002, '2021/11/01', '10:00', 'Negative' );
INSERT INTO Test (PatientID, Date_of_Testing, Time_of_Testing, Result) VALUES (100005, '2020/11/01', '10:30', 'Negative');

SELECT * FROM Test;



