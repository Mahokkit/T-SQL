SELECT
	*
FROM rpt.fAccidents f

SELECT
	s.label AS 'Severity',
	--v.label AS 'Mode', --roll up
	COALESCE(CAST(cm.CasMode AS NVARCHAR(50)), 'Unknown') AS 'Mode',
	--c.VehicleType,
	cc.label AS 'CasualtyClass', 
	--rs.Label AS 'RoadSurface',
	COALESCE(CAST(rs2.CasRoadSurface AS NVARCHAR(50)),'Unknown') AS 'RoadSurface',
	--rs.label AS 'RoadSurface', -- need transoformation
	--a.Speed_limit,
	COALESCE(CAST(sl.SpeedLimit AS NVARCHAR(50)), 'Unknown') AS 'SpeedLimit',
	--lc.label AS 'LightConditions', -- roll up?
	COALESCE(CAST(lc2.casLight AS NVARCHAR(50)),'Unknown') AS 'LightConditions',
	cg.CasGender AS 'CasualtyGender',
	--lad.label AS 'LocAuthDistrict', -- roll up with Terry's table
	--lar.region_history AS 'Region',
	COALESCE(CAST(lar.region_history AS NVARCHAR(50)),'Unknown') AS 'Region',
	--a.AccDate,
	COALESCE(CAST(a.AccDate AS NVARCHAR(50)),'Unknown') AS 'AccDate',
	--DATEPART(yy,a.AccDate) AS 'AccYear',
	COALESCE(CAST(DATEPART(yy,a.AccDate) AS NVARCHAR(50)),'Unknown') AS 'AccYear',
	--DATEPART(mm,a.AccDate) AS 'AccMonth',
	COALESCE(CAST(DATEPART(mm,a.AccDate) AS NVARCHAR(50)),'Unknown') AS 'AccMonthNum',
	--DATENAME(mm,a.AccDate) AS 'AccMonth',
	COALESCE(CAST(DATENAME(mm,a.AccDate) AS NVARCHAR(50)),'Unknown') AS 'AccMonth',
	--DATENAME(dw,a.AccDate) AS 'DayofWeek',
	COALESCE(CAST(DATENAME(dw,a.AccDate) AS NVARCHAR(50)),'Unknown') AS 'DayofWeek',
	--DATEPART(dw,a.AccDate) AS 'DayOfWeekNum',
	COALESCE(CAST(DATEPART(dw,a.AccDate) AS NVARCHAR(50)),'Unknown') AS 'DayOfWeekNum',
	COALESCE(CAST(ur.label AS NVARCHAR(50)),'Unknown') AS 'RoadType',
	ab.AgeBand AS 'AgeBand' -- roll up with Pat's Table
FROM rpt.fCasualty c
	LEFT JOIN rpt.fAccidents a ON c.AccidentIndex = a.Accident_Index
	LEFT JOIN rpt.CasualtySeverity s ON c.CasualtySeverity = s.code
	LEFT JOIN rpt.CasualtyType v ON c.VehicleType = v.code
	LEFT JOIN rpt.CasualtyClass cc ON c.CasualtyClass = cc.code
	LEFT JOIN rpt.RoadSurface rs ON a.Road_Surface_Conditions = rs.code
	LEFT JOIN rpt.LightConditions lc ON a.Light_Conditions = lc.code
	LEFT JOIN rpt.SexOfCasualty sc ON c.SexOfCasualty = sc.code
	LEFT JOIN rpt.LocalAuthorityDistrict lad ON a.LocAuthDistrict = lad.code
	LEFT JOIN lup.CasAgeBands ab ON c.AgeOfCasualty = ab.Age
	LEFT JOIN rpt.UrbanRural ur ON a.Urban_or_Rural_Area = ur.code
	--LEFT JOIN lup.CasAgeBands cab ON c.AgeBandOfCasualty = cab.Age
	LEFT JOIN lup.CasualtyMode_VehicleType cm ON v.label = cm.mode16
	LEFT JOIN lup.LocalAuthRegion lar ON lad.label = lar.localauthdist
	LEFT JOIN lup.SpeedLimit sl ON a.Speed_limit = sl.Speed_Limit
	LEFT JOIN lup.lightConditions lc2 ON lc.label = lc2.label
	LEFT JOIN lup.roadsurface rs2 ON rs.label = rs2.roadsurface2016
	LEFT JOIN lup.CasualtyGender cg ON sc.label = cg.gender16
	-- 181384
