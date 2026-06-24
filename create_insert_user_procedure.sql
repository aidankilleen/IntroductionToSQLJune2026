-- create_insert_user_procedure.sql

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: Insert a record into two tables
-- and ensure that both records have the same Id
-- =============================================
CREATE OR ALTER PROCEDURE sp_akInsertUser
(
    @Id int,
    @Name NVARCHAR(50),
    @Email NVARCHAR(50),
    @Active tinyint 
    
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
    SET IDENTITY_INSERT ak_Users ON;

    BEGIN TRY
        BEGIN TRANSACTION
        -- Insert statements for procedure here
        INSERT INTO ak_Users
        (Id, Name, Email, Active)
        VALUES(@Id, @Name, @Email, @Active);
        SET IDENTITY_INSERT ak_Users OFF;

        SET IDENTITY_INSERT ak_UsersArchive ON;
        INSERT INTO ak_UsersArchive
        (Id, Name, Email, Active)
        VALUES(@Id, @Name, @Email, @Active);
        SET IDENTITY_INSERT ak_UsersArchive OFF; 
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        -- if something goes wrong this
        -- code is executed
        PRINT 'Something went wrong'
        ROLLBACK TRANSACTION
    END CATCH   
END
GO