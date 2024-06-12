use challenges;
create table if not exists icc_T20_2024 (
    match_no int primary key,
    team1 varchar(50),
    team2 varchar(50),
    winner varchar(50),
    grp char(1)
);

insert into icc_T20_2024 (match_no, team1, team2, winner, grp) values 
(1, 'USA', 'Canada', 'USA', 'A'),
(2, 'West Indies', 'Papua New Guinea', 'West Indies', 'C'),
(3, 'Namibia', 'Oman', 'Namibia', 'B'),
(4, 'Sri Lanka', 'South Africa', 'South Africa', 'D'),
(5, 'Afghanistan', 'Uganda', 'Afghanistan', 'C'),
(6, 'England', 'Scotland', 'Draw', 'B'),
(7, 'Netherlands', 'Nepal', 'Netherlands', 'D'),
(8, 'India', 'Ireland', 'India', 'A'),
(9, 'Uganda', 'Papua New Guinea', 'Uganda', 'C'),
(10, 'Australia', 'Oman', 'Australia', 'B'),
(11, 'USA', 'Pakistan', 'USA', 'A'),
(12, 'Scotland', 'Namibia', 'Scotland', 'B'),
(13, 'Canada', 'Ireland', 'Canada', 'A'),
(14, 'Afghanistan', 'New Zealand', 'Afghanistan', 'C'),
(15, 'Bangladesh', 'Sri Lanka', 'Bangladesh', 'D'),
(16, 'South Africa', 'Netherlands', 'South Africa', 'D'),
(17, 'Australia', 'England', 'Australia', 'B'),
(18, 'West Indies', 'Uganda', 'West Indies', 'C'),
(19, 'India', 'Pakistan', 'India', 'A'),
(20, 'Scotland', 'Oman', 'Scotland', 'B'),
(21, 'South Africa', 'Bangladesh', 'South Africa', 'D'),
(22, 'Canada', 'Pakistan', 'Pakistan', 'A'),
(23, 'Nepal', 'Sri Lanka', 'Draw', 'D'),
(24, 'Namibia', 'Australia', 'Australia', 'B');