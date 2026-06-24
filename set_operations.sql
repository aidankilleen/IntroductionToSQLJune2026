-- set_operations.sql

-- list operations and list comparisions

SELECT CompanyName, ContactName, City, 'Customer' AS CompanyType FROM Customers
UNION 
SELECT CompanyName, ContactName, City, 'Supplier' FROM Suppliers;



SELECT * INTO ak_UsersArchive FROM ak_Users;

SELECT * FROM ak_Users
UNION
SELECT * FROM ak_UsersArchive;

DELETE FROM ak_UsersArchive WHERE Active = 0;

INSERT INTO ak_UsersArchive
(Name, Email, Active)
VALUES('Yvonne', 'yvonne@gmail.com', 1), 
('Wendy', 'wendy@gmail.com', 0);

-- find items that are in both tables (Intersection)
SELECT 
    u.Id, u.Name, u.Email, u.Active 
FROM ak_Users u 
INNER JOIN ak_UsersArchive ua 
ON u.Id = ua.Id;

-- find items that are in ak_Users but not in ak_UsersArchive (Difference)
SELECT 
    u.Id, u.Name, u.Email, u.Active
FROM ak_Users u 
LEFT OUTER JOIN ak_UsersArchive ua 
ON u.Id = ua.Id
WHERE ua.Id IS NULL;

-- find items that are in ak_UsersArchive but not in ak_Users (Difference)
-- you could just swap the tables or use a RIGHT OUTER JOIN instead
SELECT 
    ua.Id, ua.Name, ua.Email, ua.Active
FROM ak_Users u 
RIGHT OUTER JOIN ak_UsersArchive ua 
ON u.Id = ua.Id
WHERE u.Id IS NULL;


-- items that are only in one of the two sets (symmetric product)
-- union of the two differences:
SELECT 
    u.Id, u.Name, u.Email, u.Active, 1 AS List
FROM ak_Users u 
LEFT OUTER JOIN ak_UsersArchive ua 
ON u.Id = ua.Id
WHERE ua.Id IS NULL
UNION
SELECT 
    ua.Id, ua.Name, ua.Email, ua.Active, 2 AS List
FROM ak_Users u 
RIGHT OUTER JOIN ak_UsersArchive ua 
ON u.Id = ua.Id
WHERE u.Id IS NULL;

-- find items that are in ak_UsersArchive but not in ak_Users (Difference)
-- you could just swap the tables or use a RIGHT OUTER JOIN instead


-- finding duplicates
INSERT INTO ak_Users
(Name, Email, Active)
VALUES
('Bobby', 'bob@gmail.com', 1), 
('Daniel', 'dan@gmail.com', 0);


SELECT * FROM ak_Users;

-- find the records that have duplicate email addresses
SELECT * FROM ak_Users
WHERE Email IN (
    SELECT 
        Email
    FROM ak_Users 
    GROUP BY Email
    HAVING COUNT(Email) > 1
)
ORDER BY Email;

-- finding items that have changed

SELECT * FROM ak_Users
UNION
SELECT * FROM ak_UsersArchive;

UPDATE ak_UsersArchive
SET Active = 0
WHERE Id = 16;

-- Exercise - 9.53
-- devise a query to find the records that are in both tables
-- but are different.

SELECT 
    * 
FROM ak_Users u 
INNER JOIN ak_UsersArchive ua 
ON u.Id = ua.Id
WHERE 
u.Name <> ua.Name 
OR u.Email <> ua.Email 
OR u.Active <> ua.Active;





