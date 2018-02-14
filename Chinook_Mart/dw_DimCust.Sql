USE Chinook
GO
-- checking my levels
SELECT CustomerID AS 'Cx' FROM Customer;
SELECT City FROM Customer ORDER BY 1 DESC; -- 59
SELECT COUNT(DISTINCT(City)) AS 'City' FROM Customer; -- Distinct 53
SELECT [State] AS 'State' FROM Customer WHERE [State] IS NOT NULL; --30
SELECT DISTINCT isnull([State], Country) FROM Customer; -- 42
SELECT COUNT(DISTINCT(Country)) AS 'Country' FROM Customer; --24
SELECT DISTINCT(SupportRepId) FROM Customer; -- 3

SELECT 
	cx.CustomerId AS 'CustID', -- leaf level
	cx.FirstName + ' '+ cx.LastName AS 'CustName', -- level 0?
	cx.City AS 'CustCity', -- level 1?
	isnull(cx.[State], cx.Country) AS 'CustState', -- level 2?
	cx.Country AS 'CustCountry', -- level 3?
	cx.SupportRepId  AS 'CustRepID', -- level 4
	'All Cx' AS 'AllLevel', -- level 5
	emp.FirstName + ' ' + emp.LastName AS 'CustRepName',
	-- customer attribute
	cx.FirstName AS 'CustFName',
	cx.LastName AS 'CustLName',
	emp.FirstName AS 'CustRepFName',
	emp.LastName AS 'CustRepLName',
	isnull(cx.Company, 'NA') AS 'CustCompany', -- cx attribute
	cx.[Address] AS 'CustAddress', -- cx attribute
	cx.PostalCode AS 'CustPostalCode', -- address attribute
	isnull(cx.Phone, 'NA') AS 'CustPhone', -- cx attribute
	isnull(cx.Fax, 'NA') AS 'CustFax', -- cx attribute
	cx.email AS 'CustEmail' -- cx attribute
INTO [stg].[DimCust]
FROM [dbo].[Customer] cx
INNER JOIN  [dbo].Employee emp ON emp.EmployeeId = cx.SupportRepId;

CREATE TABLE [dw].[DimCust](
	[CustID] [int] NOT NULL,
	[CustName] [nvarchar](61) NOT NULL,
	[CustCity] [nvarchar](40) NULL,
	[CustState] [nvarchar](40) NULL,
	[CustCountry] [nvarchar](40) NULL,
	[CustRepID] [int] NULL,
	[AllLevel] [varchar](6) NOT NULL,
	[CustRepName] [nvarchar](41) NOT NULL,
	[CustFName] [nvarchar](40) NOT NULL,
	[CustLName] [nvarchar](20) NOT NULL,
	[CustRepFName] [nvarchar](20) NOT NULL,
	[CustRepLName] [nvarchar](20) NOT NULL,
	[CustCompany] [nvarchar](80) NOT NULL,
	[CustAddress] [nvarchar](70) NULL,
	[CustPostalCode] [nvarchar](10) NULL,
	[CustPhone] [nvarchar](24) NOT NULL,
	[CustFax] [nvarchar](24) NOT NULL,
	[CustEmail] [nvarchar](60) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE dw.DimCust
	ADD CONSTRAINT pk_CustKey PRIMARY KEY CLUSTERED (CustID);

INSERT INTO dw.DimCust
SELECT * FROM stg.DimCust;
