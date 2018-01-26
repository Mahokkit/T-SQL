/*
Student: Edward Ma
ID Num#: W0057568
Date: January 26, 2018
Dim Tech Check
*/

-- selecing Database
USE Chinook
GO

-- Dims Tech Check Question 6 A
-- check if table exist, if so... drop it
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'tc' AND TABLE_NAME = 'DimCustomer')
BEGIN
	DROP TABLE [tc].[DimCustomer]
END

-- Dims Tech Check Question 6 B
-- check if schema exists, if so... drop it.
IF EXISTS (SELECT 1 FROM sys.schemas WHERE [NAME] = 'tc')
BEGIN
	DROP SCHEMA tc
END
