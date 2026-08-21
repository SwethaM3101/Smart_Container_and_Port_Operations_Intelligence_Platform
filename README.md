# PortPulse Analytics – Smart Container & Port Operations Intelligence Platform

## Industry

**Port Operations / Maritime Logistics / Supply Chain**

---

## Project Overview

**PortPulse Analytics** is an end-to-end **Business Intelligence and Decision Intelligence platform** developed to analyze and monitor port and container operations.

The project uses **MySQL, SQL, Power Query, DAX, and Microsoft Power BI** to transform operational data into interactive dashboards and actionable business insights.

The platform analyzes container movements, yard utilization, crane operations, truck movements, shipping lines, vessels, and port performance to identify operational bottlenecks, capacity constraints, and high-risk areas.

The project follows a complete analytics workflow:

**MySQL Database → SQL Analysis → Power Query / ETL → Data Cleaning → Data Modeling → DAX Measures → Power BI Dashboards → Business Insights → Decision Intelligence**

---

## Business Areas Covered

* Container movement and throughput analysis
* Port and terminal performance
* Yard capacity and utilization monitoring
* Container dwell-time analysis
* Crane utilization and productivity
* Crane downtime monitoring
* Truck waiting and processing-time analysis
* Gate and terminal operations
* Shipping-line and vessel performance
* Operational risk and bottleneck identification
* Decision intelligence and operational recommendations

---

## Project Objectives

* Build a structured relational database for port operational data.
* Analyze container movement and throughput performance.
* Monitor container dwell time and identify long-stay containers.
* Evaluate yard capacity, occupancy, and utilization.
* Analyze crane productivity, operating hours, and downtime.
* Monitor truck waiting and processing times.
* Compare operational performance across ports, terminals, and shipping lines.
* Identify operational bottlenecks and high-risk areas.
* Develop an interactive 4-page Power BI dashboard.
* Convert operational analytics into actionable decision recommendations.
* Demonstrate an end-to-end Data Analyst workflow using SQL and Power BI.

---

## Problem Statement

Modern ports generate large volumes of operational data from containers, vessels, cranes, trucks, and yards.

Analyzing these operations manually makes it difficult to identify bottlenecks, capacity problems, delays, and operational risks quickly.

**PortPulse Analytics addresses the following business questions:**

* How many containers are being moved?
* Which ports and terminals have higher operational activity?
* Which shipping lines and ships contribute to container movements?
* What is the average container dwell time?
* Where are operational bottlenecks occurring?
* How efficiently are cranes operating?
* How much crane downtime is occurring?
* How long are trucks waiting at port gates?
* Which gates have higher waiting or processing times?
* How efficiently is yard capacity being utilized?
* Which yards have high utilization?
* How many long-stay containers are present?
* Which operational areas require attention?
* What actions should management take next?

---

# Tools & Technologies

| Tool / Technology | Purpose                                                     |
| ----------------- | ----------------------------------------------------------- |
| **MySQL**         | Database creation, table management, and data storage       |
| **SQL**           | Data cleaning, joins, aggregation, and operational analysis |
| **Power Query**   | ETL, transformation, and data preparation                   |
| **Power BI**      | Interactive dashboard and business intelligence             |
| **DAX**           | KPI calculations and analytical measures                    |
| **Excel / CSV**   | Dataset preparation and data documentation                  |
| **GitHub**        | Version control and portfolio publishing                    |

---

# Dataset Description

The PortPulse Analytics data model contains **8 tables** covering container, date, port, vessel, crane, truck, and yard operations.

## Dimension Tables

### `dim_container`

Contains container-level information.

**Key fields include:**

* `Container_ID`
* `Container_Type`
* `Size`
* `Cargo_Category`
* `Import_Export`
* `Cargo_Weight_Tons`
* `Hazardous`

### `dim_date`

Contains date and time attributes used for time-based analysis.

**Key fields include:**

* `Date_Record_ID`
* `Date_Time`
* `Date`
* `Day`
* `Month`
* `Month_Name`
* `Quarter`
* `Year`
* `Weekday`

### `dim_port`

Contains port, terminal, and berth information.

**Key fields include:**

* `Port_Record_ID`
* `Port_ID`
* `Port_Name`
* `Country`
* `Region`
* `Terminal`
* `Berth`

### `dim_ship`

Contains vessel and shipping-line information.

**Key fields include:**

* `Ship_Record_ID`
* `Ship_ID`
* `Ship_Name`
* `Shipping_Line`
* `Ship_Type`
* `TEU_Capacity`
* `Flag`

---

# Fact Tables

### `fact_container_movement`

Contains operational container movement records.

**Key fields include:**

* `Movement_ID`
* `Date_Record_ID`
* `Port_Record_ID`
* `Ship_Record_ID`
* `Container_ID`
* `Movement_Type`
* `Status`
* `Movement_Time_Min`
* `Dwell_Time_Hours`
* `Customs_Delay_Hours`

