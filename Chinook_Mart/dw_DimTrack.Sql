USE Chinook
GO

--3503 
SELECT 
	t.TrackId,
	'AllLevels' AS 'AllLevels',
	art.ArtistId,
	art.[Name] AS 'Artist',
	alb.AlbumId,
	alb.Title AS 'Album',
	t.[Name] AS 'TrackName',
	t.Composer,
	t.Milliseconds,
	t.Bytes,
	t.UnitPrice
INTO stg.DimTrack
FROM dbo.Track t
INNER JOIN dbo.Album alb ON alb.AlbumId = t.AlbumId
INNER JOIN dbo.Artist art ON art.ArtistId = alb.ArtistId

--checking to see if I have same amount of records.. 3503
SELECT * FROM stg.DimTrack;

CREATE TABLE [dw].[DimTrack](
	[TrackId] [int] NOT NULL,
	[AllLevels] [varchar](9) NOT NULL,
	[ArtistId] [int] NOT NULL,
	[Artist] [nvarchar](120) NULL,
	[AlbumId] [int] NOT NULL,
	[Album] [nvarchar](160) NOT NULL,
	[TrackName] [nvarchar](200) NOT NULL,
	[Composer] [nvarchar](220) NULL,
	[Milliseconds] [int] NOT NULL,
	[Bytes] [int] NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE dw.DimTrack
	ADD CONSTRAINT pk_trackId PRIMARY KEY CLUSTERED (TrackId)

INSERT INTO dw.DimTrack SELECT * FROM stg.DimTrack;

--checking to see if I have same amount of records.. 3503
SELECT * FROM dw.DimTrack;
