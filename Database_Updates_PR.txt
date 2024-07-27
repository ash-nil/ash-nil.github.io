CREATE DEFINER=`nilson`@`localhost` PROCEDURE `Customer.PrCustomerChurn`()
BEGIN

-- **establish variables**
DECLARE VarCurrentTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
DECLARE VarSourceRowCount, VarTargetRowCount, VarThresholdNbr INTEGER DEFAULT 0;
DECLARE VarTinyIntVal TINYINT;

-- **count rows in source & target tables**
SELECT COUNT(*)
INTO VarSourceRowCount
FROM Customer.CustomerChurn_Stage;

SELECT COUNT(*)
INTO VarTargetRowCount
FROM Customer.CustomerChurn;

-- **set threshold ar 20% of target row count**
SELECT CAST((VarTargetRowCount * .2) AS UNSIGNED INTEGER)
INTO VarThresholdNbr; 

-- **end procedure if source row count < threshold**
IF VarSourceRowCount < VarThresholdNbr THEN
SELECT -129
INTO VarTinyIntVal;
END IF;

-- **disable safe updates**
SET SQL_SAFE_UPDATES = 0; 

-- **remove rows from target that aren't in source**
DELETE
FROM Customer.CustomerChurn AS TrgtTbl
WHERE EXISTS 
	(
	SELECT * FROM 
		(
		SELECT TT.CustomerId
		FROM Customer.CustomerChurn AS TT
		LEFT JOIN
		Customer.CustomerChurn_Stage AS ST
		ON TT.CustomerId = ST.CustomerId
		WHERE ST.CustomerId IS NULL
		) AS SrcTbl
	WHERE TrgtTbl.CustomerId = SrcTbl.CustomerId
	);

-- **update rows in target that changed in source**
UPDATE Customer.CustomerChurn AS TrgtTbl
INNER JOIN Customer.CustomerChurn_Stage AS SrcTbl
ON  TrgtTbl.CustomerId = SrcTbl.CustomerId
SET TrgtTbl.Surname = SrcTbl.Surname,
    TrgtTbl.CreditScore = SrcTbl.CreditScore,
    TrgtTbl.Geography = SrcTbl.Geography,
    TrgtTbl.Gender = SrcTbl.Gender,
    TrgtTbl.Age = SrcTbl.Age,
    TrgtTbl.Balance = SrcTbl.Balance,
    TrgtTbl.Exited = SrcTbl.Exited,
    TrgtTbl.ChangeDtm = VarCurrentTimestamp

WHERE (
      COALESCE(TrgtTbl.Surname,'*') <> COALESCE(SrcTbl.Surname,'*')
	   OR COALESCE(TrgtTbl.CreditScore,'*') <> COALESCE(SrcTbl.CreditScore,'*') 
	   OR COALESCE(TrgtTbl.Geography,'*') <> COALESCE(SrcTbl.Geography,'*')
	   OR COALESCE(TrgtTbl.Gender,'*') <> COALESCE(SrcTbl.Gender,'*')
	   OR COALESCE(TrgtTbl.Age,'*') <> COALESCE(SrcTbl.Age,'*')
	   OR COALESCE(TrgtTbl.Balance,'*') <> COALESCE(SrcTbl.Balance,'*')
	   OR COALESCE(TrgtTbl.Exited,'*') <> COALESCE(SrcTbl.Exited,'*')
	   );

-- **insert new rows from source that aren't in target**
INSERT INTO  Customer.CustomerChurn
	(
	CustomerId,
	Surname,
	CreditScore,
	Geography,
	Gender,
	Age,
	Balance,
	Exited,
	SourceSystemNm,
	CreateAgentId,
	CreateDtm,
	ChangeAgentId,
	ChangeDtm
	)
SELECT 
	SrcTbl.CustomerId,
	SrcTbl.Surname,
	SrcTbl.CreditScore,
	SrcTbl.Geography,
	SrcTbl.Gender,
	SrcTbl.Age,
	SrcTbl.Balance,
	SrcTbl.Exited,
	'Kaggle-CSV' AS SourceSystemNm,
	current_user() AS CreateAgentId,
	VarCurrentTimestamp AS CreateDtm,
	current_user() AS ChangeAgentId,
	VarCurrentTimestamp AS ChangeDtm
FROM Customer.CustomerChurn_Stage AS SrcTbl
INNER JOIN
	(
	SELECT ST.CustomerId
	FROM Customer.CustomerChurn_Stage AS ST
	LEFT JOIN
	Customer.CustomerChurn AS TT
	ON ST.CustomerId = TT.CustomerId
	WHERE TT.CustomerId IS NULL
	) AS ChgdNew
ON  SrcTbl.CustomerId = ChgdNew.CustomerId;

-- **re-enable safe updates & end**
SET SQL_SAFE_UPDATES = 1; 

END