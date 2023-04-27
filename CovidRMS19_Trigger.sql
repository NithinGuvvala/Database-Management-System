
-- -- -- Creation of Trigger NewEmployeeCreated -- -- -- 
-- -- -- Insertion of records in the NewEmployeeCreated -- -- --


CREATE TRIGGER NewEmployeeCreated 
ON Employee FOR INSERT AS
BEGIN
declare @Action varchar(1), @Message varchar(50)
set @Action= 'U' 
set @Message = 'Record Created in Employee Table, to be assigned to Doctor/Nurse/Staff'
INSERT INTO EmployeeAudit(EmployeeID,SSN,HospitalID,[Name],DateOfBirth,ContactNumber,Department)
SELECT EmployeeID, SSN,HospitalID, [Name], DateOfBirth, ContactNumber, Department FROM inserted
END

CREATE TABLE EmployeeAudit
(EmployeeAuditID int not null PRIMARY KEY IDENTITY(1,1),
EmployeeID int not null,
SSN VARCHAR(12) not null,
HospitalID VARCHAR(10),
[Name] varchar(50),
DateOfBirth date,
ContactNumber char(10),
Department varchar(25),
[Action] varchar,
[Message] varchar(50)
);

