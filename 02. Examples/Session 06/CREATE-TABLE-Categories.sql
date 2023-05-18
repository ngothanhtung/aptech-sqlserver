CREATE TABLE [dbo].[Categories] (
	[Id] INT IDENTITY(1, 1),
	[Name] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(500)
);
GO

ALTER TABLE [dbo].[Categories]  
ADD CONSTRAINT PK_Categories PRIMARY KEY ([Id]);
GO

ALTER TABLE [dbo].[Categories] 
ADD CONSTRAINT UQ_Categories_Name UNIQUE ([Name]);
GO
