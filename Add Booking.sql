-- Use the specific database
USE littlelemon;

-- Start a new transaction
START TRANSACTION;

-- Insert the data into the booking table
INSERT INTO booking (BookingID, BookingDate, TableNumber, CustomerID)
VALUES 
(30000, '2024-07-06', 1, 'OQA-AAT-676'),
(30001, '2024-07-06', 2, 'QAK-YEA-563'),
(30002, '2024-07-06', 3, 'YPI-NZO-577'),
(30003, '2024-07-06', 4, 'PGY-RGH-750');

-- Commit the transaction to save the changes
COMMIT;

-- Display a confirmation message
SELECT 'Data was successfully inserted' AS Message;

-- Return a summary of the inserted rows
SELECT * FROM booking WHERE BookingID IN (30000, 30001, 30002, 30003);
