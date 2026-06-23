-- join_introduction.sql

SELECT TOP 1
    * 
FROM [Order Details];

SELECT * FROM Products WHERE ProductID = 11;

-- we can join two tables using the common field (ProductID)
SELECT TOP 10
    *
FROM [Order Details] INNER JOIN Products
ON [Order Details].ProductID = Products.ProductID;

-- if there are two fields with the same name we have to specify which to use
-- we do this using [table].[fieldname]
SELECT TOP 10
    OrderID, [Order Details].UnitPrice, Quantity, Discount, ProductName
FROM [Order Details] INNER JOIN Products
ON [Order Details].ProductID = Products.ProductID;

--  when selecting from a table you can give each table an alias
--  this shortens the sytax quite considerably
--  only prefix with an alias the fields that 
--  have multiple options
SELECT TOP 10
    OrderID, od.UnitPrice, Quantity, Discount, ProductName
FROM [Order Details] od INNER JOIN Products p
ON od.ProductID = p.ProductID;


SELECT TOP 5
    *
FROM Products;

-- exercise 
-- can you select the Product and include the Supplier Name and the Category Name

-- exercise until 14.16
-- Product ID,ProductName, SuppierID, SupplierName, CategoryID, CategoryName


SELECT TOP 5
    ProductID, ProductName, 
    CompanyName, 
    CategoryName, c.CategoryID, s.SupplierID
FROM Products p
INNER JOIN Suppliers s
ON p.SupplierID = s.SupplierID
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID;


SELECT TOP 10 
    o.OrderID, 
    c.CustomerID, c.CompanyName,
    e.FirstName + ' ' + e.LastName AS EmployeeName, e.Title,
    s.CompanyName AS 'Shipper'  
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
INNER JOIN Employees e
ON o.EmployeeID = e.EmployeeID
INNER JOIN Shippers s
ON o.ShipVia = s.ShipperID;


-- Orders and [Order Details]
-- which to start with?
-- 

SELECT TOP 10
    OrderID, 
    UnitPrice * Quantity * (1 - Discount) as LineValue
FROM [Order Details];

-- aggreagating using a linked table
SELECT TOP 10
    o.OrderID, 
    c.CustomerID, c.CompanyName,
    SUM(UnitPrice * Quantity * (1 - Discount)) as OrderValue
FROM Orders o
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
GROUP BY o.OrderID, c.CustomerID, c.CompanyName;


-- slightly more complex joins

-- need to understand what INNER JOIN means and what are the alternatives - why?


-- can we join with joins from more than 1 table?

SELECT 
o.OrderID, 
od.ProductID, 
od.UnitPrice * od.Quantity * (1 - od.Discount) AS LineValue, 
s.SupplierID, s.CompanyName,
c.CategoryName
FROM Orders o
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN Products p
ON od.ProductID = p.ProductID
INNER JOIN Suppliers s
ON p.SupplierID = s.SupplierID
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID;

-- Aggregate this data
-- Total product sold for each Product Category
SELECT 
c.CategoryName,
SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS CategoryTotal 
FROM Orders o
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN Products p
ON od.ProductID = p.ProductID
INNER JOIN Suppliers s
ON p.SupplierID = s.SupplierID
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;



-- exercise - 10 minutes 15.55
-- can you do the aggregation 
-- customers and their total

-- CustomerID  | CustomerName | TotalSales
SELECT
o.CustomerID, cu.CompanyName,
SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS CustomerTotal
FROM Orders o
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN Products p
ON od.ProductID = p.ProductID
INNER JOIN Suppliers s
ON p.SupplierID = s.SupplierID
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID
INNER JOIN Customers cu
ON o.CustomerID = cu.CustomerID
GROUP BY o.CustomerID, cu.CompanyName
ORDER BY CustomerTotal DESC

-- there is a problem with this query
-- see if you can find it


SELECT COUNT(*) FROM Customers;

-- an inner join will only show the customers who have an order (89)
-- an outer join will show all customers and will show the orders for those that have orders (91)

SELECT 
    cu.CustomerID, cu.CompanyName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS CustomerTotal 
FROM Customers cu
LEFT OUTER JOIN Orders o
ON cu.CustomerID = o.CustomerID
LEFT OUTER JOIN [Order Details] od
ON o.OrderID = od.OrderID
GROUP BY cu.CustomerID, cu.CompanyName
ORDER BY CustomerTotal;

-- RIGHT OUTER JOIN will list everything from the right hand table
-- and the items from the left hand table that have joins

-- any RIGHT OUTER JOIN can be rewritten as a LEFT OUTER JOIN
-- so manay people only use LEFT OUTER JOINS - I'm one of them

SELECT 
    cu.CustomerID, COUNT(o.OrderID) as OrderCount
FROM Customers cu
LEFT OUTER JOIN Orders o
on cu.CustomerID = o.CustomerID
LEFT OUTER JOIN [Order Details] od
ON o.OrderID = od.OrderID
GROUP BY cu.CustomerID
ORDER BY OrderCount;



-- SQL Server Feature
-- SELECT INTO


SELECT * INTO aik_Customers FROM Customers;

SELECT COUNT(*) FROM aik_Customers;


-- DDL - Data Description Language (SQL for creating and deleting db objects)
DROP TABLE aik_Customers;