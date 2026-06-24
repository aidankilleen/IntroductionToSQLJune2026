-- transactions_investigation.sql

-- transactions all us to have all the statements run or none of them
BEGIN TRANSACTION

INSERT INTO ak_Users
(Name, Email, Active)
VALUES('Ger', 'ger@gmail.com', 1);

INSERT INTO ak_UsersArchive
(Name, Email, Active)
VALUES('Ger', 'fred@gmail.com', 1);

COMMIT TRANSACTION;


--UPDATE ak_UsersArchive
--SET Email = 'ger@gmail.com'
--WHERE Id = 23;