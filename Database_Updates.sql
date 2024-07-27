-- setup database
CREATE DATABASE Customer;
SHOW DATABASES;
USE Customer;

-- setup staging table
CREATE TABLE Customer.CustomerChurn_Stage (
CustomerId INT PRIMARY KEY,
Surname	VARCHAR(50),
CreditScore	SMALLINT,
Geography VARCHAR(50),
Gender VARCHAR(15),
Age TINYINT,
Balance	DECIMAL(10,2),
Exited TINYINT
);
DESCRIBE Customer.CustomerChurn_Stage;

-- setup persistent table
CREATE TABLE Customer.CustomerChurn (
CustomerId INT PRIMARY KEY,
Surname	VARCHAR(50),
CreditScore	SMALLINT,
Geography VARCHAR(50),
Gender VARCHAR(15),
Age TINYINT,
Balance	DECIMAL(10,2),
Exited TINYINT,
SourceSystemNm CHAR(20) NOT NULL,
CreateAgentId CHAR(20) NOT NULL,
CreateDtm DATETIME NOT NULL,
ChangeAgentId CHAR(20) NOT NULL,
ChangeDtm DATETIME NOT NULL);
DESCRIBE Customer.CustomerChurn;
-- get row count from stage table
SELECT COUNT(*) FROM Customer.CustomerChurn_Stage;

-- get last rows from stage
SELECT * FROM Customer.CustomerChurn_Stage
ORDER BY CustomerID DESC LIMIT 3;

-- call procedure
CALL `Customer`.`Customer.PrCustomerChurn`();

-- confirm row counts
SELECT COUNT(*) AS 'Persistent Table Rows' 
FROM Customer.CustomerChurn;
SELECT COUNT(*) AS 'Staging Table Rows' 
FROM Customer.CustomerChurn_Stage;

-- get last rows from persistent
SELECT * FROM Customer.CustomerChurn
ORDER BY CustomerID DESC LIMIT 3;

-- create new table duplicating persistent table as V1
CREATE TABLE Customer.CustomerChurn_Version1 AS SELECT * FROM Customer.CustomerChurn;
DESCRIBE Customer.CustomerChurn_Version1;
SELECT COUNT(*) FROM Customer.CustomerChurn_Version1;
SELECT * FROM Customer.CustomerChurn_Version1
ORDER BY CustomerID DESC LIMIT 3;

-- empty the staging table
TRUNCATE TABLE Customer.CustomerChurn_Stage;
SELECT * FROM Customer.CustomerChurn_Stage;

-- row info from new data in staging
SELECT COUNT(*) FROM Customer.CustomerChurn_Stage;
SELECT * FROM Customer.CustomerChurn_Stage
ORDER BY CustomerID DESC LIMIT 3;

-- rerun PR
CALL `Customer`.`Customer.PrCustomerChurn`();

-- compare updated persistent to V1
SELECT COUNT(*) AS 'Persistent Table Rows' 
FROM Customer.CustomerChurn;
SELECT COUNT(*) AS 'Version 1 Table Rows' 
FROM Customer.CustomerChurn_Version1;

-- rows in V1 not in new persistent
SELECT * FROM Customer.CustomerChurn_Version1
LEFT JOIN Customer.CustomerChurn
ON CustomerChurn_Version1.CustomerId = CustomerChurn.CustomerId
WHERE CustomerChurn.CustomerId IS NULL
ORDER BY CustomerChurn_Version1.CustomerId;

-- rows updated between V1 and persistent
SELECT * FROM Customer.CustomerChurn_Version1
INNER JOIN Customer.CustomerChurn
ON CustomerChurn_Version1.CustomerId = CustomerChurn.CustomerId
WHERE CustomerChurn.Surname <> CustomerChurn_Version1.Surname
OR CustomerChurn.CreditScore <> CustomerChurn_Version1.CreditScore
OR CustomerChurn.Geography <> CustomerChurn_Version1.Geography
OR CustomerChurn.Gender <> CustomerChurn_Version1.Gender
OR CustomerChurn.Age <> CustomerChurn_Version1.Age
OR CustomerChurn.Balance <> CustomerChurn_Version1.Balance
OR CustomerChurn.Exited <> CustomerChurn_Version1.Exited
ORDER BY CustomerChurn_Version1.CustomerId;

-- last few rows from persistent
SELECT * FROM Customer.CustomerChurn
ORDER BY CustomerID DESC LIMIT 3;

-- rows in persistent that weren't in V1
SELECT * FROM Customer.CustomerChurn
LEFT JOIN Customer.CustomerChurn_Version1
ON CustomerChurn.CustomerId = CustomerChurn_Version1.CustomerId
WHERE CustomerChurn_Version1.CustomerId IS NULL
ORDER BY CustomerChurn.CustomerId;