### `fact_crane_operation`

Contains crane performance and operational information.

**Key fields include:**

* `Crane_Operation_ID`
* `Date_Record_ID`
* `Port_Record_ID`
* `Ship_Record_ID`
* `Crane_ID`
* `Crane_Type`
* `Operating_Hours`
* `Downtime_Hours`
* `Containers_Handled`
* `Maintenance_Status`

### `fact_truck_movement`

Contains truck and gate operational information.

**Key fields include:**

* `Truck_Movement_ID`
* `Date_Record_ID`
* `Port_Record_ID`
* `Container_ID`
* `Gate_ID`
* `Truck_Type`
* `Arrival_Hour`
* `Waiting_Minutes`
* `Processing_Minutes`
* `Gate_Status`

### `fact_yard_utilization`

Contains yard capacity and utilization information.

**Key fields include:**

* `Yard_Record_ID`
* `Date_Record_ID`
* `Port_Record_ID`
* `Yard_ID`
* `Capacity_TEUs`
* `Occupied_TEUs`
* `Available_TEUs`
* `Utilization_Percentage`
* `Inbound_Containers`
* `Outbound_Containers`
* `Long_Stay_Containers`

---

# Database Design

The project uses a dimensional data model consisting of **4 dimension tables and 4 fact tables**.

```text
                         ┌──────────────────┐
                         │     dim_date     │
                         └────────┬─────────┘
                                  │
          ┌───────────────────────┼───────────────────────┐
          │                       │                       │
          ▼                       ▼                       ▼
 ┌────────────────┐      ┌────────────────┐      ┌────────────────┐
 │  dim_container │      │    dim_port    │      │    dim_ship    │
 └───────┬────────┘      └───────┬────────┘      └───────┬────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
               ┌─────────────────┼─────────────────┐
               │                 │                 │
               ▼                 ▼                 ▼
 ┌──────────────────────┐ ┌──────────────────┐ ┌─────────────────────┐
 │ fact_container_move. │ │ fact_crane_oper. │ │ fact_truck_movement │
 └──────────────────────┘ └──────────────────┘ └─────────────────────┘
                                 │
                                 ▼
                       ┌─────────────────────┐
                       │ fact_yard_utiliz.   │
                       └─────────────────────┘
```

The model allows operational information to be analyzed across:

**Containers → Ports → Ships → Cranes → Trucks → Yards**

---

# SQL Analysis

SQL was used for:

* Database creation
* Table creation
* Data validation
* Data cleaning
* Joins between operational tables
* Aggregation analysis
* KPI preparation
* Operational performance analysis
* Bottleneck identification

### Example Database Creation

```sql
CREATE DATABASE IF NOT EXISTS portpulse;

USE portpulse;
```

SQL analysis supports the Power BI reporting layer by preparing clean and structured operational data.

---

# ETL & Data Cleaning

**Power Query Editor** was used to prepare the datasets before dashboard development.

## Extract

Data was extracted from the MySQL database.

## Transform

The transformation process included:

* Checking column names
* Correcting data types
* Checking missing values
* Checking duplicate records
* Preparing date and time fields
* Validating categorical fields
* Preparing operational metrics
* Creating required classifications
* Preparing data for analysis

## Load

The transformed datasets were loaded into the Power BI data model.

---

# DAX Measures

A separate **Measures Table** was created in Power BI to organize the project's analytical measures.

## Container Operations

* Total Container Movements
* Average Movement Time
* Average Dwell Time
* Average Customs Delay

## Crane Operations

* Total Operating Hours
* Total Downtime Hours
* Total Containers Handled
* Crane Utilization %
* Crane Productivity

## Truck Operations

* Average Truck Waiting Time
* Average Processing Time
* Total Truck Movements
* Gate Performance

## Yard Operations

* Total Yard Capacity
* Occupied TEUs
* Available TEUs
* Yard Utilization %
* Long-Stay Containers

## Decision Intelligence

* Operational Risk Score
* Bottleneck Status
* High-Risk Operational Areas
* Recommended Action

---

# BI Dashboard Architecture

The executive presentation layer contains **4 dedicated Power BI dashboard pages**:

```text
Page 1 → Executive Overview

Page 2 → Container & Yard Intelligence

Page 3 → Crane & Truck Operations

Page 4 → Decision Intelligence
```

The dashboard progresses from:

**What is happening? → Where is the problem? → Why is it happening? → What should we do next?**

---

# Page 1 — Executive Overview

Provides a high-level view of overall port operational performance.

## KPIs

* Total Container Movements
* Average Dwell Days
* Yard Utilization %
* Crane Downtime Hours
* Container Throughput

## Visuals

