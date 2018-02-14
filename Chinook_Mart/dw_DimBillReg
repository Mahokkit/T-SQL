USE Chinook
GO

SELECT DISTINCT(i.BillingCountry) FROM dbo.Invoice i -- 24 --level 3
SELECT DISTINCT(isnull(i.BillingState, i.BillingCountry)) FROM dbo.Invoice i --42 --level 2
SELECT DISTINCT(i.BillingCity) FROM dbo.Invoice i --53 level 1

SELECT 
	'AllLevel' AS 'AllLevels',
	i.BillingCountry AS 'billCnty', 
	isnull(i.BillingState, i.BillingCountry) AS 'billState', 
	i.BillingCity AS 'billCity'
INTO stg.DimBillReg
FROM dbo.Invoice i
GROUP BY i.BillingCountry, isnull(i.BillingState, i.BillingCountry), i.BillingCity

--checking
SELECT * FROM stg.DimBillReg

DROP TABLE dw.[DimBillReg] -- if exist

CREATE TABLE dw.[DimBillReg]
(	
	[billKey] INT IDENTITY(100,1),
	[AllLevels] [varchar](8) NOT NULL,
	[billCnty] [nvarchar](40) NULL,
	[billState] [nvarchar](40) NULL,
	[billCity] [nvarchar](40) NULL
) ON [PRIMARY]
GO

ALTER TABLE dw.DimBillReg
	ADD CONSTRAINT pk_billCity PRIMARY KEY CLUSTERED (billKey)

INSERT INTO dw.DimBillReg SELECT b.AllLevels,b.billCnty, b.billState, b.billCity FROM stg.DimBillReg b;
