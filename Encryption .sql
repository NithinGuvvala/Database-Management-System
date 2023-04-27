USE Covid19RMS
-- Create master key for the DB
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'D@mg6210P@ssword';

--Verify master key exists
SELECT name KeyName,
  symmetric_key_id KeyID,
  key_length KeyLength,
  algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;

--Create a self signed certificate and name it EmpPass
CREATE CERTIFICATE SSNPass  
   WITH SUBJECT = 'SSN Sample Password';

   --Create a symmetric key  with AES 256 algorithm using the certificate as encryption/decryption method
CREATE SYMMETRIC KEY SSNPass_SM 
    WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE SSNPass;  
GO 

-- Open the symmetric key with which to encrypt the data.  
OPEN SYMMETRIC KEY SSNPass_SM  
   DECRYPTION BY CERTIFICATE SSNPass

   -- Encrypt the value in column Password  with symmetric  key, and default everyone with a password of  
UPDATE dbo.Employee set [SSN] = EncryptByKey(Key_GUID('SSNPass_SM'),  convert(varbinary,'PwdDAMG6210')  ) 
GO 

-- First open the symmetric key with which to decrypt the data.  
OPEN SYMMETRIC KEY SSNPass_SM  
   DECRYPTION BY CERTIFICATE SSNPass;  
 
   SELECT *, 
    CONVERT(varchar, DecryptByKey([Password]))   
    AS 'Decrypted password'  
    FROM dbo.Employee;  
GO 
