SELECT * FROM Orders
WHERE 
	[Status] = 'COMPLETED'
	AND CreatedDate = GETDATE()