EXEC akVersatileInsert 
    'Veronica', 
    'veronica@gmail.com', 
    1, 
    1011;


EXEC sp_akInsertUser 
    1000,
    'Veronica', 
    'veronica@gmail.com', 
    1;


SELECT TOP 5 
    * 
FROM ak_Users
ORDER BY Id DESC;

SELECT TOP 10
    *
FROM ak_UserPurchases
ORDER BY PurchaseId DESC;

SELECT TOP 5 
    * 
FROM ak_UsersArchive
ORDER BY Id DESC


SELECT * FROM
(SELECT TOP 5 
    * 
FROM ak_Users
ORDER BY Id DESC) u

UNION
SELECT * FROM 
(
SELECT TOP 5 
    * 
FROM ak_UsersArchive
ORDER BY Id DESC) u2;
-- SELECT COUNT(*) FROM Customers;