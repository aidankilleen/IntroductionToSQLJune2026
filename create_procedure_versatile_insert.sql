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

    -- Insert statements for procedure here
    PRINT 'is this working?'
END
GO