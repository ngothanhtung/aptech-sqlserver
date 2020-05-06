-- Categories
CREATE TABLE [Categories]
(
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(100) UNIQUE NOT NULL,
	[Description] NVARCHAR(500)
)
GO
-- Suppliers
CREATE TABLE [Suppliers]
(
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(100) NOT NULL,
	[PhoneNumber] VARCHAR(50),
	[Address] NVARCHAR(500) NOT NULL,
	[Email] VARCHAR(50) UNIQUE NOT NULL,
)
GO
-- Customers
CREATE TABLE [Customers]
(
	[Id] VARCHAR(50) PRIMARY KEY,
	[FirstName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[PhoneNumber] VARCHAR(50),
	[Address] NVARCHAR(500) NOT NULL,
	[Email] VARCHAR(50) UNIQUE NOT NULL,
	[Birthday] DATETIME
)
GO
-- Employees
CREATE TABLE [Employees]
(
	[Id] VARCHAR(50) PRIMARY KEY,
	[FirstName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[PhoneNumber] VARCHAR(50),
	[Address] NVARCHAR(500) NOT NULL,
	[Email] VARCHAR(50) UNIQUE NOT NULL,
	[Birthday] DATETIME
)
GO
-- Products
CREATE TABLE Products 
(
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50) NOT NULL UNIQUE,
	[Price] MONEY NOT NULL DEFAULT(0), CHECK([Price] >= 0),
	[Discount] DECIMAL(18, 2) NOT NULL DEFAULT(0), CHECK([Discount] BETWEEN 0 AND 100),
	[Stock] DECIMAL(18, 2) NOT NULL DEFAULT(0), CHECK([Stock] >= 0),
	[Description] NVARCHAR(MAX),
	[CategoryId] INT NOT NULL REFERENCES [Categories](Id),
	[SupplierId] INT NOT NULL REFERENCES [Suppliers](Id),
)
GO
-- Orders
CREATE TABLE Orders
(
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[CreatedDate] DATETIME NOT NULL DEFAULT(GETDATE()),
	[ShippedDate] DATETIME, CHECK([ShippedDate] >= [CreatedDate]),
	[Status] VARCHAR(50) NOT NULL DEFAULT('WAITING'), CHECK([Status] IN ('WAITING', 'COMPLETED', 'CANCELED')),
	[Description] NVARCHAR(MAX),
	[ShippingAddress] NVARCHAR(500) NOT NULL,
	[ShippingCity] NVARCHAR(50) NOT NULL,
	[PaymentType] VARCHAR(20) NOT NULL DEFAULT('CASH'), CHECK([PaymentType] IN ('CREDIT CARD', 'CASH')),
	[CustomerId] VARCHAR(50) NOT NULL REFERENCES [Customers](Id),
	[EmployeeId] VARCHAR(50) NOT NULL REFERENCES [Employees](Id)
)
GO
-- OrderDetails
CREATE TABLE [OrderDetails]
(
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[OrderId] INT NOT NULL REFERENCES [Orders](Id),
	[ProductId] INT NOT NULL REFERENCES [Products](Id),
	[Quantity] DECIMAL(18, 2) NOT NULL, CHECK([Quantity] > 0)
)
GO