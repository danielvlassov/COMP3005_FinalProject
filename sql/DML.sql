-- DML

INSERT INTO members (name, email, dateOfBirth) VALUES
('Alex Rivera', 'alex.rivera@test.com', '2003-04-16'),
('Sam Patil', 'sam.patil@test.com', '2000-07-23'),
('Jordan Lee', 'jordan.lee@test.com', '1999-10-12'),
('Big Bill', 'big.boss.bill@test.com', '1966-01-02'),
('Taylor Morgan', 'taylor.morgan@test.com', '1997-01-19');


INSERT INTO trainers (name, specialization) VALUES
('Chris Parker', 'Personal Trainer'),
('Jamie Smith', 'Weightlifting Goat'),
('Robin Casey', 'Nutritional Coach');


INSERT INTO admins (name, role) VALUES
('Pat Jordan', 'Facility Manager'),
('Drew Casey', 'Front Desk Co-op');


INSERT INTO fitnessClasses (className, trainerId, schedule, maxCapacity) VALUES
('Leg day', 1, '2023-12-11 05:15:00', 3),
('Get your new PR', 2, '2023-12-29 18:00:00', 5);


INSERT INTO personalTrainingSessions (memberId, trainerId, scheduledTime, status) VALUES
(1, 2, '2023-12-16 10:00:00', 'Scheduled'),
(3, 2, '2023-12-17 11:00:00', 'Scheduled');

INSERT INTO classRegistrations (memberId, classId, registrationDate, status) VALUES
(2, 1, '2023-12-10', 'Confirmed'),
(4, 2, '2023-12-11', 'Confirmed');


INSERT INTO equipment (equipmentName, maintenanceDate) VALUES
('Treadmill', '2022-11-01'),
('Bench Press', '2021-05-15');


INSERT INTO billing (memberId, amount, billingDate, paymentMethod) VALUES
(5, 50.00, '2023-12-01', 'Credit Card'),
(4, 75.00, '2023-12-05', 'Cash');


INSERT INTO loyaltyPoints (memberId, points) VALUES
(2, 150),
(3, 200);


INSERT INTO healthMetrics (memberId, metricName, value, dateRecorded) VALUES
(4, 'Weight', '100kg', '2023-12-07'),
(1, 'BMI', '22', '2023-12-08');


INSERT INTO fitnessGoals (memberId, goalDescription, targetDate, status) VALUES
(5, 'Run to my job in under 30 minutes', '2024-05-01', 'In Progress'),
(2, 'Get my new PR', '2024-06-15', 'Not Started');