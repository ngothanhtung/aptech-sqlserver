CREATE FUNCTION dbo.uf_GetTotalPrice
(
	@Price MONEY,
	@Discount DECIMAL(18, 2),
	@Quantity INT
)
RETURNS MONEY
AS
BEGIN
	DECLARE @Result MONEY
	SET @Result = (@Price * @Quantity) * (100 - @Discount) / 100
	RETURN @Result
END