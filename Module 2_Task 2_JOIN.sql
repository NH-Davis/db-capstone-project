-- Switch to the littlelemon schema
USE littlelemon;

-- Extract the required information using JOIN clauses
SELECT 
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.Cost,
    m.Cuisine AS MenuName,
    m.Main AS CourseName,
    m.Starter AS StarterName
FROM 
    customer c
JOIN 
    booking b ON c.CustomerID = b.CustomerID
JOIN 
    orders o ON b.BookingID = o.BookingID
JOIN 
    menu m ON o.MenuID = m.MenuID
WHERE 
    o.Cost > 150
ORDER BY 
    o.Cost ASC;
