-- generate a guid
SELECT NEWID();


-- ORDER BY NEWID() you get a random order
SELECT * FROM Customers ORDER BY NEWID();


-- select a random record

SELECT TOP 1 * FROM Customers ORDER BY NEWID();