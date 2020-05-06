SELECT *, (OD.Quantity * P.Price) * (100 - P.Discount) /100 AS Total
FROM OrderDetails AS OD
INNER JOIN Products AS P
ON OD.ProductId = P.Id