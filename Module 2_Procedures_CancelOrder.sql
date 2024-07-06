-- Switch to the littlelemon schema
USE littlelemon;

-- Create the CancelOrder procedure
DELIMITER //

CREATE PROCEDURE CancelOrder(IN order_id VARCHAR(45))
BEGIN
    -- Delete the order based on the provided OrderID
    DELETE FROM orders WHERE OrderID = order_id;
    
    -- Return a confirmation message
    SELECT CONCAT('Order ', order_id, ' has been cancelled') AS message;
END //

DELIMITER ;
