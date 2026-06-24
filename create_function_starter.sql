-- create_function_starter.sql

-- ======================================================
-- Create Scalar Function Template for Azure SQL Database
-- ======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Aidan 
-- Create Date: 24 June 2026
-- Description: Calculate the LineValue for [Order Details] records
-- =============================================
CREATE OR ALTER FUNCTION dbo.akLineValue
(
    -- Add the parameters for the function here
    @UnitPrice money,
    @Quantity smallint,
    @Discount real
)
RETURNS money
AS
BEGIN
    -- Declare the return variable here
    DECLARE @LineValue money;

    SELECT @LineValue = @UnitPrice * @Quantity * (1 - @Discount);

    -- Return the result of the function
    RETURN @LineValue;
END
GO
