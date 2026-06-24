SELECT 
    UnitPrice, Quantity, Discount,
    dbo.akLineValue(UnitPrice, Quantity, Discount) AS LineValue
FROM [Order Details];