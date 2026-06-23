SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  DDL- Data Description Language
--  Creating the DB objects - Tables, Views etc.
create view [dbo].[ak_OrderSubtotal] AS
    SELECT 
        o.OrderID,  
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) as OrderValue
    FROM Orders o
    INNER JOIN [Order Details] od
    ON o.OrderID = od.OrderID
    GROUP BY o.OrderID
GO
