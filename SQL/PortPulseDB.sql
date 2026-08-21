CREATE DATABASE PortPulseDB;
USE PortPulseDB;

CREATE TABLE dim_container (
    Container_ID VARCHAR(50),
    Container_Type VARCHAR(50),
    Size VARCHAR(10),
    Cargo_Category VARCHAR(50),
    Import_Export VARCHAR(50),
    Cargo_Weight_Tons DECIMAL(10,2),
    Hazardous VARCHAR(5)
);

CREATE TABLE dim_date (
    Date_Record_ID VARCHAR(50),
    Date_Time DATETIME,
    Date DATE,
    Day INT,
    month INT,
    Month_Name VARCHAR(50),
    Quarter VARCHAR(10),
    Year INT,
    Weekday VARCHAR(50)
);

CREATE TABLE dim_port (
    Port_Record_ID VARCHAR(25),
    Port_ID VARCHAR(25),
    Port_Name VARCHAR(25),
    Country VARCHAR(25),
    Region VARCHAR(25),
    Terminal VARCHAR(25),
    Berth VARCHAR(25)
);

CREATE TABLE dim_ship (
    Ship_Record_ID VARCHAR(20),
    Ship_ID VARCHAR(20),
    Ship_Name VARCHAR(20),
    Shipping_Line VARCHAR(50),
    Ship_Type VARCHAR(50),
    TEU_Capacity INT,
    Flag VARCHAR(20)
);

CREATE TABLE fact_container_movement (
    Movement_ID VARCHAR(20),
    Date_Record_ID VARCHAR(20),
    Port_Record_ID VARCHAR(20),
    Ship_Record_ID VARCHAR(20),
    Container_ID VARCHAR(20),
    Movement_Type VARCHAR(20),
    Status VARCHAR(20),
    Movement_Time_Min INT,
    Dwell_Time_Hours DECIMAL(10,2),
    Customs_Delay_Hours INT
);

CREATE TABLE fact_crane_operation (
    Crane_Operation_ID VARCHAR(20),
    Date_Record_ID VARCHAR(20),
    Port_Record_ID VARCHAR(20),
    Ship_Record_ID VARCHAR(20),
    Crane_ID VARCHAR(20),
    Crane_Type VARCHAR(20),
    Operating_Hours DECIMAL(10,2),
    Downtime_Hours DECIMAL(10,2),
    Containers_Handled INT,
    Maintenance_Status VARCHAR(30)
);

CREATE TABLE fact_truck_movement (
    Truck_Movement_ID VARCHAR(20),
    Date_Record_ID VARCHAR(20),
    Port_Record_ID VARCHAR(20),
    Container_ID VARCHAR(20),
    Gate_ID VARCHAR(20),
    Truck_Type VARCHAR(50),
    Arrival_Hour INT,
    Waiting_Minutes INT,
    Processing_Minutes INT,
    Gate_Status VARCHAR(20)
);

CREATE TABLE fact_yard_utilization (
    Yard_Record_ID VARCHAR(20),
    Date_Record_ID VARCHAR(20),
    Port_Record_ID VARCHAR(20),
    Yard_ID VARCHAR(20),
    Capacity_TEUs INT,
    Occupied_TEUs INT,
    Available_TEUs INT,
    Utilization_Percentage DECIMAL(10,2),
    Inbound_Containers INT,
    Outbound_Containers INT,
    Long_Stay_Containers INT
);

SHOW TABLES;

SHOW CREATE TABLE dim_container;
SHOW CREATE TABLE dim_date;
SHOW CREATE TABLE dim_port;
SHOW CREATE TABLE dim_ship;
SHOW CREATE TABLE fact_container_movement;
SHOW CREATE TABLE fact_crane_operation;
SHOW CREATE TABLE fact_truck_movement;
SHOW CREATE TABLE fact_yard_utilization;

SELECT * FROM PortPulseDB.dim_container;
SELECT * FROM PortPulseDB.dim_date;
SELECT * FROM PortPulseDB.dim_port;
SELECT * FROM PortPulseDB.dim_ship;
SELECT * FROM PortPulseDB.fact_container_movement;
SELECT * FROM PortPulseDB.fact_crane_operation;
SELECT * FROM PortPulseDB.fact_truck_movement;
SELECT * FROM PortPulseDB.fact_yard_utilization;

USE PortPulseDB;

SELECT 'dim_container' AS table_name, COUNT(*) AS row_count FROM dim_container
UNION ALL
SELECT 'dim_date', COUNT(*) FROM dim_date
UNION ALL
SELECT 'dim_port', COUNT(*) FROM dim_port
UNION ALL
SELECT 'dim_ship', COUNT(*) FROM dim_ship
UNION ALL
SELECT 'fact_container_movement', COUNT(*) FROM fact_container_movement
UNION ALL
SELECT 'fact_crane_operation', COUNT(*) FROM fact_crane_operation
UNION ALL
SELECT 'fact_truck_movement', COUNT(*) FROM fact_truck_movement
UNION ALL
SELECT 'fact_yard_utilization', COUNT(*) FROM fact_yard_utilization;
