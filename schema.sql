CREATE DATABASE IF NOT EXISTS RailwayReservation;
USE RailwayReservation;

CREATE TABLE Stations (
    StationID INT PRIMARY KEY AUTO_INCREMENT,
    StationName VARCHAR(100) NOT NULL,
    StationCode VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE Trains (
    TrainNumber INT PRIMARY KEY,
    TrainName VARCHAR(100) NOT NULL,
    SourceStationID INT,
    DestStationID INT,
    TotalSeats INT DEFAULT 100,
    FOREIGN KEY (SourceStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (DestStationID) REFERENCES Stations(StationID)
);

CREATE TABLE Routes (
    RouteID INT PRIMARY KEY AUTO_INCREMENT,
    TrainNumber INT,
    StationID INT,
    ArrivalTime TIME,
    DepartureTime TIME,
    StopOrder INT,
    FOREIGN KEY (TrainNumber) REFERENCES Trains(TrainNumber),
    FOREIGN KEY (StationID) REFERENCES Stations(StationID)
);

CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Phone VARCHAR(15)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    TrainNumber INT,
    TravelDate DATE NOT NULL,
    SeatNumber VARCHAR(10),
    SeatClass VARCHAR(20),
    Status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (TrainNumber) REFERENCES Trains(TrainNumber)
);

CREATE TABLE SeatAvailability (
    TrainNumber INT,
    TravelDate DATE,
    SeatsRemaining INT,
    PRIMARY KEY (TrainNumber, TravelDate),
    FOREIGN KEY (TrainNumber) REFERENCES Trains(TrainNumber)
);
