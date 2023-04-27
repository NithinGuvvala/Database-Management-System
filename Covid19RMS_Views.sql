
-- -- -- Creation of VIEW NumberOfActPatientsInZipCode -- -- --
-- -- -- This view is used to display the number of active patients in a particular zipcode -- -- --

CREATE VIEW [NumberOfActPatientsInZipCode] AS
SELECT ZipCode,Count(*) AS NumberOfActivePatients FROM Patient WHERE PatientID IN (SELECT PatientID FROM Visits) GROUP BY ZipCode;

SELECT * FROM NumberOfActPatientsInZipCode;



-- -- -- Creation of VIEW NumberofPartiallyVaccinatedPatients -- -- --
-- -- -- This view is used to display the partially vaccinated patients(only 1st dose) in a particular zipcode -- -- --

CREATE VIEW [NumberofPartiallyVaccinatedPatients] AS
SELECT ZipCode, COUNT(*) AS [Count] FROM Patient WHERE PatientID IN (SELECT PatientID FROM Visits WHERE CentreID <> ' ' 
AND VisitReason = 'Vaccinated Dose 1') GROUP BY ZipCode;

SELECT * FROM NumberofPartiallyVaccinatedPatients;



-- -- -- Creation of VIEW NumberofFullyVaccinatedPatients -- -- --
-- -- -- This view is used to display the fully vaccinated patients(all doses) in a particular zipcode -- -- --

CREATE VIEW [NumberofFullyVaccinatedPatients] AS
SELECT ZipCode, COUNT(*) AS [Count] FROM Patient WHERE PatientID IN (SELECT PatientID FROM Visits WHERE CentreID <> ' ' 
AND VisitReason = 'Vaccinated Dose 2') GROUP BY ZipCode;

SELECT * FROM NumberofFullyVaccinatedPatients;



-- -- -- Creation of VIEW AvailableRooms -- -- --
-- -- -- This view is used to display the available rooms in a particular hospital -- -- --

CREATE VIEW AvailableRooms AS
SELECT [Room Type],COUNT(*) AS [COUNT] FROM Hospital H INNER JOIN Rooms R ON H.HospitalID=R.HospitalID GROUP BY [Room Type];

SELECT * FROM AvailableRooms;
