USE UKAccidents;
GO

-- creating CasualtySeverity Dim Table
SELECT * INTO rpt.CasualtySeverity FROM stg.['Casualty Severity$']

SELECT * FROM rpt.CasualtySeverity;

ALTER TABLE rpt.CasualtySeverity
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.CasualtySeverity
	ADD CONSTRAINT pk_CasualtySeverity PRIMARY KEY CLUSTERED (Code)
	
-- creating PedRoadMaintenanceWork Dim Table
SELECT * INTO rpt.PedRoadMaintenanceWorker FROM stg.['Ped Road Maintenance Worker$']

SELECT * FROM rpt.PedRoadMaintenanceWorker

ALTER TABLE rpt.PedRoadMaintenanceWorker
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.PedRoadMaintenanceWorker
	ADD CONSTRAINT pk_PedRoadMaintenanceWorker PRIMARY KEY CLUSTERED (Code)


-- creating LocalAuthorityDistrict Dim Table
SELECT * INTO rpt.LocalAuthorityDistrict FROM stg.['Local Authority (District)$']

SELECT * FROM rpt.LocalAuthorityDistrict

ALTER TABLE rpt.LocalAuthorityDistrict
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.LocalAuthorityDistrict
	ADD CONSTRAINT pk_LocalAuthorityDistrict PRIMARY KEY CLUSTERED (Code)


-- creating PedMovement Dim Table
SELECT * INTO rpt.PedMovement FROM stg.['Ped Movement$']

SELECT * FROM rpt.PedMovement

ALTER TABLE rpt.PedMovement
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.PedMovement
	ADD CONSTRAINT pk_PedMovement PRIMARY KEY CLUSTERED (Code)


-- creating DriverAgeBand Dim Table
SELECT * INTO rpt.DriverAgeBand FROM stg.['Age Band$']

SELECT * FROM rpt.DriverAgeBand

ALTER TABLE rpt.DriverAgeBand
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.DriverAgeBand
	ADD CONSTRAINT pk_DriverAgeBand PRIMARY KEY CLUSTERED (Code)
	

-- creating CasualtyType Dim Table
SELECT * FROM stg.['Casualty Type$']
SELECT * INTO rpt.CasualtyType FROM stg.['Casualty Type$']

SELECT * FROM rpt.CasualtyType

ALTER TABLE rpt.CasualtyType
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.CasualtyType
	ADD CONSTRAINT pk_CasualtyType PRIMARY KEY CLUSTERED (Code)
		

-- creating IMDDecile Dim Table
SELECT * FROM stg.['IMD Decile$']
SELECT * INTO rpt.IMDDecile FROM stg.['IMD Decile$']

SELECT * FROM rpt.IMDDecile

ALTER TABLE rpt.IMDDecile
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.IMDDecile
	ADD CONSTRAINT pk_IMDDecile PRIMARY KEY CLUSTERED (Code)
		

-- creating VehicleType Dim Table
SELECT * FROM stg.['Vehicle Type$']
SELECT * INTO rpt.VehicleType FROM stg.['Vehicle Type$']

SELECT * FROM rpt.VehicleType

ALTER TABLE rpt.VehicleType
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.VehicleType
	ADD CONSTRAINT pk_VehicleType PRIMARY KEY CLUSTERED (Code)
	

-- creating AgeBand Dim Table
SELECT * FROM stg.['Age Band$']
SELECT * INTO rpt.AgeBand FROM stg.['Age Band$']

SELECT * FROM rpt.AgeBand

ALTER TABLE rpt.AgeBand
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.AgeBand
	ADD CONSTRAINT pk_AgeBand PRIMARY KEY CLUSTERED (Code)
	

-- creating SexOfCasualty Dim Table
SELECT * FROM stg.['Sex of Casualty$']
SELECT * INTO rpt.SexOfCasualty FROM stg.['Sex of Casualty$']

SELECT * FROM rpt.SexOfCasualty

ALTER TABLE rpt.SexOfCasualty
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.SexOfCasualty
	ADD CONSTRAINT pk_SexOfCasualty PRIMARY KEY CLUSTERED (Code)
	

-- creating BusPassenger Dim Table
SELECT * FROM stg.['Bus Passenger$']
SELECT * INTO rpt.BusPassenger FROM stg.['Bus Passenger$']

SELECT * FROM rpt.BusPassenger

ALTER TABLE rpt.BusPassenger
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.BusPassenger
	ADD CONSTRAINT pk_BusPassenger PRIMARY KEY CLUSTERED (Code)
	

-- creating LocalAuthorityHighway Dim Table
SELECT * FROM stg.['Local Authority (Highway)$']
SELECT * INTO rpt.LocalAuthorityHighway FROM stg.['Local Authority (Highway)$']

SELECT * FROM rpt.LocalAuthorityHighway

ALTER TABLE rpt.LocalAuthorityHighway
	 ALTER COLUMN Code NVARCHAR(255) NOT NULL

ALTER TABLE rpt.LocalAuthorityHighway
	ADD CONSTRAINT pk_LocalAuthorityHighway PRIMARY KEY CLUSTERED (Code)


-- creating PoliceForce Dim Table
SELECT * FROM stg.['Police Force$']
SELECT * INTO rpt.PoliceForce FROM stg.['Police Force$']

SELECT * FROM rpt.PoliceForce

ALTER TABLE rpt.PoliceForce
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.PoliceForce
	ADD CONSTRAINT pk_PoliceForce PRIMARY KEY CLUSTERED (Code)


-- creating HomeAreaType Dim Table
SELECT * FROM stg.['Home Area Type$']
SELECT * INTO rpt.HomeAreaType FROM stg.['Home Area Type$']

SELECT * FROM rpt.HomeAreaType

ALTER TABLE rpt.HomeAreaType
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.HomeAreaType
	ADD CONSTRAINT pk_HomeAreaType PRIMARY KEY CLUSTERED (Code)


-- creating CasualtyClass Dim Table
SELECT * FROM stg.['Casualty Class$']
SELECT * INTO rpt.CasualtyClass FROM stg.['Casualty Class$']

SELECT * FROM rpt.CasualtyClass

ALTER TABLE rpt.CasualtyClass
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.CasualtyClass
	ADD CONSTRAINT pk_CasualtyClass PRIMARY KEY CLUSTERED (Code)


-- creating PedLocation Dim Table
SELECT * FROM stg.['Ped Location$']
SELECT * INTO rpt.PedLocation FROM stg.['Ped Location$']

SELECT * FROM rpt.PedLocation

ALTER TABLE rpt.PedLocation
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.PedLocation
	ADD CONSTRAINT pk_PedLocation PRIMARY KEY CLUSTERED (Code)


-- creating CarPassenger Dim Table
SELECT * FROM stg.['Car Passenger$']
SELECT * INTO rpt.CarPassenger FROM stg.['Car Passenger$']

SELECT * FROM rpt.CarPassenger

ALTER TABLE rpt.CarPassenger
	 ALTER COLUMN Code INTEGER NOT NULL

ALTER TABLE rpt.CarPassenger
	ADD CONSTRAINT pk_CarPassenger PRIMARY KEY CLUSTERED (Code)