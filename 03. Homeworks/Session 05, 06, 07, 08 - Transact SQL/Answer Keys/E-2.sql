ALTER FUNCTION dbo.uf_GetOrderDetails
(
	@OrderId INT
)
RETURNS @OrderDetails TABLE 
(
   ProductId INT NOT NULL,
   Quantity INT NOT NULL,
   Price MONEY,
   Discount DECIMAL(18, 2)
) 
AS
BEGIN
   INSERT INTO @OrderDetails (ProductId, Quantity)
   SELECT ProductId, Quantity 
   FROM   OrderDetails
   WHERE  OrderId = @OrderId
   
   UPDATE @OrderDetails 
   SET 
		Price = (SELECT Price FROM Products AS P WHERE P.Id = ProductId),
		Discount = (SELECT Discount FROM Products AS P WHERE P.Id = ProductId)
  
   RETURN;
END;