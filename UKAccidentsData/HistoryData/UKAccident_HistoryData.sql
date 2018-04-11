DROP TABLE stg.HistoryData;


SELECT * FROM stg.HistoryData


SELECT  
	h.Severity,
	h.KSI,
	h.Mode,
	h.[All],
	h.[Casualty Class] AS 'CasualtyClass',
	h.[Road Surface] AS 'RoadSurface',
	h.[Speed limit] AS 'SpeedLimit',
	h.[Light conditions] AS 'LightConditions',
	h.[Casualty Gender] AS 'CasualtyGender',
	CASE WHEN h.Region = 'Eastern' THEN 'East of England'
		ELSE h.Region END AS 'Region',
	CAST([ConDate] AS DATE) AS 'AccDate',
	YEAR(h.ConDate) AS 'AccYear',
	MONTH(h.ConDate) AS 'AccMonth',
	DATENAME(m, h.ConDate) AS 'AccMonthNum',
	DATENAME(dw, h.ConDate) AS 'DayOfWeek',
	DATEPART(dw, h.ConDate) AS 'DayOfWeekNum',
	CASE WHEN [Casualty Age (Banded)] = 'Unknown'
		THEN 'UNK'
		ELSE [Casualty Age (Banded)] 
		END AS 'CasualtyAgeBand',
	h.[Road Type] AS 'RoadType',
	CAST([accid] AS INT) AS 'accid',
	CAST ((CASE WHEN h.[Age] = 'Unknown' THEN -1
	ELSE h.[Age] END) AS INT) AS 'Age'
FROM stg.HistoryData h

CREATE TABLE [rpt].[fHistory] 
(
    [Severity] varchar(50),
    [KSI] varchar(50),
    [Mode] varchar(50),
    [All] varchar(50),
    [CasualtyClass] varchar(50),
    [RoadSurface] varchar(50),
    [SpeedLimit] varchar(50),
    [LightConditions] varchar(50),
    [CasualtyGender] varchar(50),
    [Region] varchar(50),
    [AccDate] date,
    [AccYear] int,
    [AccMonth] int,
    [AccMonthNum] nvarchar(30),
    [DayOfWeek] nvarchar(30),
    [DayOfWeekNum] int,
    [CasualtyAgeBand] varchar(50),
    [RoadType] varchar(50),
    [accid] int,
    [Age] int
)

SELECT * FROM stg.HistoryData

SELECT DISTINCT(Region) FROM rpt.fHistory

SELECT * INTO rpt.localauthregion FROM stg.localauthregion$

SELECT * FROM rpt.localauthregion
