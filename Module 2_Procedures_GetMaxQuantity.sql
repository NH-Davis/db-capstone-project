-- Switch to the littlelemon schema
USE littlelemon;

-- Create the GetMaxQuantity procedure
DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity
    FROM Orders;
END //

DELIMITER ;

-- Call the GetMaxQuantity procedure
CALL GetMaxQuantity();