--SELECT * FROM rpt.CasualtyType v
--SELECT * FROM lup.CasualtyMode_VehicleType

--SELECT * FROM rpt.LocalAuthorityDistrict lad INNER JOIN lup.LocalAuthRegion lar ON lad.label = lar.localauthdist
----SELECT DISTINCT(LightConditions) FROM rpt.fHistory
----SELECT * FROM rpt.LightConditions
----SELECT DISTINCT(Light_Conditions)FROM rpt.fAccidents
--SELECT * FROM rpt.RoadSurface r INNER JOIN lup.roadsurface rs ON r.label = rs.roadsurface2016
--SELECT f.Speed_limit,s.SpeedLimit FROM rpt.fAccidents f INNER JOIN lup.SpeedLimit s ON f.Speed_limit = s.Speed_Limit
--SELECT * FROM rpt.LightConditions l INNER JOIN lup.lightConditions c ON l.label = c.label

--SELECT * FROM rpt.fCasualty

SELECT
	CAST(f.Severity AS NVARCHAR(255)) AS 'Severity',
	CAST(f.Mode AS NVARCHAR(50)) AS 'Mode',
	CAST(f.CasualtyClass AS NVARCHAR(255)) AS 'CasualtyClass',
	COALESCE(CAST(rs.CasRoadSurface AS NVARCHAR(50)),'Unknown') AS 'RoadSurface',
	CAST(f.SpeedLimit AS NVARCHAR(50)) AS 'SpeedLimit',
	CAST(f.LightConditions AS NVARCHAR(50)) AS 'LightConditions',
	CAST(f.CasualtyGender AS NVARCHAR(255)) AS 'CasualtyGender',
	CAST(f.Region AS NVARCHAR(50)) AS 'Region',
	CAST(f.AccDate AS NVARCHAR(50)) AS 'AccDate',
	CAST(f.AccYear AS NVARCHAR(50)) AS 'AccYear',
	CAST(f.AccMonth AS NVARCHAR(50)) AS 'AccMonthNum',
	CAST(f.AccMonthNum AS NVARCHAR(50)) AS 'AccMonth',
	CAST(f.DayOfWeek AS NVARCHAR(50)) As 'DayOfWeek',
	CAST(f.DayOfWeekNum AS NVARCHAR(50)) AS 'DayOfWeekNum',
	CAST(f.RoadType AS NVARCHAR(50)) AS 'RoadType',
	CAST(cab.AgeBand AS NVARCHAR(255)) AS 'AgeBand'
FROM rpt.fHistory f
INNER JOIN lup.CasAgeBands cab ON f.Age = cab.Age
LEFT JOIN lup.roadsurface rs ON f.RoadSurface = rs.history
-- 964009 no join , 962506 with inner join

SELECT DISTINCT(RoadSurface) FROM rpt.fHistory

SELECT DISTINCT(LightConditions) FROM rpt.fHistory
SELECT * FROM rpt.LightConditions
SELECT * FROM rpt.CasualtyClass
SELECT DISTINCT(CasualtyAgeBand) FROM rpt.fHistory

SELECT * FROM rpt.fCasualty -- 181384
SELECT * FROM rpt.fHistory -- 964009
SELECT DISTINCT(Age) FROM rpt.fHistory ORDER BY age ASC

SELECT 
	DATEPART(yy,a.AccDate) AS 'AccYear',
	DATEPART(mm,a.AccDate) AS 'AccMonth',
	DATENAME(mm,a.AccDate) AS 'AccMonthNum',
	DATENAME(dw,a.AccDate) AS 'DayofWeek',
	DATEPART(dw,a.AccDate) AS 'DayOfWeekNum'
FROM rpt.fAccidents a

SELECT * FROM rpt.AccidentReport