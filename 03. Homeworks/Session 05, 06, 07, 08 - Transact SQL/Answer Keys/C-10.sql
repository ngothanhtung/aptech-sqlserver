SELECT *
FROM Orders
WHERE
    [Status] = 'CANCELED'
    AND CreatedDate = GETDATE()