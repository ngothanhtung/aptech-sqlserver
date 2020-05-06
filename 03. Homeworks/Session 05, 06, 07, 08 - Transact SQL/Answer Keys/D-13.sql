SELECT TOP 3 E.Id, E.FirstName, E.LastName, E.Email,
	SUM(P.Price * OD.Quantity * (100 - P.Discount) / 100) AS TotalMoney
 FROM 
Employees AS E
INNER JOIN Orders AS O
	ON E.Id = O.EmployeeId
INNER JOIN OrderDetails AS OD
	ON O.Id = OD.OrderId
INNER JOIN Products AS P
	ON OD.ProductId = P.Id
GROUP BY E.Id, E.FirstName, E.LastName, E.Email
ORDER BY SUM(P.Price * OD.Quantity * (100 - P.Discount) / 100) DESC