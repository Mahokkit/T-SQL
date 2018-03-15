USE UKAccidents;
GO

SELECT * FROM dbo.stgMakeModel2016File; --252,500

SELECT DISTINCT([Vehicle_Location-Restricted_Lane]) FROM dbo.stgMakeModel2016File;

SELECT * FROM dbo.stgVehLocationTab

SELECT 
	m.Accident_Index,
	m.accyr AS 'Accident_Year',
	m.Vehicle_Reference,
	vt.label AS 'Vehicle_Type',
	taa.label AS 'Towing_and_Articulation',
	vl.label AS 'Vehicle_Location-Restricted_Lane',
	jl.label AS 'Junction_Location',
	sao.label AS 'Skidding_and_Overturning',
	hoicw.label AS 'Hit_Object_in_Carriageway',
	vlcw.label AS 'Vehicle_Leaving_Carriageway',
	hoocw.label AS 'Hit_Object_off_Carriageway',
	opoi.label AS '1st_Point_of_Impact',
	wvlhd.label AS 'Was_Vehicle_Left_Hand_Drive',
	jp.label AS 'Journey_Purpose_of_Driver',
	sod.label AS 'Sex_of_Driver',
	ab.label AS 'Age_Band_of_Driver',
	m.[Engine_Capacity_(CC)],
	vpc.label AS 'Propulsion_Code',
	dimdd.label AS 'Driver_IMD_Decile',
	hat.label AS 'Driver_Home_Area_Type',
	m.make,
	m.model
INTO dbo.MakeModel2016
FROM dbo.stgMakeModel2016File m
LEFT JOIN dbo.stgVehicleTypeTab vt ON vt.code = m.Vehicle_Type
LEFT JOIN dbo.stgTowingAndArticulationTab taa ON taa.code = m.Towing_and_Articulation
LEFT JOIN dbo.stgVehLocationTab vl ON vl.code = m.[Vehicle_Location-Restricted_Lane]
LEFT JOIN dbo.stgJunctionLocationTab jl ON jl.code = m.Junction_Location
LEFT JOIN dbo.stgSkiddingAndOverturningTab sao ON sao.code = m.Skidding_and_Overturning
LEFT JOIN dbo.stgHitObjectInCarriagewayTab hoicw ON hoicw.code = m.Hit_Object_in_Carriageway
LEFT JOIN dbo.stgVehLeavingCarriagewayTab vlcw ON vlcw.code = m.Vehicle_Leaving_Carriageway
LEFT JOIN dbo.stgHitObjectOffCarriagewayTab hoocw ON hoocw.code = m.Hit_Object_off_Carriageway
LEFT JOIN dbo.stg1stPointOfImpactTab opoi ON opoi.code = m.[1st_Point_of_Impact]
LEFT JOIN dbo.stgWasVehicleLeftHandDriveTab wvlhd ON wvlhd.code = m.Was_Vehicle_Left_Hand_Drive
LEFT JOIN dbo.stgJourneyPurposeTab jp ON jp.code = m.Journey_Purpose_of_Driver
LEFT JOIN dbo.stgSexOfDriverTab sod ON sod.code = m.Sex_of_Driver
LEFT JOIN dbo.stgAgeBandTab ab ON ab.code = m.Age_Band_of_Driver
LEFT JOIN dbo.stgVehiclePropulsionCodeTab vpc ON vpc.code = m.Propulsion_Code
LEFT JOIN dbo.stgIMDDecileTab dimdd ON dimdd.code = m.Driver_IMD_Decile
LEFT JOIN dbo.stgHomeAreaTypeTab hat ON hat.code = m.Driver_Home_Area_Type

SELECT * FROM dbo.MakeModel2016; --252,500