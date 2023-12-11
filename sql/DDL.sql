-- DDL
-- Will drop the tables if they exist for testing purposes
DROP TABLE IF EXISTS fitnessGoals, healthMetrics, loyaltyPoints, billing, equipment, classRegistrations, personalTrainingSessions, fitnessClasses, admins, trainers, members CASCADE;

CREATE TABLE members (
    memberId SERIAL PRIMARY KEY,
    name VARCHAR(64),
    email VARCHAR(100) UNIQUE,
    dateOfBirth DATE
);

CREATE TABLE trainers (
    trainerId SERIAL PRIMARY KEY,
    name VARCHAR(64),
    specialization VARCHAR(100)
);

CREATE TABLE admins (
    adminId SERIAL PRIMARY KEY,
    name VARCHAR(64),
    role VARCHAR(50)
);

CREATE TABLE fitnessClasses (
    classId SERIAL PRIMARY KEY,
    className VARCHAR(64),
    trainerId INT REFERENCES trainers(trainerId) ON DELETE CASCADE,
    schedule TIMESTAMP,
    maxCapacity INT
);

CREATE TABLE personalTrainingSessions (
    sessionId SERIAL PRIMARY KEY,
    memberId INT REFERENCES members(memberId) ON DELETE CASCADE,
    trainerId INT REFERENCES trainers(trainerId) ON DELETE CASCADE,
    scheduledTime TIMESTAMP,
    status VARCHAR(32)
);

CREATE TABLE classRegistrations (
    registrationId SERIAL PRIMARY KEY,
    memberId INT REFERENCES members(memberId) ON DELETE CASCADE,
    classId INT REFERENCES fitnessClasses(classId) ON DELETE CASCADE,
    registrationDate DATE,
    status VARCHAR(32)
);

CREATE TABLE equipment (
    equipmentId SERIAL PRIMARY KEY,
    equipmentName VARCHAR(32),
    maintenanceDate DATE
);

CREATE TABLE billing (
    billingId SERIAL PRIMARY KEY,
    memberId INT REFERENCES members(memberId) ON DELETE CASCADE,
    amount DECIMAL(10, 2),
    billingDate DATE,
    paymentMethod VARCHAR(32)
);

CREATE TABLE loyaltyPoints (
    pointsId SERIAL PRIMARY KEY,
    memberId INT REFERENCES members(memberId) ON DELETE CASCADE,
    points INT
);

CREATE TABLE healthMetrics (
    metricId SERIAL PRIMARY KEY,
    memberId INT REFERENCES members(memberId) ON DELETE CASCADE,
    metricName VARCHAR(100),
    value VARCHAR(50),
    dateRecorded DATE
);

CREATE TABLE fitnessGoals (
    goalId SERIAL PRIMARY KEY,
    memberId INT REFERENCES members(memberId) ON DELETE CASCADE,
    goalDescription VARCHAR(255),
    targetDate DATE,
    status VARCHAR(50)
);
