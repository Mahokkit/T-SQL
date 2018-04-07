USE UKAccidents
GO

-- creating AccidentSeverity Dim Table
SELECT * INTO rpt.AccidentSeverity FROM stg.['Accident Severity$']

SELECT * FROM rpt.AccidentSeverity;

ALTER TABLE rpt.AccidentSeverity
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.AccidentSeverity
	ADD CONSTRAINT pk_AccidentSeverity PRIMARY KEY CLUSTERED (Code)
	
-- creating UrbanRural Dim Table
SELECT * INTO rpt.UrbanRural FROM stg.['Urban Rural$']

SELECT * FROM rpt.UrbanRural

ALTER TABLE rpt.UrbanRural
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.UrbanRural
	ADD CONSTRAINT pk_UrbanRural PRIMARY KEY CLUSTERED (Code)


-- creating RoadType Dim Table
SELECT * INTO rpt.RoadType FROM stg.['Road Type$']

SELECT * FROM rpt.RoadType

ALTER TABLE rpt.RoadType
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.RoadType
	ADD CONSTRAINT pk_RoadType PRIMARY KEY CLUSTERED (Code)


-- creating PoliceOfficerAttend Dim Table
SELECT * INTO rpt.PoliceOfficerAttend FROM stg.['Police Officer Attend$']

SELECT * FROM rpt.PoliceOfficerAttend

ALTER TABLE rpt.PoliceOfficerAttend
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.PoliceOfficerAttend
	ADD CONSTRAINT pk_PoliceOfficerAttend PRIMARY KEY CLUSTERED (Code)


-- creating RoadSurface Dim Table
SELECT * INTO rpt.RoadSurface FROM stg.['Road Surface$']

SELECT * FROM rpt.RoadSurface

ALTER TABLE rpt.RoadSurface
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.RoadSurface
	ADD CONSTRAINT pk_RoadSurface PRIMARY KEY CLUSTERED (Code)
	

-- creating LightConditions Dim Table
SELECT * FROM stg.['Light Conditions$']
SELECT * INTO rpt.LightConditions FROM stg.['Light Conditions$']

SELECT * FROM rpt.LightConditions

ALTER TABLE rpt.LightConditions
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.LightConditions
	ADD CONSTRAINT pk_LightConditions PRIMARY KEY CLUSTERED (Code)

-- creating Weather Dim Table
SELECT * FROM stg.Weather$
SELECT * INTO rpt.Weather FROM stg.Weather$

SELECT * FROM rpt.Weather

ALTER TABLE rpt.Weather
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.Weather
	ADD CONSTRAINT pk_Weather PRIMARY KEY CLUSTERED (Code)