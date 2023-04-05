-- CREATE TABLE LOGS

CREATE TABLE
    dbo.OrderLogs(
        [Id] INT PRIMARY KEY IDENTITY(1, 1),
        [OrderId] INT NOT NULL,
        [Status] VARCHAR(50) NOT NULL,
        [CreatedDate] DATETIME NOT NULL DEFAULT(GETDATE()),
        [EmployeeId] VARCHAR(50) NOT NULL,
        [CustomerId] VARCHAR(50) NOT NULL
    ) GO -- CREATE TRIGGER
    ALTER TRIGGER dbo.trigger_WriteLogs ON dbo.Orders AFTER
UPDATE AS IF (
        SELECT Status
        FROM
            INSERTED
    ) = 'COMPLETED' BEGIN
INSERT INTO OrderLogs
SELECT
    Id,
    Status,
    GETDATE(),
    EmployeeId,
    CustomerId
FROM INSERTED
END