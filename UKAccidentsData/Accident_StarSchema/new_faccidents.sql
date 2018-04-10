USE UKAccidents

DROP TABLE stg.RSA2016

SELECT  
	r.Number_of_Casualties AS 'CasCount',
	cast(convert(char(8), r.[Date], 112) as int) AS 'date_fk'
FROM stg.RoadSafetyAccidents2016File r

SELECT
	d.[MonthName],
	SUM(s.CasCount)
FROM
	(
	SELECT  
		CAST(CONVERT(nvarchar(50), r.Number_of_Casualties) AS INT) AS 'CasCount',
		[Date],
		cast(RIGHT(r.[Date],4) + '' + SUBSTRING(r.[Date],4,2) + '' + LEFT(r.[Date],2) AS INT) AS date_fk
	FROM stg.RSA2016 r
	) s
INNER JOIN rpt.dCalendar d ON s.date_fk = d.DateKey
GROUP BY d.[MonthName]


SELECT 	convert(date,[Date],103) AS 'AccDate' FROM stg.RSA2016


SELECT
	Accident_Index, 
	Longitude, 
	Latitude, 
	Police_Force,
	Accident_Severity, 
	Number_of_Vehicles,
	Number_of_Casualties,
	[Date] AS 'AccDate_st',
	convert(date,[Date],103) AS 'AccDate',
	cast(RIGHT([Date],4) + '' + SUBSTRING([Date],4,2) + '' + LEFT([Date],2) AS INT) AS date_fk,
	Day_of_Week,
	[Time] AS 'AccTime',
	datepart(HH, [Time]) AS 'AccHour',
	[Local_Authority_(District)] AS 'LocAuthDistrict', 
	[Local_Authority_(Highway)] AS 'LocAuthHighway',
	[1st_Road_Class] AS 'first_Road_Class', 
	[1st_Road_Number] AS 'first_Road_Number',
	Road_Type,
	Speed_limit, 
	Junction_Detail, 
	Junction_Control,
	[2nd_Road_Class] AS 'second_Road_Class', 
	[2nd_Road_Number] AS 'second_Road_Number',
	[Pedestrian_Crossing-Human_Control] AS 'PedestrianCrossingHumanControl', 
	[Pedestrian_Crossing-Physical_Facilities] AS 'PedestrianCrossingPhysicalFacilities',
	Light_Conditions,
	Weather_Conditions,
	Road_Surface_Conditions,
	Special_Conditions_at_Site,
	Carriageway_Hazards,
	Urban_or_Rural_Area,
	Did_Police_Officer_Attend_Scene_of_Accident,
	LSOA_of_Accident_Location,
	1 AS 'AccCount'
FROM stg.RSA2016file 

CREATE TABLE [rpt].[fAccidents2] (
    [Accident_Index] nvarchar(50),
    [Longitude] float,
    [Latitude] float,
    [Police_Force] bigint,
    [Accident_Severity] bigint,
    [Number_of_Vehicles] bigint,
    [Number_of_Casualties] bigint,
    [AccDate_st] nvarchar(50),
    [AccDate] date,
    [date_fk] int,
    [Day_of_Week] bigint,
    [AccTime] datetime,
    [AccHour] int,
    [LocAuthDistrict] bigint,
    [LocAuthHighway] nvarchar(50),
    [first_Road_Class] bigint,
    [first_Road_Number] bigint,
    [Road_Type] bigint,
    [Speed_limit] bigint,
    [Junction_Detail] bigint,
    [Junction_Control] bigint,
    [second_Road_Class] bigint,
    [second_Road_Number] bigint,
    [PedestrianCrossingHumanControl] bigint,
    [PedestrianCrossingPhysicalFacilities] bigint,
    [Light_Conditions] bigint,
    [Weather_Conditions] bigint,
    [Road_Surface_Conditions] bigint,
    [Special_Conditions_at_Site] bigint,
    [Carriageway_Hazards] bigint,
    [Urban_or_Rural_Area] bigint,
    [Did_Police_Officer_Attend_Scene_of_Accident] bigint,
    [LSOA_of_Accident_Location] nvarchar(50),
    [AccCount] int
)

SELECT
	d.[MonthName],
	SUM(f.Number_of_Casualties) AS 'CasCount'
FROM rpt.fAccidents2 f
INNER JOIN rpt.dCalendar d ON f.date_fk = d.DateKey
GROUP BY d.[MonthName]