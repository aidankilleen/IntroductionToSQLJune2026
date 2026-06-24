-- create_procedure_versatile_insert.sql

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE OR ALTER PROCEDURE akVersatileInsert
(
    @Name NVARCHAR(50),
    @Email NVARCHAR(50),
    @Active tinyint, 
    @Id int = NULL
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    BEGIN TRY
        IF @Id IS NULL
        BEGIN
            INSERT INTO ak_Users
            (Name, Email, Active)
            VALUES(@Name, @Email, @Active);

            -- how do I determine the Id that 
            -- was generated
            SELECT @Id = @@IDENTITY;

        END
        ELSE
        BEGIN
            PRINT 'do insert with id'
            SET IDENTITY_INSERT ak_Users ON;
            INSERT INTO ak_Users
            (Id, Name, Email, Active)
            VALUES(@Id, @Name, @Email, @Active);
            SET IDENTITY_INSERT ak_Users OFF;
        END

        -- insert some sample transactions for this user
        INSERT INTO ak_UserPurchases
        (UserId, PurchaseDate, Amount)
        VALUES(@Id, GETDATE(), 9.99);

    END TRY
    BEGIN CATCH
        PRINT 'Can''t insert a duplicate id.'
    END CATCH
    -- Insert statements for procedure here
END
GO