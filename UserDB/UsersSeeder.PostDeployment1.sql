/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


IF NOT EXISTS (SELECT 1 FROM [User])
BEGIN
    INSERT INTO [User] VALUES ('Bhavin', 'Rajeshbhai', 'Kareliya', 'bhavin@gmail.com', 'bhavin', '123123', '2002-02-09', CURRENT_TIMESTAMP, 1)
    INSERT INTO [User] VALUES ('Vipul', null, 'Kumar', 'vipul@gmail.com', 'vipul', '123123', '1999-01-01', CURRENT_TIMESTAMP, 1)
END