* Container Throughput by Month
* Container Movements by Shipping Line
* Crane Downtime by Crane
* Average Yard Utilization by Yard

## Slicers

* Date
* Port
* Shipping Line
* Yard

---

# Page 2 — Container & Yard Intelligence

Focuses on container movement, dwell time, and yard capacity.

## KPIs

* Total Container Movements
* Import Containers
* Yard Utilization %
* Export Containers

## Visuals

* Yard Utilization Heatmap
* Container Movement Analysis
* Container Dwell Time by Yard
* Container Status Distribution
* Container Distribution by Shipping Line
* Container Type Distribution
* Yard-wise Container Distribution (TEUs)
* Yard Utilization %

## Slicers

* Date
* Port
* Shipping Line
* Container Type
* Yard

## Business Purpose

This page helps identify:

* Yard congestion
* Capacity constraints
* Container dwell-time problems
* High-utilization yards
* Long-stay container situations

---

# Page 3 — Crane & Truck Operations

Analyzes equipment productivity and gate operations.

## Crane KPIs

* Crane Downtime
* Crane Utilization %
* Crane Productivity

## Truck KPIs

* Average Movement Time
* Truck Movements

## Visuals

* Crane Utilization Gauge
* Crane Downtime Analysis
* Crane Productivity Trend
* Average Movement Time Trend
* Truck Gate Status
* Trucks Served by Terminal
* Crane Performance by Terminal

## Slicers

* Date
* Port
* Terminal

## Business Purpose

This page helps management identify:

* Equipment inefficiency
* Crane downtime
* Crane productivity issues
* Truck-gate congestion
* Terminal-level operational performance

---

# Page 4 — Decision Intelligence

The **Decision Intelligence page** is the strategic layer of the PortPulse Analytics platform.

Its core business question is:

> **"What should we do next?"**

Rather than only reporting historical performance, this page converts operational indicators into **risk signals, bottleneck alerts, and recommended actions**.

## KPIs

* Projected Throughput
* Crane Risk Score
* High-Risk Areas
* Recommended Actions

## Decision Intelligence Components

### Bottleneck Detection

Identifies operational areas requiring attention, including:

* High yard utilization
* Projected throughput pressure
* High crane risk score

### Risk Classification

Operational conditions are categorized as:

* Optimal
* High Risk

### Recommended Actions

Examples include:

* Prioritize high-risk yards.
* Improve yard capacity planning.
* Monitor crane performance.
* Prioritize operational bottlenecks.

---

# Key KPIs

| KPI                            | Business Purpose                                      |
| ------------------------------ | ----------------------------------------------------- |
| **Total Container Movements**  | Measures overall container throughput                 |
| **Average Dwell Days**         | Measures how long containers remain within operations |
| **Yard Utilization %**         | Measures available yard capacity and congestion       |
| **Crane Downtime Hours**       | Measures equipment availability problems              |
| **Average Truck Wait Minutes** | Measures gate congestion and truck delays             |
| **Crane Utilization %**        | Measures equipment utilization                        |
| **Long-Stay Containers**       | Identifies containers requiring operational attention |
| **Operational Risk Score**     | Summarizes major operational risk conditions          |

---

# Key Business Insights

The dashboard is designed to identify:

### 1. Port and Terminal Performance

Compare container activity and operational performance across ports and terminals.

### 2. Container Dwell-Time Risk

Identify locations where containers remain in the system for longer periods.

### 3. Yard Capacity Pressure

Detect yards approaching high utilization levels and potential congestion.

### 4. Crane Efficiency

Monitor crane productivity, operating hours, and downtime.

### 5. Truck-Gate Congestion

Identify gates with high truck waiting and processing times.

### 6. Shipping-Line Performance

Compare operational activity across shipping lines and vessels.

### 7. Operational Bottlenecks

Combine multiple KPIs to identify areas requiring management attention.

### 8. Actionable Decision Support

Convert operational patterns into prioritized recommendations through the Decision Intelligence page.

---

# Decision Intelligence

The major differentiating feature of **PortPulse Analytics** is its Decision Intelligence layer.

Traditional dashboards mainly answer:

> **"What happened?"**

PortPulse extends this analysis to:

> **"Where is the problem?"**

> **"What is causing the operational pressure?"**

> **"What should management do next?"**

### Example Decision Flow

```text
High Yard Utilization
          +
High Dwell Time
          ↓
Potential Yard Congestion
          ↓
       HIGH RISK
          ↓
Prioritize Yard Operations
          ↓
   Recommended Action
```

This makes the project more than a reporting dashboard — it demonstrates how a Data Analyst can convert operational data into **business decisions and actionable recommendations**.

---

# Project Workflow

