SELECT C.*,

(SELECT SUM(P.Price * OD.Quantity) FROM 
Orders AS O INNER JOIN 
OrderDetails AS OD 
ON O.Id = OD.OrderId
INNER JOIN Products AS P
ON OD.ProductId = P.Id
WHERE O.CustomerId = C.Id) AS SumMoney


 FROM Customers AS C

