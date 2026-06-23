-- dml_investigation.sql

-- DQL - Data Query Language (SELECT)

-- DML - Data Manipulation Language (INSERT, UPDATE, DELETE)

SELECT COUNT(*) FROM aik_Customers;

-- use DELETE With caution
DELETE FROM aik_Customers
WHERE CustomerID = 'PARIS';

-- Referential Integrity
-- checks built into the database that prevent you doing certain operations
-- if the person set up the database correctly
-- you shouldn't be able to delete a Customer if it has Orders
-- 
DELETE FROM Customers WHERE CustomerID = 'SAVEA';


-- C.R.U.D
-- Create - INSERT
-- Retrieve - DQL - SELECT
-- Update - UPDATE
-- Delete - DELETE

DELETE FROM aik_Customers WHERE CustomerID = 'XXXXXX';

-- UPDATE
UPDATE aik_Customers
SET 
    ContactName = 'Aidan Killeen', 
    ContactTitle = 'Technical Trainer'
WHERE CustomerID = 'XXXXXX';

SELECT * FROM aik_Customers WHERE ContactName LIKE 'Aidan%'

SELECT TOP 10 * FROM aik_customers;


-- Create
INSERT INTO Customers
(CustomerID, CompanyName)
VALUES('SAVEA', "Aidans Test");

-- When you use SELECT INTO to create your table
-- Not all of the referential integrity rules are copied
-- hence you can have two customers with the same id in aik_Customers
-- but you can't have them in the original Customers table
INSERT INTO aik_Customers
(CustomerID, CompanyName)
VALUES('AK002', 'Professional Training');

SELECT * FROM aik_Customers WHERE CustomerID LIKE 'A%';


INSERT INTO Orders

-- 10.52 - ten minutes
-- 
-- Can you create a Customer Record in the Customers table
-- Can you create an Order for that Customer in the Orders table
-- Can you create an Order Details record in the [Order Details] table

INSERT INTO Customers
(CustomerID, CompanyName,ContactName, ContactTitle)
VALUES('AK001', 'AK Company', 'Aidan Killeen', 'Technical Trainer');

SELECT * FROM Customers WHERE CustomerID LIKE 'AK%';


INSERT INTO Orders 
(CustomerID, EmployeeID, OrderDate)
VALUES('AK001', 1, GETDATE());

INSERT INTO [Order Details]
VALUES(11086, 1, 18.00, 1, 0);


SELECT TOP 10 * FROM Orders ORDER BY OrderID DESC;

SELECT * FROM Products;