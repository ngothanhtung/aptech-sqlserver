SELECT C.*,
(
	SELECT COUNT(*) FROM Products AS P
	WHERE P.CategoryId = C.Id
)
FROM Categories AS C
