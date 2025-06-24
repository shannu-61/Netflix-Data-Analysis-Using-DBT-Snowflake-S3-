📊 Netflix Data Analysis with DBT | End-to-End Analytics Engineering Project

Welcome to the Netflix Data Analysis project — a full-scale, hands-on DBT masterclass designed to help you level up your Data Engineering or Analytics Engineering skills. This isn't just theory — it's a real project powered by industry tools and best practices.

🚀 Project Architecture

![image](https://github.com/user-attachments/assets/0a3d468f-d8f7-4ba9-901c-98f6b6d72950)


Extract: Upload Netflix dataset CSVs into Amazon S3
Load: Ingest into Snowflake raw tables
Transform: Build modular, tested models using DBT
Serve: Visualize the data in Looker Studio and Power BI

🧠 What You’ll Learn

| Feature                | Description                                                                                    |
| ---------------------- | ---------------------------------------------------------------------------------------------- |
| ✅ **DBT Models**       | Write modular SQL to model business logic. Each model = `.sql` file = table/view in Snowflake. |
| ✅ **Materializations** | Learn when to use `view`, `table`, `incremental`, etc.                                         |
| ✅ **Sources**          | Reference raw sources cleanly for better lineage and maintainability.                          |
| ✅ **Seeds**            | Load static lookup CSVs into Snowflake for lightweight joins.                                  |
| ✅ **Snapshots**        | Track Slowly Changing Dimensions (SCD Type 2).                                                 |
| ✅ **Tests**            | Add data quality checks with built-in + custom tests.                                          |
| ✅ **Docs & DAGs**      | Auto-generate rich docs and table relationships using `dbt docs`.                              |


☁️ Technologies Used

| Tool                            | Purpose                                                  |
| ------------------------------- | -------------------------------------------------------- |
| 🟦 **Amazon S3**                | Cloud object storage to stage raw CSV files              |
| ❄️ **Snowflake**                | Cloud data warehouse for querying and transformations    |
| 🟧 **DBT** (Data Build Tool)    | For modeling, testing, and documenting the data pipeline |
| 📊 **Power BI & Looker Studio** | To create dashboards from the cleaned data               |




📁 Project Structure

netflix/
├── dbt_project.yml               # DBT config file
├── models/                       # DBT models directory
│   ├── staging/                  # Raw staging models
│   ├── marts/                    # Final transformed models
├── seeds/                        # Seed CSV files
├── snapshots/                    # Snapshot logic for historical changes
├── tests/                        # Custom data tests
└── docs/                         # Auto-generated DBT documentation


🔍 Sample Code Explanation
1. Staging Model: Clean raw Netflix data
SELECT
    id,
    title,
    type,
    release_year,
    rating
FROM {{ source('netflix', 'raw_data') }}

2. Incremental Model:
   {{ config(materialized='incremental') }}

SELECT *
FROM {{ ref('stg_netflix_data') }}

{% if is_incremental() %}
  WHERE updated_at > (SELECT MAX(updated_at) FROM {{ this }})
{% endif %}

3. Snapshot Example:
{% snapshot netflix_snapshot %}
  {{
    config(
      target_schema='snapshots',
      unique_key='id',
      strategy='check',
      check_cols=['title', 'rating']
    )
  }}

  SELECT * FROM {{ source('netflix', 'raw_data') }}

{% endsnapshot %}

✅ How to Run

# Install dependencies
dbt deps

# Compile & Run models
dbt run

# Run tests
dbt test

# Generate docs
dbt docs generate
dbt docs serve


📌 Final Thoughts
This is your all-in-one project to master DBT with real data, cloud tools, and clear business logic. Perfect for Data Engineers, Analytics Engineers, or anyone aiming to level up in modern data stack workflows.

🙌 Connect with Me
If you enjoyed this project or learned something new, drop a ⭐ on the repo and feel free to connect!

Dataset link
https://grouplens.org/datasets/movielens/20m/
