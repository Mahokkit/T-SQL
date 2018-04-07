USE UKAccidents
GO

ALTER TABLE rpt.fAccidents
	ALTER COLUMN Accident_Severity INTEGER NULL

ALTER TABLE rpt.fAccidents
	ADD CONSTRAINT FK_AccidentSeverity 
	FOREIGN KEY (Accident_Severity) 
	REFERENCES rpt.AccidentSeverity(code);

ALTER TABLE rpt.fAccidents
	ALTER COLUMN Urban_or_Rural_Area INTEGER NULL

ALTER TABLE rpt.fAccidents
	ADD CONSTRAINT FK_UrbanRural 
	FOREIGN KEY (Urban_or_Rural_Area) 
	REFERENCES rpt.UrbanRural(code);

ALTER TABLE rpt.fAccidents
	ALTER COLUMN Road_Type INTEGER NULL

ALTER TABLE rpt.fAccidents
	ADD CONSTRAINT FK_RoadType 
	FOREIGN KEY (Road_Type) 
	REFERENCES rpt.RoadType(code);

ALTER TABLE rpt.fAccidents
	ALTER COLUMN Did_Police_Officer_Attend_Scene_of_Accident INTEGER NULL

ALTER TABLE rpt.fAccidents
	ADD CONSTRAINT FK_PoliceOfficerAttend 
	FOREIGN KEY (Did_Police_Officer_Attend_Scene_of_Accident) 
	REFERENCES rpt.PoliceOfficerAttend(code);

ALTER TABLE rpt.fAccidents
	ALTER COLUMN LocAuthDistrict INTEGER NULL;

ALTER TABLE rpt.fAccidents
	ADD CONSTRAINT FK_LocalAuthorityDistrict 
	FOREIGN KEY (LocAuthDistrict) 
	REFERENCES rpt.LocalAuthorityDistrict(code);

ALTER TABLE rpt.fAccidents
	ALTER COLUMN Road_Surface_Conditions INTEGER NULL;

ALTER TABLE rpt.fAccidents
	ADD CONSTRAINT FK_RoadSurface 
	FOREIGN KEY (Road_Surface_Conditions) 
	REFERENCES rpt.RoadSurface(code);

ALTER TABLE rpt.fAccidents
	ALTER COLUMN Light_Conditions INTEGER NULL;

ALTER TABLE rpt.fAccidents
	ADD CONSTRAINT FK_LightConditions 
	FOREIGN KEY (Light_Conditions) 
	REFERENCES rpt.LightConditions(code);

ALTER TABLE rpt.fAccidents
	ALTER COLUMN Police_Force INTEGER NULL;

ALTER TABLE rpt.fAccidents
	ADD CONSTRAINT FK_PoliceForce 
	FOREIGN KEY (Police_Force) 
	REFERENCES rpt.PoliceForce(code);

ALTER TABLE rpt.fAccidents
	ALTER COLUMN LocAuthHighway NVARCHAR(255) NULL;

ALTER TABLE rpt.fAccidents
	ADD CONSTRAINT FK_LocalAuthorityHighway
	FOREIGN KEY (LocAuthHighway) 
	REFERENCES rpt.LocalAuthorityHighway(code);

ALTER TABLE rpt.fAccidents
	ALTER COLUMN Weather_Conditions INTEGER NULL;

ALTER TABLE rpt.fAccidents
	ADD CONSTRAINT FK_Weather
	FOREIGN KEY (Weather_Conditions) 
	REFERENCES rpt.Weather(code);

ALTER TABLE rpt.fAccidents
	ADD CONSTRAINT FK_dCalendarAccident
	FOREIGN KEY (date_fk) 
	REFERENCES rpt.dCalendar(DateKey);