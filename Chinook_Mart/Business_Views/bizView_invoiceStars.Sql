--Creating a Business View from the Invoice Stars

CREATE VIEW bizView_invoiceStars
AS
	SELECT b.billCnty, d.[Year], COUNT(i.dd_invoiceId) AS 'TOTAL INVOICE'
	FROM dw.Invoice i
	INNER JOIN dw.DimDate d ON d.DateKey = i.invDate
	INNER JOIN dw.DimBillReg b ON b.billKey = i.billKey
	GROUP BY b.billCnty, d.[Year];
