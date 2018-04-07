USE UKAccidents
GO

SELECT
	d.MonthName,
	SUM(f.CasualtyCount) AS 'CasCount'
FROM rpt.fCasualty2 f
INNER JOIN rpt.dCalendar d ON f.date_fk = d.DateKey
GROUP BY d.MonthName

SELECT 
	r.Accident_Index,
	r.Longitude,
	r.Latitude,
	r.Police_Force,
	r.Accident_Severity,
	r.Number_of_Vehicles,
	r.Number_of_Casualties,
	convert(char(8), r.[Date], 112) AS 'AccDate_st',
	r.[Date] AS 'AccDate',
	cast(convert(char(8), r.[Date], 112) as int) AS 'date_fk',
	r.Day_of_Week,
	r.[Time] AS 'AccTime',
	datepart(HH, r.[Time]) AS 'AccHour',
	r.[Local_Authority_(District)] AS 'LocAuthDistrict',
	r.[Local_Authority_(Highway)] AS 'LocAuthHighway',
	r.[1st_Road_Class] AS 'first_Road_Class',
	r.[1st_Road_Number] AS 'first_Road_Number',
	r.Road_Type,
	r.Speed_limit,
	r.Junction_Detail,
	r.Junction_Control,
	r.[2nd_Road_Class] AS 'second_Road_Class',
	r.[2nd_Road_Number] AS 'second_Road_Number',
	r.[Pedestrian_Crossing-Human_Control],
	r.[Pedestrian_Crossing-Physical_Facilities],
	r.Light_Conditions,
	r.Weather_Conditions,
	r.Road_Surface_Conditions,
	r.Special_Conditions_at_Site,
	r.Carriageway_Hazards,
	r.Urban_or_Rural_Area,
	r.Did_Police_Officer_Attend_Scene_of_Accident,
	r.LSOA_of_Accident_Location,
	1 AS 'AccCount'
FROM stg.RoadSafetyAccidents2016File r

DROP TABLE rpt.fAccidents;

CREATE TABLE [rpt].[fAccidents] 
(
    [Accident_Index] nvarchar(50),
    [Longitude] float,
    [Latitude] float,
    [Police_Force] bigint,
    [Accident_Severity] bigint,
    [Number_of_Vehicles] bigint,
    [Number_of_Casualties] bigint,
    [AccDate_st] varchar(8),
    [AccDate] datetime,
    [date_fk] int,
    [AccTime] datetime,
    [AccHour] int,
    [Day_of_Week] bigint,
    [Time] datetime,
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
    [Pedestrian_Crossing-Human_Control] bigint,
    [Pedestrian_Crossing-Physical_Facilities] bigint,
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
	SUM(f.AccCount) AS 'AccCount', 
	SUM(f.Number_of_Casualties) AS 'CasCount'
FROM rpt.fAccidents f
INNER JOIN rpt.dCalendar d ON d.DateKey = f.date_fk
GROUP BY d.[MonthName];