# SQL Queries - Mississippi Power Internship  
**2023-2024 Power Delivery Internship**  

## Overview  

This folder contains **SQL queries** developed during my internship at **Mississippi Power Company (MPC)**. These queries were used for **data extraction, transformation, and analysis**, supporting the development of various **Power BI dashboards** and **GIS updates**.  

By utilizing **Oracle SQL Developer**, I optimized database queries to streamline reporting processes, replacing manual data retrieval methods in **Microsoft Access** with more efficient, automated solutions.  

---

## SQL Queries Included  

### 1. **MPC Automation Device Count Dashboard**  
- Retrieves data on **automated capacitors, reclosers, regulators, switch gears, trip savers, transformers, and distribution substations**.  
- Supports **real-time monitoring and reporting** for power distribution optimization.  

### 2. **MPC Poles and Attachment Dashboard**  
- Extracts details on **MPC Poles, AT&T Poles, and attachments (AT&T, CTV, and others)**.  
- Automates a process previously handled through **Microsoft Access SQL queries and Excel spreadsheets**.  

### 3. **MPC Product Dashboard**  
- Queries **transformer, fuse, pole, and light data** from work orders in **DistGIS ArcMap**.  
- Supports analysis of **maintenance, repairs, and replacements**.  

### 4. **MPC Customer Outage Summary Dashboard**  
- Retrieves **outage event data** including **total customers affected, percent restored, and outage trends**.  
- Optimized for **storm center managers and media outlets** to track outages during major storms.  

### 5. **MPC JETS & FAES Form Completion Projects**  
- Extracts work order data, including **work order number, request date, and headquarters (Coast, Meridian, Pinebelt)**.  
- Supports **GIS updates** by providing structured data for **DistGIS ArcMap** modifications.  

---

## How to Use  

1. **SQL Files Location**  
   - Queries are stored in the [`/Internship SQL Queries`](/Internship%20SQL%20Queries/) folder, organized by the year I completed the queries.  

2. **Database Compatibility**  
   - These queries were designed for **Oracle SQL Developer** but can be modified for other SQL platforms.  

3. **Running the Queries**  
   - Open **Oracle SQL Developer** or another SQL management tool.  
   - Connect to the **MPC database** (if applicable).  
   - Execute the queries to retrieve **real-time data insights**.  

4. **Modifications & Adaptations**  
   - If using a different database system, minor syntax changes (e.g., `NVL` vs. `COALESCE`, `ROWNUM` vs. `LIMIT`) may be needed.  

---

## Notes  

- **Security & Confidentiality:**  
  - The **.pbix Power BI files** are **not included** due to **security policies**.  
  - Queries have been **generalized** to protect sensitive company information.  

- **Dependencies:**  
  - Some queries rely on **Oracle-specific functions** (e.g., `TO_CHAR`, `NVL`, `ROWNUM`).  
  - Ensure that necessary **database tables and views** exist before running queries.  

---

## Contact  

For any questions or further details, feel free to reach out!  

