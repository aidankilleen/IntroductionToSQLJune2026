
CREATE OR ALTER TRIGGER archiveUser ON dbo.ak_Users 
AFTER INSERT
AS 
BEGIN
    PRINT 'Copying record to ak_UsersArchive'

    SET IDENTITY_INSERT ak_UsersArchive ON;
    INSERT INTO ak_UsersArchive
    (Id, Name, Email, Active)
    SELECT * FROM inserted;
    SET IDENTITY_INSERT ak_UsersArchive OFF;

END

GO