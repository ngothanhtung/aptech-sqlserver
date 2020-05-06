SELECT C.Id, 
SUM(
	(OD.Quantity * P.Price) * (100 - P.Discount) /100
)
 AS Total
FROM Customers AS C

INNER JOIN Orders AS O
ON O.CustomerId = C.Id

INNER JOIN OrderDetails AS OD
ON OD.OrderId = O.Id

INNER JOIN Products AS P
ON OD.ProductId = P.Id

GROUP BY C.Id