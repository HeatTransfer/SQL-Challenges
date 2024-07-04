-- Loan Table
CREATE TABLE Loans (
 LoanID INT,
 CustomerID INT,
 LoanAmount DECIMAL(10, 2),
 LoanType VARCHAR(50),
 DefaultStatus VARCHAR(10),
 LoanDate DATE
);
 
INSERT INTO Loans (LoanID, CustomerID, LoanAmount, LoanType, DefaultStatus, LoanDate) VALUES
(1, 201, 10000.00, 'Personal', 'No', '2023-01-15'),
(2, 202, 5000.00, 'Auto', 'Yes', '2023-02-10'),
(3, 203, 15000.00, 'Home', 'No', '2023-03-20'),
(4, 204, 7000.00, 'Personal', 'No', '2023-04-25'),
(5, 205, 12000.00, 'Auto', 'Yes', '2023-05-30'),
(6, 206, 3000.00, 'Education', 'No', '2023-06-05'),
(7, 207, 8000.00, 'Personal', 'No', '2023-07-15'),
(8, 208, 4000.00, 'Auto', 'Yes', '2023-08-20'),
(9, 209, 25000.00, 'Home', 'No', '2023-09-10'),
(10, 210, 6000.00, 'Personal', 'No', '2023-10-05');
 
-- Customers Table
CREATE TABLE Customers (
 CustomerID INT,
 CustomerName VARCHAR(100),
 Age INT,
 JoinDate DATE
);

INSERT INTO Customers (CustomerID, CustomerName, Age, JoinDate) VALUES
(201, 'Alice Green', 28, '2020-01-01'),
(202, 'Bob White', 35, '2021-03-15'),
(203, 'Carol Black', 45, '2019-11-20'),
(204, 'David Brown', 52, '2022-05-30'),
(205, 'Eve Johnson', 30, '2023-01-25'),
(206, 'Frank Smith', 40, '2023-02-20'),
(207, 'Grace Lee', 33, '2020-07-18'),
(208, 'Hank Adams', 60, '2021-11-05'),
(209, 'Ivy Clark', 38, '2023-03-30'),
(210, 'Jack Wilson', 27, '2022-08-14');