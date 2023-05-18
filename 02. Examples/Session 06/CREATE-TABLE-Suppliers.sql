DROP TABLE [dbo].[Suppliers];
GO

CREATE TABLE [dbo].[Suppliers] (
	[Id] INT IDENTITY(1, 1),
	[Name] NVARCHAR(50) NOT NULL,
	[PhoneNumber] VARCHAR(50) NOT NULL,
	[Description] VARCHAR(500)
);
GO

-- ADD PRIMARY KEY
ALTER TABLE [dbo].[Suppliers] 
ADD CONSTRAINT PK_Suppliers PRIMARY KEY ([Id]);
GO


-- ADD NEW COLUMN
ALTER TABLE [dbo].[Suppliers]  
ADD [Email] VARCHAR(50) NOT NULL;
GO

-- ADD UNIQUE
ALTER TABLE [dbo].[Suppliers] 
ADD CONSTRAINT UQ_Categories_Email UNIQUE ([Email]);
GO

-- REMOVE COLUMN
ALTER TABLE [dbo].[Suppliers] 
DROP COLUMN [Description];
GO

-- REMOVE CONTRAINT
ALTER TABLE [dbo].[TableName]
DROP CONSTRAINT [ConstraintName];



