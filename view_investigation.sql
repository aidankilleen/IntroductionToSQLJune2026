-- view_investigation.sql

SELECT * FROM [Alphabetical list of products];

SELECT COUNT(*) FROM Products;

SELECT COUNT(*) FROM [Alphabetical list of products];


SELECT COUNT(*)
FROM [Order Details] od
INNER JOIN Products p
ON od.Productid = p.ProductID;

SELECT COUNT(*)
FROM [Order Details] od
INNER JOIN [Alphabetical list of products] p
ON od.Productid = p.ProductID;
