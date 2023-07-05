﻿CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FirstName] NVARCHAR(50) NOT NULL,
	[MiddleName] NVARCHAR(50),
	[LastName] NVARCHAR(50) NOT NULL, 
	[Email] NVARCHAR(50) NOT NULL,
	[Username] NVARCHAR(50) NOT NULL UNIQUE,
	[Password] NVARCHAR(50) NOT NULL,
    [DOB] DATE NOT NULL, 
    [CreatedAt] DATETIME NOT NULL DEFAULT (GETDATE()), 
	[RoleId] INT DEFAULT 1,
    CONSTRAINT [CK_User_DOB] CHECK ([DOB] <= GETDATE())
)