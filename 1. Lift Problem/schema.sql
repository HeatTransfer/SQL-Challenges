-- Create LIFT table
CREATE TABLE LIFT (
    ID INT PRIMARY KEY,
    CAPACITY_KG INT
);

-- Insert data into LIFT table
INSERT INTO LIFT (ID, CAPACITY_KG) VALUES 
(1, 300),
(2, 350);

-- Create LIFT_PASSENGERS table
CREATE TABLE LIFT_PASSENGERS (
    PASSENGER_NAME VARCHAR(50),
    WEIGHT_KG INT,
    LIFT_ID INT,
    FOREIGN KEY (LIFT_ID) REFERENCES LIFT(ID)
);

-- Insert data into LIFT_PASSENGERS table
INSERT INTO LIFT_PASSENGERS (PASSENGER_NAME, WEIGHT_KG, LIFT_ID) VALUES 
('Rahul', 85, 1),
('Adarsh', 73, 1),
('Riti', 95, 1),
('Dheeraj', 80, 1),
('Vimal', 83, 2),
('Neha', 77, 2),
('Priti', 73, 2),
('Himanshi', 85, 2);