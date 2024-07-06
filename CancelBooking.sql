-- Use the specific database
USE littlelemon;

-- Drop the procedure if it already exists to avoid conflicts
DROP PROCEDURE IF EXISTS CancelBooking;

-- Create the stored procedure
DELIMITER //

CREATE PROCEDURE CancelBooking(IN p_BookingID INT)
BEGIN
    -- Start a transaction
    START TRANSACTION;

    -- Delete the booking for the specified booking ID
    DELETE FROM booking
    WHERE BookingID = p_BookingID;

    -- Check if the delete was successful
    IF ROW_COUNT() > 0 THEN
        -- Commit the transaction
        COMMIT;
        -- Display a confirmation message
        SELECT CONCAT('Booking ', p_BookingID, ' has been cancelled as requested') AS Message;
    ELSE
        -- Rollback the transaction
        ROLLBACK;
        -- Display an error message
        SELECT CONCAT('Booking ', p_BookingID, ' does not exist') AS Message;
    END IF;
END //

DELIMITER ;
