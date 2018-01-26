/*
Student: Edward Ma
ID Num#: W0057568
Date: January 26, 2018
Dim Tech Check
*/

-- selecting database
USE Chinook
GO

-- Dims Tech Check Question 2
-- creating schema 
CREATE SCHEMA tc
GO

-- Dims Tech Check Question 3
-- level checking
SELECT CustomerID AS 'Cx' FROM Customer; -- leaf level 0

SELECT COUNT(DISTINCT(City)) FROM Customer ORDER BY 1 DESC; -- 53 -- level 1

SELECT DISTINCT isnull([State], Country) FROM Customer; -- 42 -- level 2

SELECT COUNT(DISTINCT(Country)) AS 'Country' FROM Customer; --24 -- level 3

/*
	Each Customer (leaf level) belong to a city (level 1), each city belong to a state (level 2), and each state belong to a country (level 3)
*/

-- creating select query and insert into [tc].[DimCustomer]
SELECT 
	cx.CustomerId AS 'CustID', -- leaf level
	cx.FirstName + ' '+ cx.LastName AS 'CustName', -- level 0
	cx.City AS 'CustCity', -- level 1
	isnull(cx.[State], cx.Country) AS 'CustState', -- level 2
	cx.Country AS 'CustCountry', -- level 3
	'All Cx' AS 'AllLevel',
	emp.FirstName + ' ' + emp.LastName AS 'CustRepName',
	-- customer attribute
	cx.FirstName AS 'CustFName',
	cx.LastName AS 'CustLName',
	emp.FirstName AS 'CustRepFName',
	emp.LastName AS 'CustRepLName',
	cx.SupportRepId  AS 'CustRepID', -- cx attribute
	isnull(cx.Company, 'NA') AS 'CustCompany', -- cx attribute
	cx.[Address] AS 'CustAddress', -- cx attribute
	cx.PostalCode AS 'CustPostalCode', -- address attribute
	isnull(cx.Phone, 'NA') AS 'CustPhone', -- cx attribute
	isnull(cx.Fax, 'NA') AS 'CustFax', -- cx attribute
	cx.email AS 'CustEmail' -- cx attribute
INTO [tc].[DimCustomer]
FROM [dbo].[Customer] cx
INNER JOIN  [dbo].Employee emp ON emp.EmployeeId = cx.SupportRepId;

-- checking my tc.DimCustomer Table
SELECT * FROM [tc].DimCustomer

-- Dims Tech Check Question 4
-- altering table, adding Primary Key
ALTER TABLE [tc].[DimCustomer]
	ADD CONSTRAINT pk_CustKey PRIMARY KEY CLUSTERED (CustID)

-- Dims Tech Check Question 5 A
SELECT 
	dc.CustCountry AS 'Country', 
	SUM(iL.UnitPrice * iL.Quantity) AS 'Total' 
FROM [tc].[DimCustomer] dC
INNER JOIN [dbo].Invoice i ON i.BillingCountry = dC.CustCountry
INNER JOIN [dbo].InvoiceLine iL ON iL.InvoiceId = i.InvoiceId
GROUP BY dC.CustCountry
ORDER By 2 DESC

/* testing script
SELECT i.BillingCountry, SUM(iL.UnitPrice * iL.Quantity) AS 'Total For Country' FROM Invoice i
INNER JOIN InvoiceLine iL ON iL.InvoiceId = i.InvoiceId
GROUP BY i.BillingCountry

SELECT DISTINCT(i.BillingCountry) FROM [dbo].Invoice i
*/

-- Dim Tech Check Question 5 B
SELECT 
	dC.AllLevel, 
	SUM(iL.UnitPrice * iL.Quantity) AS 'Total' 
FROM [tc].[DimCustomer] dC
INNER JOIN [dbo].Invoice i ON i.BillingCountry = dC.CustCountry
INNER JOIN [dbo].InvoiceLine iL ON iL.InvoiceId = i.InvoiceId
GROUP BY dC.AllLevel
