SELECT
    C.Id,
    C.FirstName,
    C.LastName,
    C.Email,
    C.PhoneNumber,
    C.Address,
    C.Birthday,
    SUM(
        P.Price * OD.Quantity * (100 - P.Discount) / 100
    ) AS Number
FROM Customers AS C
    INNER JOIN Orders AS O ON C.Id = O.CustomerId
    INNER JOIN OrderDetails AS OD ON O.Id = OD.OrderId
    INNER JOIN Products AS P ON OD.ProductId = P.Id
WHERE
    O.CreatedDate BETWEEN '2017-01-01' AND GETDATE()
GROUP BY
    C.Id,
    C.FirstName,
    C.LastName,
    C.Email,
    C.PhoneNumber,
    C.Address,
    C.Birthday