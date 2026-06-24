SELECT TOP 1 
    UnitPrice, Quantity, Discount, 'hn',
    dbo.hnLineValue(UnitPrice, Quantity, Discount) AS LineValue
FROM [Order Details]

UNION 

SELECT TOP 1 
    UnitPrice, Quantity, Discount, 'jw',
    dbo.JWLineValue(UnitPrice, Quantity, Discount) AS LineValue
FROM [Order Details]

UNION

SELECT TOP 1 
    UnitPrice, Quantity, Discount,'km',
    dbo.kmLineValue(UnitPrice, Quantity, Discount) AS LineValue
FROM [Order Details]

UNION

SELECT TOP 1 
    UnitPrice, Quantity, Discount,'sm',
    dbo.smLineValue(UnitPrice, Quantity, Discount) AS LineValue
FROM [Order Details]


