ALTER TRIGGER [dbo].[trg_UpdateStock]
ON [dbo].[Orders]
FOR UPDATE
AS

DECLARE @OrderId INT

IF (SELECT [Status] FROM INSERTED) = 'COMPLETED'
	BEGIN
		SELECT @OrderId = Id FROM INSERTED

		UPDATE Products 
		SET Stock = Stock - (
			SELECT Quantity FROM OrderDetails 
			WHERE OrderId = @OrderId 
			AND ProductId = Products.Id		
		)
		WHERE
			Id IN (SELECT ProductId FROM OrderDetails 
			WHERE OrderId = @OrderId)							
	END
