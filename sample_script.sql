-- create a user record with an associated purchase

INSERT INTO ak_Users
(Name, Email, Active)
VALUES('Zoe', 'zoe@gmail.com', 1);

INSERT INTO ak_UserPurchases
(UserId, PurchaseDate, Amount)
VALUES(
    (SELECT TOP 1 Id From ak_Users WHERE Name='Zoe'), 
    GETDATE(), 
    1.99
);

