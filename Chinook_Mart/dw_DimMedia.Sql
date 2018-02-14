USE Chinook
GO

-- every simple, only one level. No need for staging area.
SELECT 
	mt.MediaTypeId AS 'MediaId',
	'AllLevels' AS 'AllLevels',
	mt.[Name] AS 'Media'
INTO dw.DimMedia
FROM dbo.MediaType mt;

--adding primary key
ALTER TABLE dw.DimMedia
	ADD CONSTRAINT pk_mediaId PRIMARY KEY CLUSTERED (MediaId)
