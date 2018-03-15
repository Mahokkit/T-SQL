USE UKAccidents;
GO

/* 
	Denormalizing RoadSafetyData_Vehicles_2016
	with Lookup Table
*/

SELECT * FROM dbo.stgVehFile; -- 252,500 rows

SELECT 
	v.Accident_Index AS 'Accident_Index', 
	v.Vehicle_Reference AS 'Vehicle_Reference',
	vt.label AS 'Vehicle_Type',
	taa.label AS 'Towing_and_Articulation',
	vmt.label AS 'Vehicle_Manoeuvre',
	vlt.label AS 'Vehicle_Location-Restricted_Lane',
	jlt.label AS 'Junction_Location',
	sodt.label AS 'Skidding_and_Overturning',
	hoict.label AS 'Hit_Object_in_Carriageway',
	vlct.label AS 'Vehicle_Leaving_Carriageway',
	hooct.label AS 'Hit_Object_off_Carriageway',
	opoit.label AS '1st_Point_of_Impact',
	wvlhdt.label AS 'Was_Vehicle_Left_Hand_Drive?',
	jpt.label AS 'Journey_Purpose_of_Driver',
	sodt.label AS 'Sex_of_Driver',
	v.Age_of_Driver AS 'Age_of_Driver',
	v.[Engine_Capacity_(CC)] AS 'Engine_Capacity_(CC)',
	vpct.label AS 'Propulsion_Code',
	v.Age_of_Vehicle AS 'Age_of_Vehicle',
	dimdd.label AS 'Driver_IMD_Decile',
	hatt.label AS 'Driver_Home_Area_Type',
	vimdd.label AS 'Vehicle_IMD_Decile'
INTO dbo.[Vehicles_2016]
FROM dbo.stgVehFile v
LEFT JOIN dbo.stgVehicleTypeTab vt ON vt.code = v.Vehicle_Type
LEFT JOIN dbo.stgTowingAndArticulationTab taa ON taa.code = v.Towing_and_Articulation
LEFT JOIN dbo.stgVehicleManoeuvreTab vmt ON vmt.code = v.Vehicle_Manoeuvre
LEFT JOIN dbo.stgVehLocationTab vlt ON vlt.code = v.[Vehicle_Location-Restricted_Lane]
LEFT JOIN dbo.stgJunctionLocationTab jlt on jlt.code = v.Junction_Location
LEFT JOIN dbo.stgSkiddingAndOverturningTab saot ON saot.code = v.Skidding_and_Overturning
LEFT JOIN dbo.stgHitObjectInCarriagewayTab hoict ON hoict.code = v.Hit_Object_in_Carriageway
LEFT JOIN dbo.stgVehLeavingCarriagewayTab vlct ON vlct.code = v.Vehicle_Leaving_Carriageway
LEFT JOIN dbo.stgHitObjectOffCarriagewayTab hooct ON hooct.code = v.Hit_Object_off_Carriageway
LEFT JOIN dbo.stg1stPointOfImpactTab opoit ON opoit.code = v.[1st_Point_of_Impact]
LEFT JOIN dbo.stgWasVehicleLeftHandDriveTab wvlhdt ON wvlhdt.code = v.[Was_Vehicle_Left_Hand_Drive?]
LEFT JOIN dbo.stgJourneyPurposeTab jpt ON jpt.code = v.Journey_Purpose_of_Driver
LEFT JOIN dbo.stgSexOfDriverTab sodt ON sodt.code = v.Sex_of_Driver
LEFT JOIN dbo.stgAgeBandTab abt ON abt.code = v.Age_Band_of_Driver
LEFT JOIN dbo.stgVehiclePropulsionCodeTab vpct ON vpct.code = v.Propulsion_Code
LEFT JOIN dbo.stgIMDDecileTab dimdd ON dimdd.code = v.Driver_IMD_Decile
LEFT JOIN dbo.stgHomeAreaTypeTab hatt ON hatt.code = v.Driver_Home_Area_Type
LEFT JOIN dbo.stgIMDDecileTab vimdd ON vimdd.code = v.Vehicle_IMD_Decile

SELECT * FROM dbo.Vehicles_2016; --252,500 rows