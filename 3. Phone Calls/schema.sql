CREATE TABLE phone_records_1 (
    phone_number VARCHAR(20),
    start_time DATETIME
);

INSERT INTO phone_records_1 (phone_number, start_time)
VALUES
    ('PN1', '2022-01-01 10:20:00'),
    ('PN1', '2022-01-01 16:25:00'),
    ('PN2', '2022-01-01 12:30:00'),
    ('PN3', '2022-01-01 10:00:00'),
    ('PN3', '2022-01-01 12:30:00'),
    ('PN3', '2022-01-01 09:20:00');

-- TABLE 2
CREATE TABLE phone_records_2 (
    phone_number VARCHAR(20),
    end_time DATETIME
);

INSERT INTO phone_records_2 (phone_number, end_time)
VALUES
    ('PN1', '2022-01-01 10:45:00'),
    ('PN1', '2022-01-01 17:05:00'),
    ('PN2', '2022-01-01 12:55:00'),
    ('PN3', '2022-01-01 10:20:00'),
    ('PN3', '2022-01-01 12:50:00'),
    ('PN3', '2022-01-01 09:40:00');