USE Chinook
GO

DROP TABLE dw.Invoice;

SELECT 
	i.InvoiceId AS 'invKey',
	cast(convert(char(8), i.InvoiceDate, 112) AS INT) As invDate,
	br.billKey AS billKey,
	i.CustomerId AS custID,
	('inv-' + cast(i.InvoiceId AS NVARCHAR(30))) as dd_invoiceId, -- degenerate dimension
	i.Total AS 'Total'
INTO dw.Invoice
FROM dbo.Invoice i
INNER JOIN dw.DimBillReg br
	ON i.BillingCity + isnull(i.BillingState, i.BillingCountry) + i.BillingCountry
		= br.billCity + br.billState + br.billCnty
		;

ALTER TABLE dw.Invoice
	ADD CONSTRAINT pk_invKey PRIMARY KEY CLUSTERED (invKey DESC)
