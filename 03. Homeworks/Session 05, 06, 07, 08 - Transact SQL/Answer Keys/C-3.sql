SELECT *
FROM Products
WHERE (Price * (100 - Discount) / 100) <= 100000