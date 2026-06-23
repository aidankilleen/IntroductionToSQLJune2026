-- Subqueries -> view


SELECT 
    * 
FROM 
    (
        SELECT * FROM Products
    ) AS ProductSubQuery;

-- often subqueries do some sort of analysis or aggregation

SELECT ProductName, ProductCount FROM 
    (
        SELECT
            p.ProductID, p.ProductName, COUNT(od.ProductID) as ProductCount
        FROM Products p INNER JOIN [Order Details] od
        ON p.ProductID = od.ProductID
        GROUP BY p.ProductID, p.ProductName
    ) AS ProductCount
WHERE ProductCount > 40;


SELECT od.ProductID, od.OrderID FROM [Order Details] od


-- this query gives the total for a order
SELECT 
    o.OrderID,  
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) as OrderValue
FROM Orders o
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
GROUP BY o.OrderID;


SELECT 
    cu.CustomerID, o.OrderID, ot.OrderValue
FROM Customers cu
INNER JOIN Orders o
ON cu.CustomerID = o.CustomerID
INNER JOIN 
    (
        SELECT 
            o.OrderID,  
            SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) as OrderValue
        FROM Orders o
        INNER JOIN [Order Details] od
        ON o.OrderID = od.OrderID
        GROUP BY o.OrderID
    ) ot
    ON o.OrderID = ot.OrderID;

SELECT * FROM ak_OrderSubtotal;

SELECT 
    cu.CustomerID, o.OrderID, ot.OrderValue
FROM Customers cu
INNER JOIN Orders o
ON cu.CustomerID = o.CustomerID
INNER JOIN ak_OrderSubtotal ot
ON o.OrderID = ot.OrderID;

-- simple use of a subquery 



DELETE FROM aik_Customers;

-- SELECT INTO creates the table
-- it fails if the table doesn't exist
SELECT * INTO aik_Customers FROM Customers;

-- use a subquery with an INSERT to copy records from one table to another
INSERT INTO aik_Customers SELECT * FROM Customers;


-- What is the most expensive product?
-- use a subquery in WHERE clause
SELECT * FROM Products
WHERE UnitPrice = (
    SELECT MAX(UnitPrice) FROM Products
);


-- SELECT WHERE IN
-- WHERE IN not every sql missing from mysql (?)

SELECT * FROM Customers 
WHERE CustomerID = 'SAVEA' OR CustomerID = 'AK001' OR CustomerID = 'BLAUS';

-- Equivalent to 
SELECT * FROM Customers
WHERE CustomerID IN ('SAVEA', 'AK001', 'BLAUS');

-- use a subquery in a WHERE IN
SELECT * FROM Orders
WHERE CustomerID IN 
    (
        SELECT 
            CustomerID 
        FROM Customers 
        WHERE Country='France'
    );

-- find all products for a given supplier
SELECT * FROM Products
WHERE SupplierID = (
    SELECT SupplierID 
    FROM Suppliers WHERE CompanyName = 'Exotic Liquids'
);

-- all products that have a > average Unit Price
SELECT 
    ProductID, UnitPrice, 
    (SELECT AVG(UnitPrice) FROM Products) as AveragePrice
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);



SELECT AVG(UnitPrice) FROM Products;





















