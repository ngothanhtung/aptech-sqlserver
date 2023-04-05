SELECT *
FROM Customers
WHERE
    DAY(Birthday) = DAY(GETDATE())
    AND MONTH(Birthday) = MONTH(GETDATE())