SELECT * FROM Customers;

-- * means select all columns

SELECT CustomerID, CompanyName FROM Customers;

-- SQL ignores whitespace - spaces and newlines and tabs.
SELECT 
    CustomerID, CompanyName, Country 
FROM Customers
WHERE Country = 'Germany'

-- WHERE clause allows us to filter the restults to some subset of the records


-- You don't have to have the field used in the WHERE as part of the SELECT
-- use single quotes for text data, double quotes cause a problem
/* SELECT 
    CustomerID, CompanyName 
FROM Customers
WHERE Country = "Germany"; */


-- note Comparison of text "seems" to be case insensitive (this is a db config)
SELECT * FROM Customers
WHERE Country = 'GERMANY' OR Country = 'France';

SELECT * FROM Customers
WHERE Country = 'France' AND City = 'Paris';

-- you can partially match the text
SELECT * FROM Customers
WHERE City LIKE 'M%';

SELECT * FROM Customers
WHERE Country = 'Germany'
AND CompanyName LIKE '%Delikatessen'
OR CompanyName LIKE '%Marktstand';

-- SQL can sort
-- The order of the clauses is defined and important
SELECT CustomerID, CompanyName, Country, City FROM Customers
WHERE Country='GERMANY'
ORDER BY Country,City;



-- The order of the clauses is defined and important
-- SELECT CustomerID, CompanyName, Country, City FROM Customers
-- ORDER BY Country,City
-- WHERE Country='GERMANY';


-- DQL - Data Query Language (SELECT)


-- you can alter the sort order using DESC
SELECT * FROM Customers
ORDER BY CustomerID DESC;

-- you can limit the number of records returned
SELECT TOP 5 * 
FROM Customers
ORDER BY CustomerID DESC;

-- This sytax differs by database
-- MySQL + Postgres use "LIMIT" instead of "TOP"
-- SELECT * FROM Customers LIMIT 5;


SELECT TOP 5 * FROM Orders;

-- SQL allows spaces in names (tables, fields etc)
-- use [] around an identifier that has a space in the name
-- you can also use "" around identifiers with spaces - I'm going to use []
-- always try and be consistent

SELECT TOP 5 * FROM [Order Details];
SELECT TOP 5 * FROM "Order Details";



SELECT TOP 5 * FROM [Order Details];

-- When we SELECT we can do various expressions involving the fields
-- assign alias to expressions using "AS"
-- assign and alias to any column
SELECT 
TOP 5 
    UnitPrice AS Price, Quantity AS Qty, Discount AS Disc,
    UnitPrice * Quantity * (1 - Discount) AS [Line Value]
FROM [Order Details]
WHERE Discount > 0;



-- We can also use Functions inside in our expressions
SELECT 
TOP 5 
    UnitPrice AS Price, Quantity AS Qty, Discount AS Disc,
    ROUND(UnitPrice * Quantity * (1 - Discount), 2) AS [Line Value]
FROM [Order Details]
WHERE Discount > 0;

SELECT (UnitPrice * Quantity) - (Discount * UnitPrice * Quantity)
FROM [Order Details];

SELECT (UnitPrice * Quantity) * 0.85    -- 0.85 is a 15% discount
FROM [Order Details]

SELECT (UnitPrice * Quantity) * (1 - Discount)    -- 0.85 is a 15% discount
FROM [Order Details]



SELECT 
TOP 5 
    UnitPrice, Quantity, Discount, PI() as PI
FROM [Order Details];



SELECT CURRENT_DATE;
SELECT CURRENT_TIMESTAMP;

SELECT GETDATE();



