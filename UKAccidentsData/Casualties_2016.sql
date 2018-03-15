USE UKAccidents;
GO

SELECT * FROM dbo.stgCasFile; --181,384

SELECT DISTINCT(c.Bus_or_Coach_Passenger) FROM dbo.stgCasFile c;

SELECT * FROM dbo.stgBusPassengerTab;

SELECT 
	c.Accident_Index,
	c.Vehicle_Reference,
	c.Casualty_Reference,
	cc.label AS 'Casualty_Class',
	c.Sex_of_Casualty,
	c.Age_of_Casualty,
	ab.label AS 'Age_Band_of_Casualty',
	cs.label AS 'Casualty_Severity',
	pl.label AS 'Pedestrian_Location',
	pm.label AS 'Pedestrian_Movement',
	cp.label AS 'Car_Passenger',
	bp.label AS 'Bus_or_Coach_Passenger',
	prmw.label AS 'Pedestrian_Road_Maintenance_Worker',
	ct.label AS 'Casualty_Type',
	hat.label AS 'Casualty_Home_Area_Type',
	cimdd.label AS 'Casualty_IMD_Decile'
INTO dbo.Casualties_2016
FROM dbo.stgCasFile c
LEFT JOIN dbo.stgCasualtyClassTab cc ON cc.code = c.Casualty_Class
LEFT JOIN dbo.stgAgeBandTab ab ON ab.code = c.Age_Band_of_Casualty
LEFT JOIN dbo.stgCasualtySeverityTab cs ON cs.code = c.Casualty_Severity
LEFT JOIN dbo.stgPedLocationTab pl ON pl.code = c.Pedestrian_Location
LEFT JOIN dbo.stgPedMovementTab pm ON pm.code = c.Pedestrian_Movement
LEFT JOIN dbo.stgCarPassengerTab cp ON cp.code = c.Car_Passenger
LEFT JOIN dbo.stgBusPassengerTab bp ON bp.code = c.Bus_or_Coach_Passenger
LEFT JOIN dbo.stgPedRoadMaintenanceWorkerTab prmw ON prmw.code = c.Pedestrian_Road_Maintenance_Worker
LEFT JOIN dbo.stgCasualtyTypeTab ct ON ct.code = c.Casualty_Type
LEFT JOIN dbo.stgHomeAreaTypeTab hat ON hat.code = c.Casualty_Home_Area_Type
LEFT JOIN dbo.stgIMDDecileTab cimdd ON cimdd.code = c.Casualty_IMD_Decile

SELECT * FROM dbo.Casualties_2016; --181,384 rows