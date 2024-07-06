-- Switch to the littlelemon schema
USE littlelemon;

-- Select menu items with more than 2 orders
SELECT m.Cuisine AS MenuName
FROM menu m
WHERE m.MenuID = ANY (
    SELECT o.MenuID
    FROM orders o
    WHERE o.Quantity > 2
);
