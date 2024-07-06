-- Use the specific database
USE littlelemon;

-- Drop the procedure if it already exists to avoid errors
DROP PROCEDURE IF EXISTS CheckBooking;

-- Create the stored procedure
DELIMITER //

CREATE PROCEDURE CheckBooking(IN BookingDate DATE, IN TableNum INT)
BEGIN
    DECLARE table_count INT;
    
    -- Check if the table is already booked for the specified date
    SELECT COUNT(*) INTO table_count
    FROM booking
    WHERE BookingDate = BookingDate AND TableNum = TableNum;
    
    -- If the table is booked, return a message
    IF table_count > 0 THEN
        SELECT 'This table is already booked' AS Message;
    ELSE
        -- If the table is available, return a message
        SELECT 'This table is available' AS Message;
    END IF;
END //

DELIMITER ;
