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

![Data Architecture Diagram](docs/Data%20Architecture.drawio.png)

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
```
## 📊 Data Modeling & Analytics

### The Schema
The Gold layer utilizes a dimensional modeling approach:
*   **Fact Tables:** Store quantitative data for analysis.
*   **Dimension Tables:** Store descriptive attributes related to fact data.

### Key Analytical Queries
The analytics phase leverages advanced SQL concepts to extract insights:
*   **Window Functions** for calculating running totals, rankings, and moving averages.
*   **Complex Joins** to bring together dimensional data effectively.
*   **Indexing strategies** to optimize query performance on large datasets.

---

## 🚀 Getting Started

To run this project locally, follow these steps:

### Prerequisites
*   Git installed on your local machine.
*   A SQL Database Engine installed.
*   Visual Studio Code or your preferred SQL IDE.

### Installation & Execution

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/Nidhi-Singhal-0808/sql-data-warehouse-project.git](https://github.com/Nidhi-Singhal-0808/sql-data-warehouse-project.git)
   cd sql-data-warehouse-project

2.Set up the Database:
    Open your SQL IDE and create a new database for the project.

3.Execute the SQL Scripts in order:
    Run the scripts in the scripts/ folder sequentially (Bronze -> Silver -> Gold -> Analytics) to build the architecture and query the data.

---

## 👩‍💻 About Me

Hi, I'm **Nidhi Singhal**! 👋

I am currently in my 3rd year of a B.Tech program and an aspiring **Business / Data Analyst**. I am passionate about transforming raw data into actionable insights and solving real-world problems through data-driven decision-making. 

My technical journey involves exploring SQL, designing data architecture, and building efficient workflows. I am always eager to learn new technologies, tackle complex analytical challenges, and collaborate on exciting tech projects. 

📫 **Let's Connect:**
- **LinkedIn:** [www.linkedin.com/in/nidhi-singhal-cse]
- **GitHub:** [@Nidhi-Singhal-0808](https://github.com/Nidhi-Singhal-0808)
- **Email:** [singhalnidhi0808@gmail.com]
- **Instagram:** [https://www.instagram.com/nidhii_diariess/]
