--	b.BillingCountry
--FROM dw.Invoice i
--INNER JOIN dw.DimBillCity b ON b.billKey = i.billKey
--GROUP BY b.BillingCountry
--ORDER BY SUM(i.Total) DESC

SELECT 
	COUNT(i.dd_invoiceId) AS 'Count of Invoices', 
	b.BillingCountry
FROM dw.Invoice i
INNER JOIN dw.DimBillCity b ON b.billKey = i.billKey
GROUP BY b.BillingCountry
ORDER BY 'Count of Invoices' ASC

--SELECT 
--	b.BillingCountry
--FROM dw.Invoice i
--INNER JOIN dw.DimBillCity b ON b.billKey = i.billKey
--WHERE COUNT(i.dd_invoiceId) = 7
--	(
--		SELECT 
--			TOP(1) (COUNT(i.dd_invoiceId))
--		FROM dw.Invoice i
--		INNER JOIN dw.DimBillCity b ON b.billKey = i.billKey
--		GROUP BY b.BillingCountry
--	)
--GROUP BY b.BillingCountry


--		SELECT 
--			TOP(1) (COUNT(i.dd_invoiceId)) c
--		FROM dw.Invoice i
--		INNER JOIN dw.DimBillCity b ON b.billKey = i.billKey
--		GROUP BY b.BillingCountry

SELECT 
	*
FROM
	(
		SELECT 
			COUNT(i.dd_invoiceId) AS 'Count of Invoices', 
			b.BillingCountry
		FROM dw.Invoice i
		INNER JOIN dw.DimBillCity b ON b.billKey = i.billKey
		GROUP BY b.BillingCountry
	) i
WHERE i.[Count of Invoices] = 
	(
		SELECT 
			TOP(1) (COUNT(i.dd_invoiceId)) c
		FROM dw.Invoice i
		INNER JOIN dw.DimBillCity b ON b.billKey = i.billKey
		GROUP BY b.BillingCountry
	)
