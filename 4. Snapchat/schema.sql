use snapchat_db;

-- Create the activities table
CREATE TABLE activities (
    activity_id INT PRIMARY KEY,
    user_id INT,
    activity_type VARCHAR(10),
    time_spent DECIMAL(5, 2),
    activity_date DATETIME
);

-- Insert data into the activities table
INSERT INTO activities (activity_id, user_id, activity_type, time_spent, activity_date) VALUES
(7274, 123, 'open', 4.50, '2022-06-22 12:00:00'),
(2425, 123, 'send', 3.50, '2022-06-22 12:00:00'),
(1413, 456, 'send', 5.67, '2022-06-23 12:00:00'),
(1414, 789, 'chat', 11.00, '2022-06-25 12:00:00'),
(2536, 456, 'open', 3.00, '2022-06-25 12:00:00');

-- Create the age_breakdown table
CREATE TABLE age_breakdown (
    user_id INT PRIMARY KEY,
    age_bucket VARCHAR(10)
);

-- Insert data into the age_breakdown table
INSERT INTO age_breakdown (user_id, age_bucket) VALUES
(123, '31-35'),
(456, '26-30'),
(789, '21-25');
