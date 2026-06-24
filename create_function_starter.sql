-- create_function_starter.sql

-- ======================================================
-- Create Scalar Function Template for Azure SQL Database
-- ======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE FUNCTION dbo.LineValue
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

    SELECT @LineValue = 9.99;

    -- Return the result of the function
    RETURN @LineValue;
END
GO
