-- Use the specific database
USE littlelemon;

-- Drop the procedure if it already exists to avoid conflicts
DROP PROCEDURE IF EXISTS AddValidBooking;

-- Create the stored procedure
DELIMITER //

CREATE PROCEDURE AddValidBooking(IN BookingDate DATE, IN TableNum INT, IN CustomerID VARCHAR(255))
BEGIN
    DECLARE table_count INT;
    
    -- Start a new transaction
    START TRANSACTION;
    
    -- Check if the table is already booked for the specified date
    SELECT COUNT(*) INTO table_count
    FROM booking
    WHERE BookingDate = BookingDate AND TableNum = TableNum;
    
    -- If the table is booked, rollback the transaction and return a message
    IF table_count > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', TableNum, ' is already booked, booking cancelled') AS Message;
    ELSE
        -- If the table is available, insert the booking and commit the transaction
        INSERT INTO booking (BookingDate, TableNum, CustomerID)
        VALUES (BookingDate, TableNum, CustomerID);
        COMMIT;
        SELECT 'This booking has been accepted' AS Message;
    END IF;
END //

DELIMITER ;
