DELIMITER //

CREATE TRIGGER AfterBookingInsert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE SeatAvailability 
    SET SeatsRemaining = SeatsRemaining - 1
    WHERE TrainNumber = NEW.TrainNumber 
    AND TravelDate = NEW.TravelDate;
END //

CREATE TRIGGER AfterBookingUpdate
AFTER UPDATE ON Bookings
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Cancelled' AND OLD.Status = 'Confirmed' THEN
        UPDATE SeatAvailability 
        SET SeatsRemaining = SeatsRemaining + 1
        WHERE TrainNumber = NEW.TrainNumber 
        AND TravelDate = NEW.TravelDate;
    END IF;
END //

DELIMITER ;
