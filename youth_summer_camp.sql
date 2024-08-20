
-- Task 1: Create Database Model
CREATE TEMPORARY TABLE Participants (
    ParticipantID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Email VARCHAR(100),
    PersonalPhone VARCHAR(15)
);

CREATE TEMPORARY TABLE Camps (
    CampID INT PRIMARY KEY AUTO_INCREMENT,
    CampTitle VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Price DECIMAL(10, 2),
    Capacity INT
);

CREATE TEMPORARY TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    ParticipantID INT,
    CampID INT,
    AttendanceDate DATE,
    FOREIGN KEY (ParticipantID) REFERENCES Participants(ParticipantID),
    FOREIGN KEY (CampID) REFERENCES Camps(CampID)
);

-- Task 2: Populate Participants Table with Random Data
DECLARE @TotalParticipants INT = 5000;
DECLARE @InsertedCount INT = 0;
DECLARE @GenderRatio FLOAT;
DECLARE @Age INT;

WHILE @InsertedCount < @TotalParticipants
BEGIN
    SET @GenderRatio = RAND();
    IF @GenderRatio <= 0.65
        BEGIN
            SET @Age = CASE 
                            WHEN RAND() <= 0.18 THEN FLOOR(RAND() * 6) + 7 
                            WHEN RAND() <= 0.27 THEN FLOOR(RAND() * 2) + 13 
                            WHEN RAND() <= 0.20 THEN FLOOR(RAND() * 3) + 15 
                            ELSE FLOOR(RAND() * 13) + 7 
                        END;
            INSERT INTO Participants (FirstName, MiddleName, LastName, Gender, Age, Email, PersonalPhone)
            VALUES ('First', 'Middle', 'Last', 'Female', @Age, 'email@example.com', '1234567890');
        END
    ELSE
        BEGIN
            SET @Age = CASE 
                            WHEN RAND() <= 0.18 THEN FLOOR(RAND() * 6) + 7 
                            WHEN RAND() <= 0.27 THEN FLOOR(RAND() * 2) + 13 
                            WHEN RAND() <= 0.20 THEN FLOOR(RAND() * 3) + 15 
                            ELSE FLOOR(RAND() * 13) + 7 
                        END;
            INSERT INTO Participants (FirstName, MiddleName, LastName, Gender, Age, Email, PersonalPhone)
            VALUES ('First', 'Middle', 'Last', 'Male', @Age, 'email@example.com', '1234567890');
        END

    SET @InsertedCount = @InsertedCount + 1;
END

-- Task 3: Query for Gender Distribution Across Generations
SELECT 
    CASE 
        WHEN Age BETWEEN 41 AND 56 THEN 'Gen X'
        WHEN Age BETWEEN 25 AND 40 THEN 'Millennials'
        WHEN Age BETWEEN 9 AND 24 THEN 'Gen Z'
        WHEN Age BETWEEN 0 AND 8 THEN 'Gen Alpha'
    END AS Generation,
    Gender,
    COUNT(*) AS Count
FROM Participants
GROUP BY Generation, Gender
ORDER BY Generation, Gender;
