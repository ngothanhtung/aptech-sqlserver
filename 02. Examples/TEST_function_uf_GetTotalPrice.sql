SELECT *, dbo.uf_GetTotalPrice(P.Price, P.Discount, OD.Quantity) AS Total
FROM OrderDetails AS OD
INNER JOIN Products AS P
ON OD.ProductId = P.Id