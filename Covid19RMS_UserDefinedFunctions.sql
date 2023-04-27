
-- -- -- Create User Defined Function split_string -- -- --
-- -- -- This UDF helps in splitting the string which is further used in stored procedures -- -- --

GO
CREATE FUNCTION split_string
( @in_string VARCHAR(MAX),
  @delimeter VARCHAR(1)
)
RETURNS @list TABLE(tuple VARCHAR(100))
AS
BEGIN
        WHILE LEN(@in_string) > 0
        BEGIN
            INSERT INTO @list(tuple)
            SELECT left(@in_string, charindex(@delimeter, @in_string+',') -1) as tuple
    
            SET @in_string = stuff(@in_string, 1, charindex(@delimeter, @in_string + @delimeter), '')
        end
    RETURN 
END




-- -- -- Create User Defined Function AGE -- -- --
-- -- -- This UDF helps in calculating the age of a patient using the date of birth -- -- --

GO
CREATE FUNCTION AGE(@DateOfBirth AS DATETIME)
RETURNS INT
AS
BEGIN
DECLARE @Years AS INT
DECLARE @BirthdayDate AS DATETIME
DECLARE @Age AS INT

--Calculate difference in years
SET @Years = DATEDIFF(YY,@DateOfBirth,GETDATE())

--Add years to DateOfBirth
SET @BirthdayDate = DATEADD(YY,@Years,@DateOfBirth)

--Subtract a year if birthday is after today
SET @Age = @Years -
CASE
WHEN @BirthdayDate>GETDATE() THEN 1
ELSE 0
END

--Return the result
RETURN @Age
END