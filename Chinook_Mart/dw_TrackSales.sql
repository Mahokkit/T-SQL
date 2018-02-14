USE Chinook
GO

SELECT 
	il.InvoiceLineId, --key
	il.TrackId, --key
	g.GenreId, --key
	m.MediaTypeId, --key
	i.CustomerId, --key
	CAST(CONVERT(CHAR(8), i.InvoiceDate, 112) AS INT) DateKey, --key
	dbc.billKey,
	il.UnitPrice,
	il.Quantity,
	i.Total
INTO stg.TrackSales
FROM dbo.InvoiceLine il
	LEFT OUTER JOIN dbo.Invoice i 
		ON il.InvoiceId = i.InvoiceId
	INNER JOIN dw.DimBillCity dbc 
		ON i.BillingCity = dbc.BillingCity
		AND i.BillingState = dbc.provState
		AND i.BillingCountry = dbc.BillingCountry
	INNER JOIN dbo.Track t
		ON t.TrackId = il.TrackId
	INNER JOIN dbo.Genre g
		ON g.GenreId = t.GenreId
	INNER JOIN dbo.MediaType m
		ON m.MediaTypeId = t.MediaTypeId

CREATE TABLE [dw].[TrackSales](
	[InvoiceLineId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
	[MediaTypeId] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[DateKey] [int] NULL,
	[billKey] [int] NOT NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total] [numeric](10, 2) NULL
) ON [PRIMARY]
GO

-- inserting data from staging schema to datawarehouse schema.
INSERT INTO dw.TrackFact SELECT * FROM stg.TrackSales;

SELECT * FROM dw.TrackSales; -- to see if it was successful

-- adding in primary keys and foreign key
ALTER TABLE dw.TrackSales
	ADD CONSTRAINT pk_TrackFact PRIMARY KEY CLUSTERED (InvoiceLineId);

ALTER TABLE dw.TrackSales
	ADD FOREIGN KEY (TrackId) REFERENCES dw.DimTrack(TrackId);
	
ALTER TABLE dw.TrackSales
	ADD FOREIGN KEY (GenreId) REFERENCES dw.DimGenre(GenreId);

ALTER TABLE dw.TrackSales
	ADD FOREIGN KEY (MediaTypeId) REFERENCES dw.DimMedia(MediaId);

ALTER TABLE dw.TrackSales
	ADD FOREIGN KEY (CustomerId) REFERENCES dw.DimCust(CustID);

ALTER TABLE dw.TrackSales
	ADD FOREIGN KEY (DateKey) REFERENCES dw.DimDate(DateKey);

ALTER TABLE dw.TrackSales
	ADD FOREIGN KEY (billKey) REFERENCES dw.DimBillCity(billKey);
