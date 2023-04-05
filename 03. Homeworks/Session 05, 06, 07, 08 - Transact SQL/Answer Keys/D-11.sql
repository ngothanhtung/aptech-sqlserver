SELECT *
FROM Products
WHERE Id NOT IN (
        SELECT ProductId
        FROM OrderDetails
    )