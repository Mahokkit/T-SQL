USE UKAccidents;
GO

CREATE SCHEMA rpt;
GO

USE [UKAccidents]
GO

/****** Object:  Table [dbo].[DimDate]    Script Date: 2018-03-24 6:51:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [rpt].dCalendar

SELECT 
	DateKey,
	[Date],
	[DayOfMonth],
	DaySuffix
INTO rpt.dCalendar
FROM stg.DimDate;

SELECT * FROM rpt.dCalendar;

ALTER TABLE rpt.dCalendar
	 ALTER COLUMN DateKey INTEGER NOT NULL

ALTER TABLE rpt.dCalendar
	ADD CONSTRAINT pk_dCalendar PRIMARY KEY CLUSTERED (DateKey)