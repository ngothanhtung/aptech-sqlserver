SELECT C.Name, Count(P.Id) AS Number 
FROM Categories AS C
LEFT JOIN Products AS P
ON C.Id = P.CategoryId
GROUP BY ALL C.Name