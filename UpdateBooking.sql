-- Use the specific database
USE littlelemon;

-- Drop the procedure if it already exists to avoid conflicts
DROP PROCEDURE IF EXISTS UpdateBooking;

-- Create the stored procedure
DELIMITER //

CREATE PROCEDURE UpdateBooking(IN p_BookingID INT, IN p_BookingDate DATE)
BEGIN
    -- Start a transaction
    START TRANSACTION;
    
    -- Update the booking date for the specified booking ID
    UPDATE booking
    SET BookingDate = p_BookingDate
    WHERE BookingID = p_BookingID;
    
    -- Check if the update was successful
    IF ROW_COUNT() > 0 THEN
        -- Commit the transaction
        COMMIT;
        -- Display a confirmation message
        SELECT CONCAT('Booking ID ', p_BookingID, ' has been updated to ', p_BookingDate) AS Message;
    ELSE
        -- Rollback the transaction
        ROLLBACK;
        -- Display an error message
        SELECT CONCAT('Booking ID ', p_BookingID, ' does not exist or no changes were made') AS Message;
    END IF;
END //

DELIMITER ;
