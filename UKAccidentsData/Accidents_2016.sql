USE UKAccidents;
GO

SELECT * FROM dbo.stgRoadSafetyAccidents2016File; --136,621

SELECT 
	a.Accident_Index,
	a.Location_Easting_OSGR,
	a.Location_Northing_OSGR,
	a.Longitude,
	a.Latitude,
	pf.label AS 'Police_Force',
	ast.label AS 'Accident_Severity',
	a.Number_of_Vehicles,
	a.Number_of_Casualties,
	a.[Date],
	a.Day_of_Week,
	a.[Time],
	lad.label AS 'Local_Authority_(District)',
	lah.label AS 'Local_Authority_(Highway)',
	orct.label AS '1st_Road_Class',
	a.[1st_Road_Number],
	rt.label AS 'Road_Type',
	a.Speed_limit,
	jd.label AS 'Junction_Detail',
	jc.label AS 'Junction_Control',
	trc.label AS '2nd_Road_Class',
	a.[2nd_Road_Number],
	pch.label AS 'Pedestrian_Crossing-Human_Control',
	pcp.label AS 'Pedestrian_Crossing-Physical_Facilities',
	lct.label AS 'Light_Conditions',
	w.label AS 'Weather_Conditions',
	rs.label AS 'Road_Surface_Conditions',
	scas.label AS 'Special_Conditions_at_Site',
	ch.label AS 'Carriageway_Hazards',
	ur.label AS 'Urban_or_Rural_Area',
	poa.label AS 'Did_Police_Officer_Attend_Scene_of_Accident',
	a.LSOA_of_Accident_Location
INTO dbo.Accidents2016
FROM dbo.stgRoadSafetyAccidents2016File a
LEFT JOIN dbo.stgPoliceForceTab pf ON pf.code = a.Police_Force
LEFT JOIN dbo.stgAccidentSeverityTab ast ON ast.code = a.Accident_Severity
LEFT JOIN dbo.stgLocalAuthority_DistrictTab lad ON lad.code = a.[Local_Authority_(District)]
LEFT JOIN dbo.stgLocalAuthority_HighwayTab lah ON lah.Code = a.[Local_Authority_(Highway)]
LEFT JOIN dbo.stg1stRoadClassTab orct ON orct.code = a.[1st_Road_Class]
LEFT JOIN dbo.stgRoadTypeTab rt ON rt.code = a.Road_Type
LEFT JOIN dbo.stgJunctionDetailTab jd ON jd.code = a.Junction_Detail
LEFT JOIN dbo.stgJunctionControlTab jc ON jc.code = a.Junction_Control
LEFT JOIN dbo.stg2ndRoadClassTab trc ON trc.code = a.[2nd_Road_Class]
LEFT JOIN dbo.stgPedCross_HumanTab pch ON pch.code = a.[Pedestrian_Crossing-Human_Control]
LEFT JOIN dbo.stgPedCross_PhysicalTab pcp ON pcp.code = a.[Pedestrian_Crossing-Physical_Facilities]
LEFT JOIN dbo.stgLightConditionsTab lct ON lct.code = a.Light_Conditions
LEFT JOIN dbo.stgWeatherTab w ON w.code = a.Weather_Conditions
LEFT JOIN dbo.stgRoadSurfaceTab rs ON rs.code = a.Road_Surface_Conditions
LEFT JOIN dbo.stgSpecialConditionsAtSiteTab scas ON scas.code = a.Special_Conditions_at_Site
LEFT JOIN dbo.stgCarriagewayHazardsTab ch ON ch.code = a.Carriageway_Hazards
LEFT JOIN dbo.stgUrbanRuralTab ur ON ur.code = a.Urban_or_Rural_Area
LEFT JOIN dbo.stgPoliceOfficerAttendTab poa ON poa.code = a.Did_Police_Officer_Attend_Scene_of_Accident;

SELECT * FROM Accidents2016; --136,621