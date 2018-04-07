USE UKAccidents;
GO

-- preparation
SELECT * FROM stg.CasFile c --181,384

SELECT * FROM stg.MakeModel2016File WHERE Accident_Index = '201601MM70538';

SELECT * FROM stg.VehFile WHERE Accident_Index = '201601MM70538';

SELECT * FROM stg.RoadSafetyAccidents2016File WHERE Accident_Index = '201601MM70538';

SELECT [Time], datepart(HH, [Time]) AS 'Hour'  FROM stg.RoadSafetyAccidents2016File;

SELECT DISTINCT [Date], cast(convert(char(8), [Date], 112) as int) FROM stg.RoadSafetyAccidents2016File;

SELECT * FROM stg.DimDate

-- fact table 181,384 rows
SELECT 
	c.Accident_Index AS 'AccidentIndex',
	c.Vehicle_Reference AS 'VehicleReference',
	c.Casualty_Reference AS 'CasualtyReference',
	c.Casualty_Class AS 'CasualtyClass',
	c.Sex_of_Casualty AS 'SexOfCasualty',
	c.Age_of_Casualty AS 'AgeOfCasualty',
	c.Age_Band_of_Casualty AS 'AgeBandOfCasualty',
	c.Casualty_Severity AS 'CasualtySeverity',
	c.Pedestrian_Location AS 'PedestrianLocation',
	c.Pedestrian_Movement AS 'PedestrianMovement',
	c.Car_Passenger AS 'CarPassenger',
	c.Bus_or_Coach_Passenger AS 'BusOrCoachPassenger',
	c.Pedestrian_Road_Maintenance_Worker AS 'PedestrianRoadMaintenanceWorker',
	c.Casualty_Type AS 'CasualtyType',
	c.Casualty_Home_Area_Type AS 'CasualtyHomeAreaType',
	c.Casualty_IMD_Decile AS 'CasualtyIMDDecile',
	r.[Date] As 'CasualtyDate',
	cast(convert(char(8), r.[Date], 112) as int) AS 'date_fk',
	datepart(HH, r.[Time]) AS 'CasualtyHour',
	r.[Local_Authority_(District)] AS 'CasualtyAuthorityDistrict',
	r.[Local_Authority_(Highway)] AS 'CasualtyAuthorityHighway',
	r.Police_Force AS 'CasualtyPoliceForce',
	m.make AS 'Make',
	m.model AS 'Model',
	m.Vehicle_Type AS 'VehicleType',
	m.Age_Band_of_Driver AS 'AgeBandOfDriver',
	r.Longitude AS 'CasualtyLongitude',
	r.Latitude AS 'CasualtyLatitude',
	1 AS 'CasualtyCount'
--INTO rpt.fCasualty
FROM stg.CasFile c
INNER JOIN stg.RoadSafetyAccidents2016File r ON r.Accident_Index = c.Accident_Index
INNER JOIN stg.MakeModel2016File m ON m.Accident_Index = c.Accident_Index AND m.Vehicle_Reference = c.Vehicle_Reference;

SELECT * FROM rpt.fCasualty;