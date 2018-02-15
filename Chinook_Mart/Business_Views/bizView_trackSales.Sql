-- Creating a business view from the Track Sales Star
CREATE VIEW bizView_trackSales
AS
	SELECT 
		SUM(t.Total) AS 'TOTAL SALES', 
		COUNT(t.TrackId) AS '# TRACK SOLD', 
		b.billCnty, 
		d.[Year]
	FROM dw.TrackSales t
	INNER JOIN dw.DimBillReg b ON b.billKey = t.billKey
	INNER JOIN dw.DimDate d ON d.DateKey = t.DateKey
	GROUP BY b.billCnty, d.[Year]