```text
Port Operations Dataset
          ↓
MySQL Database
          ↓
Database & Table Creation
          ↓
Data Import
          ↓
SQL Analysis
          ↓
Power Query / ETL
          ↓
Data Cleaning
          ↓
Data Modeling
          ↓
Create Date Dimension
          ↓
Create DAX Measures
          ↓
Power BI Dashboard Development
          ↓
Interactive Filters & Slicers
          ↓
Operational Analysis
          ↓
Risk & Bottleneck Analysis
          ↓
Decision Intelligence
          ↓
Business Recommendations
```

---

# Repository Structure

```text
PortPulse-Analytics/
│
├── README.md
│
├── SQL/
│   ├── database_creation.sql
│   ├── table_creation.sql
│   └── analysis_queries.sql
│
├── Dataset/
│   └── PortPulse datasets
│
├── PowerBI/
│   └── PortPulse_Analytics.pbix
│
├── Screenshots/
│   ├── Executive Overview.png
│   ├── Container & Yard Intelligence.png
│   ├── Crane & Truck Operations.png
│   └── Decision Intelligence.png
│
├── Documentation/
│   └── Data_Dictionary.xlsx
│
└── README.md
```

---

# Dashboard Screenshots & Deliverables

## 1. Page 1 — Executive Overview

<img width="903" height="482" alt="Executive Overview" src="https://github.com/user-attachments/assets/22473560-304c-4a45-8658-a0b506ea981f" />


## 2. Page 2 — Container & Yard Intelligence

<img width="903" height="482" alt="Container and Yard Intelligence" src="https://github.com/user-attachments/assets/52bb05d5-4f73-40a4-bb00-3b1e07df0fcc" />

## 3. Page 3 — Crane & Truck Operations

<img width="903" height="482" alt="Crane and Truck Operations" src="https://github.com/user-attachments/assets/bbeddd1d-de6f-43e1-95e1-380ba1f595c0" />

## 4. Page 4 — Decision Intelligence

<img width="903" height="482" alt="Decision Intelligence" src="https://github.com/user-attachments/assets/d421f715-9a10-4d79-802e-df044d31003a" />

---

# How to Run the Project

## 1. Create MySQL Database

Open MySQL Workbench and execute:

```sql
CREATE DATABASE portpulse;

USE portpulse;
```

## 2. Create Tables

Run the table creation script:

```text
SQL/table_creation.sql
```

## 3. Import Data

Import the PortPulse datasets into their respective MySQL tables.

## 4. Run SQL Analysis

Execute:

```text
SQL/analysis_queries.sql
```

## 5. Open Power BI

Open:

```text
PowerBI/PortPulse_Analytics.pbix
```

## 6. Refresh Data

Refresh the Power BI report after connecting to the MySQL database.

## 7. Explore the Dashboard

Navigate through:

**Executive Overview → Container & Yard Intelligence → Crane & Truck Operations → Decision Intelligence**

---

# Recommendations & Strategic Interventions

Based on the operational analysis, the platform can support recommendations such as:

* Prioritize high-utilization yards before capacity becomes critical.
* Investigate containers with excessive dwell times.
* Prioritize long-stay containers for operational clearance.
* Monitor cranes with high downtime.
* Schedule preventive maintenance based on operational requirements.
* Investigate terminals with consistently high truck waiting times.
* Improve resource allocation during peak operational periods.
* Monitor high-risk ports and terminals through the Decision Intelligence page.
* Use operational KPIs to support proactive capacity planning.

---

# Project Outcome

PortPulse Analytics transforms raw port-operation data into an interactive **Business Intelligence and Decision Intelligence solution**.

The project demonstrates an end-to-end analytics workflow using:

**MySQL + SQL + Power Query + DAX + Power BI**

The solution enables users to understand:

**Containers → Ports → Ships → Cranes → Trucks → Yards → Risks → Decisions**

The final dashboard helps organizations:

* Monitor operational performance
* Identify bottlenecks
* Understand capacity constraints
* Analyze operational risks
* Support proactive planning
* Take data-driven actions

---

# Author

**SWETHA M(AF05303152)**

**Data and Business Analytics with AI,**
**Anudip Foundation -- Pallavaram, Chennai**

### Project

**Smart Container and Port Operations Intelligence Platform**

### Industry

**Port Operations**

### Technologies

**MySQL | SQL | Power BI | DAX | Power Query | Excel**

### Project Focus

**Container Operations | Yard Intelligence | Crane Operations | Truck & Gate Operations | Port & Terminal Performance | Operational Risk Analysis | Bottleneck Detection | Decision Intelligence | Interactive Business Intelligence**

---

# License

This project is created for **educational, portfolio, and data analytics demonstration purposes**.

---

# Project Repository

This repository contains the:

* SQL scripts
* Datasets
* Power BI report
* Dashboard screenshots
* Data dictionary
* Project documentation

**PortPulse Analytics demonstrates how operational data can be transformed into business insights and actionable decisions using modern data analytics and business intelligence tools.**
