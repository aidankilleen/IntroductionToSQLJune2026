-- date investigation.sql

SELECT GETDATE();

INSERT INTO ak_UserPurchases
(UserId, PurchaseDate, Amount)
VALUES(19, GETDATE(), 9.99);

SELECT * FROM ak_UserPurchases;

INSERT INTO ak_UserPurchases
(UserId, PurchaseDate, Amount)
VALUES(19, '01-13-2025', 9.99); -- notice - American date format

INSERT INTO ak_UserPurchases
(UserId, PurchaseDate, Amount)
VALUES(19, '2026-05-13', 9.99);

SELECT DATEFROMPARTS(2026,1,1);


SELECT *, DATEDIFF(dd, PurchaseDate, GETDATE()) AS Age FROM ak_UserPurchases;

SELECT 
    MONTH(PurchaseDate) AS Month, YEAR(PurchaseDate) AS Year,
    COUNT(*) AS TransactionCount  
FROM ak_UserPurchases
GROUP BY MONTH(PurchaseDate), YEAR(PurchaseDate);


SELECT 
    PurchaseDate, 
    EOMONTH(PurchaseDate) AS EndOfMonth, 
    DATEADD(dd, 30, PurchaseDate) AS InvoiceDueDate 
FROM ak_UserPurchases;


SELECT FORMAT(GETDATE(), 'dd/MM/yyyy', 'en-GB') AS 'Date';
SELECT FORMAT(GETDATE(), 'd', 'en-GB') AS 'Date';
SELECT FORMAT(GETDATE(), 'D', 'en-GB') AS 'Date';



SELECT USER;
SELECT @@SERVERNAME;


