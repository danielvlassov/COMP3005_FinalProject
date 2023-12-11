-- 1. Members that have upcoming personal training sessions
SELECT m.name, m.email, pts.scheduledTime
FROM members m
JOIN personalTrainingSessions pts ON m.memberId = pts.memberId
WHERE pts.scheduledTime > CURRENT_TIMESTAMP;

-- 2. Add a new fitness class
INSERT INTO fitnessClasses (className, trainerId, schedule, maxCapacity)
VALUES ('Food & Fun', 3, '2023-12-20 07:00:00', 10);

-- 3. Update a members email
UPDATE members
SET email = 'alex.r.new@fancymail.com'
WHERE name = 'Alex Rivera';

-- 4. Fitness classes with availible slots
SELECT fc.className, fc.schedule, (fc.maxCapacity - COUNT(cr.classId)) AS availableSlots
FROM fitnessClasses fc
LEFT JOIN classRegistrations cr ON fc.classId = cr.classId
GROUP BY fc.classId, fc.className, fc.schedule, fc.maxCapacity
HAVING (fc.maxCapacity - COUNT(cr.classId)) > 0;

-- 5. Register a member for a fitness class
INSERT INTO classRegistrations (memberId, classId, registrationDate, status)
VALUES (1, 2, CURRENT_DATE, 'Confirmed');

-- 6. Update Equipment Maintenance Date
UPDATE equipment
SET maintenanceDate = CURRENT_DATE
WHERE equipmentName = 'Treadmill';

-- 7. List of all active trainers
SELECT name, specialization
FROM trainers;

-- 8. Change status of fitness goal
UPDATE fitnessGoals
SET status = 'Achieved'
WHERE memberId = 5 AND goalDescription LIKE 'Run to my job%';

-- 9. Members and their loyalty points
SELECT m.name, lp.points
FROM members m
JOIN loyaltyPoints lp ON m.memberId = lp.memberId;

-- 10. Add new health metric for a member
INSERT INTO healthMetrics (memberId, metricName, value, dateRecorded)
VALUES (2, 'Heart Rate', '75 bpm', CURRENT_DATE);

