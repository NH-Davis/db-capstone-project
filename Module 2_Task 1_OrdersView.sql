-- Switch to the littlelemon schema
USE littlelemon;

-- Create the OrdersView
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, Cost
FROM Orders
WHERE Quantity > 2;

-- Query the OrdersView to verify its contents
SELECT * FROM OrdersView;
