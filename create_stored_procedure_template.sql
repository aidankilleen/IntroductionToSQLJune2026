-- create-stored_procedure_template.sql

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Aidan
-- Create Date: 24/06/2026
-- Description: Count Customers and Suppliers for the specified country
-- =============================================
CREATE OR ALTER PROCEDURE sp_akCustomerCountForCountry
(
    @CountryName NVARCHAR(15)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    DECLARE @CustomerCount int;
    DECLARE @SupplierCount int;

    -- Insert statements for procedure here
    SELECT @CustomerCount = COUNT(*)  
    FROM Customers
    WHERE Country = @CountryName;

    SELECT @SupplierCount = COUNT(*) 
    FROM Suppliers
    WHERE Country = @CountryName;

    -- final select is the result of the stored procedure
    SELECT 
        @CustomerCount AS CustomerCount, 
        @SupplierCount AS SupplierCount
END
GO