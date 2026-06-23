SELECT * FROM ak_Users;

DELETE FROM ak_Users;

INSERT INTO ak_Users
(Name, Email, Active)
VALUES
    ('Alice', 'alice@gmail.com', 1),
    ('Bob', 'bob@gmail.com', 0), 
    ('Carol', 'carol@gmail.com', 1), 
    ('Dan', 'dan@gmail.com', 0);

-- can't insert a record without a Name
INSERT INTO ak_Users
(Email, Active)
VALUES('eve@gmail.com', 1);


SELECT * FROM ak_UserPurchases;

SELECT * FROM ak_Users;

INSERT INTO ak_UserPurchases
(UserId, PurchaseDate, Amount)
VALUES(11, GETDATE(), 9.99);

INSERT INTO ak_UserPurchases
(UserId, PurchaseDate, Amount)
VALUES(99, GETDATE(), 9.99);

DELETE FROM ak_UserPurchases;

SELECT 
    *
FROM ak_Users u 
LEFT OUTER JOIN ak_UserPurchases up
ON u.Id = up.UserId;
