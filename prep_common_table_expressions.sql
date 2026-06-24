WITH EmployeeHierarchy AS
(
    SELECT
        EmployeeID,
        FirstName,
        LastName,
        Title,
        ReportsTo,
        0 AS HierarchyLevel,
        CAST(FirstName + ' ' + LastName AS varchar(max)) AS HierarchyPath
    FROM Employees
    WHERE ReportsTo IS NULL

    UNION ALL

    SELECT
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        e.Title,
        e.ReportsTo,
        eh.HierarchyLevel + 1,
        CAST(eh.HierarchyPath + ' > ' + e.FirstName + ' ' + e.LastName AS varchar(max))
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh
        ON e.ReportsTo = eh.EmployeeID
)
SELECT
    EmployeeID,
    REPLICATE('    ', HierarchyLevel) + FirstName + ' ' + LastName AS EmployeeName,
    Title,
    ReportsTo,
    HierarchyLevel,
    HierarchyPath
FROM EmployeeHierarchy
ORDER BY HierarchyPath;

