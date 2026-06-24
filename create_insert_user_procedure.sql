-- create_insert_user_procedure.sql

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE OR ALTER PROCEDURE sp_akInsertUser
(
    @Name NVARCHAR(50),
    @Email NVARCHAR(50),
    @Active tinyint
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    INSERT INTO ak_Users
    (Name, Email, Active)
    VALUES(@Name, @Email, @Active);

    INSERT INTO ak_UsersArchive
    (Name, Email, Active)
    VALUES(@Name, @Email, @Active);
END
GO