USE UKAccidents
GO

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_dCalendar	FOREIGN KEY (date_fk) REFERENCES rpt.dCalendar(DateKey); 


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN CasualtyClass INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_CasualtyClass FOREIGN KEY (CasualtyClass) REFERENCES rpt.CasualtyClass(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN SexOfCasualty INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_SexOfCasualty FOREIGN KEY (SexOfCasualty) REFERENCES rpt.SexOfCasualty(Code);
	

ALTER TABLE rpt.fCasualty
	 ALTER COLUMN AgeBandOfCasualty INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_AgeBandOfCasualty FOREIGN KEY (AgeBandOfCasualty) REFERENCES rpt.AgeBand(Code);
		

ALTER TABLE rpt.fCasualty
	 ALTER COLUMN CasualtySeverity INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_CasualtySeverity FOREIGN KEY (CasualtySeverity) REFERENCES rpt.CasualtySeverity(Code);
			

ALTER TABLE rpt.fCasualty
	 ALTER COLUMN PedestrianLocation INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_PedestrianLocation FOREIGN KEY (PedestrianLocation) REFERENCES rpt.PedLocation(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN PedestrianMovement INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_PedestrianMovement FOREIGN KEY (PedestrianMovement) REFERENCES rpt.PedMovement(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN CarPassenger INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_CarPassenger FOREIGN KEY (CarPassenger) REFERENCES rpt.CarPassenger(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN BusOrCoachPassenger INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_BusOrCoachPassenger FOREIGN KEY (BusOrCoachPassenger) REFERENCES rpt.BusPassenger(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN PedestrianRoadMaintenanceWorker INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_PedestrianRoadMaintenanceWorker 
	FOREIGN KEY (PedestrianRoadMaintenanceWorker) REFERENCES rpt.PedRoadMaintenanceWorker(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN CasualtyType INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_CasualtyType 
	FOREIGN KEY (CasualtyType) REFERENCES rpt.CasualtyType(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN CasualtyHomeAreaType INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_CasualtyHomeAreaType 
	FOREIGN KEY (CasualtyHomeAreaType) REFERENCES rpt.HomeAreaType(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN CasualtyIMDDecile INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_CasualtyIMDDecile 
	FOREIGN KEY (CasualtyIMDDecile) REFERENCES rpt.IMDDecile(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN CasualtyAuthorityDistrict INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_CasualtyAuthorityDistrict 
	FOREIGN KEY (CasualtyAuthorityDistrict) REFERENCES rpt.LocalAuthorityDistrict(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN CasualtyAuthorityHighway NVARCHAR(255) NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_CasualtyAuthorityHighway 
	FOREIGN KEY (CasualtyAuthorityHighway) REFERENCES rpt.LocalAuthorityHighway(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN CasualtyPoliceForce INT NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_CasualtyPoliceForce 
	FOREIGN KEY (CasualtyPoliceForce) REFERENCES rpt.PoliceForce(Code);



ALTER TABLE rpt.fCasualty
	 ALTER COLUMN VehicleType INT NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_VehicleType 
	FOREIGN KEY (VehicleType) REFERENCES rpt.VehicleType(Code);


ALTER TABLE rpt.fCasualty
	 ALTER COLUMN AgeBandOfDriver INTEGER NULL

ALTER TABLE rpt.fCasualty
	ADD CONSTRAINT FK_AgeBandOfDriver FOREIGN KEY (AgeBandOfDriver) REFERENCES rpt.DriverAgeBand(Code);