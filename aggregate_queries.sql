 -- aggregate_queries.sql


SELECT COUNT(EmployeeID) FROM Employees;

SELECT COUNT(*) FROM Orders;
SELECT COUNT(*) FROM [Order Details];

-- AGGREGATE queries must have every field either in a aggregate function or
-- in the GROUP BY clause
SELECT TOP 5
    Country, COUNT(*) AS Count
FROM Customers
GROUP BY Country
ORDER BY Count DESC;


SELECT 
TOP 10 
*, UnitPrice * Quantity * (1 - Discount) AS LineValue
FROM [Order Details];


SELECT TOP 10
    OrderID, ROUND(SUM(UnitPrice * Quantity * (1 - Discount)),2) AS OrderValue
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderValue DESC;

SELECT Country FROM Customers;  -- returns 91 records
SELECT DISTINCT Country FROM Customers; -- returns 21 records


SELECT 
    Country, COUNT(*) AS Count
FROM Customers
WHERE Country LIKE 'S%' OR Country LIKE 'U%' OR Country LIKE 'B%'
GROUP BY Country
HAVING COUNT(*) >= 7
ORDER BY Count DESC

-- WHERE Filters the records that are used to compile the aggregation
-- HAVING is used to filter the results of the aggregation

SELECT 
    Country, COUNT(*) AS Count
FROM Customers
WHERE Country LIKE 'S%' OR Country LIKE 'U%' OR Country LIKE 'B%'
GROUP BY Country
HAVING COUNT(*) >= 7
ORDER BY Count DESC

