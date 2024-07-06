-- Switch to the littlelemon schema
USE littlelemon;

-- Prepare the statement GetOrderDetail
PREPARE GetOrderDetail FROM 
'SELECT o.OrderID, o.Quantity, o.Cost
 FROM orders o
 JOIN booking b ON o.BookingID = b.BookingID
 WHERE b.CustomerID = ?';

-- Declare a variable and assign a value
SET @CustomerID = 'OQA-AAT-676';

-- Execute the prepared statement with the variable
EXECUTE GetOrderDetail USING @CustomerID;

-- Optional: Deallocate the prepared statement
DEALLOCATE PREPARE GetOrderDetail;
