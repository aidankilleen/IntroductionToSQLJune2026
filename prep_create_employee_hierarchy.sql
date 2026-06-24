INSERT INTO Employees
(
    LastName,
    FirstName,
    Title,
    TitleOfCourtesy,
    BirthDate,
    HireDate,
    Address,
    City,
    Region,
    PostalCode,
    Country,
    HomePhone,
    Extension,
    Notes,
    ReportsTo
)
VALUES
-- Reports to Andrew Fuller, EmployeeID 2
('Murphy', 'Grace', 'Sales Manager', 'Ms.', '1982-04-12', '2020-01-15',
 '1 Main Street', 'Dublin', NULL, 'D01 ABC', 'Ireland', '(01) 555-1001', '101',
 'Additional manager for hierarchy testing.', 2),

-- Reports to Grace Murphy
('Kelly', 'Sean', 'Sales Representative', 'Mr.', '1990-09-03', '2021-03-10',
 '2 Main Street', 'Cork', NULL, 'T12 XYZ', 'Ireland', '(021) 555-1002', '102',
 'Reports to Grace Murphy.', SCOPE_IDENTITY());