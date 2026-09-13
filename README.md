# 🏢 Data Warehouse and Analytics Project

[![SQL](https://img.shields.io/badge/SQL-Ready-blue.svg)](https://en.wikipedia.org/wiki/SQL)
[![Data Architecture](https://img.shields.io/badge/Architecture-Medallion-orange.svg)]()
[![ETL](https://img.shields.io/badge/ETL-Pipelines-green.svg)]()

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀

This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---

## 📖 Project Overview

This project involves:

1. **Data Architecture:** Designing a Modern Data Warehouse Using Medallion Architecture (**Bronze**, **Silver**, and **Gold** layers).
2. **ETL Pipelines:** Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling:** Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting:** Creating SQL-based reports and dashboards for actionable insights.

---

## 🛠️ Tech Stack & Tools

- **Language:** SQL
- **Database Environment:** SQL Server / PostgreSQL / MySQL
- **Development Tools:** Visual Studio Code, Git, GitHub

---

## 🏗️ Architecture: The Medallion Approach

This project strictly follows the Medallion Data Architecture paradigm to ensure data quality and progressive refinement:

*   🥉 **Bronze Layer (Raw Data):** Ingests raw data from source systems "as-is". Serves as the historical archive and single source of truth.
*   🥈 **Silver Layer (Cleansed & Conformed Data):** Filters, cleans, and standardizes the Bronze data. Resolves missing values and applies business rules.
*   🥇 **Gold Layer (Curated Business-Level Data):** Highly refined data organized into Star/Snowflake schemas (Fact and Dimension tables) optimized for BI and analytics.

---

## 📂 Repository Structure

```text
sql-data-warehouse-project/
│
├── data/                   # Sample datasets 
├── scripts/
│   ├── 01_bronze_ddl.sql   # Scripts to create and load Bronze layer
│   ├── 02_silver_etl.sql   # Data cleansing and transformation scripts
│   ├── 03_gold_ddl.sql     # Fact and Dimension table creation
│   └── 04_analytics.sql    # Complex SQL queries for reporting
│
├── docs/                   # Data dictionaries, ER diagrams, and architecture notes
└── README.md               # Project documentation
