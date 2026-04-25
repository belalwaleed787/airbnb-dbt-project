# 🏠 Airbnb dbt Project — Modern Data Warehouse

<p align="center">
  <img src="https://img.shields.io/badge/dbt-1.11-orange?style=for-the-badge&logo=dbt&logoColor=white"/>
  <img src="https://img.shields.io/badge/Databricks-informational?style=for-the-badge&logo=databricks&logoColor=white&color=FF3621"/>
  <img src="https://img.shields.io/badge/SQL-dimensional%20modeling-blue?style=for-the-badge&logo=databricks"/>
  <img src="https://img.shields.io/badge/Status-Active-brightgreen?style=for-the-badge"/>
</p>

---

## 📌 Overview

This project is a **production-style data warehouse** built on top of the [Inside Airbnb](http://insideairbnb.com/) dataset using **dbt** and **Databricks**.

It demonstrates a full analytics engineering workflow — from raw ingestion all the way to business-ready dimensional models — following modern data stack best practices.

> Built to simulate how a real data team would model, test, document, and serve Airbnb data to analysts and BI tools.

---

## 🏗️ Architecture

```
Raw Data (Source / S3)
        │
        ▼
┌───────────────────┐
│   RAW Schema      │  ← Source tables, untouched
└───────────────────┘
        │
        ▼
┌───────────────────┐
│  Staging Layer    │  ← stg_* models: rename, cast, clean
│  (stg_*)          │
└───────────────────┘
        │
        ▼
┌─────────────────────────────────┐
│         Core Layer              │
│  ┌─────────────┐ ┌───────────┐  │
│  │ Dimensions  │ │   Facts   │  │
│  │  (dim_*)    │ │  (fct_*)  │  │
│  └─────────────┘ └───────────┘  │
└─────────────────────────────────┘
        │
        ▼
┌───────────────────┐
│   Marts Layer     │  ← Wide, business-ready tables
│  (mart_*)         │
└───────────────────┘
        │
        ▼
   📊 Power BI / BI Tools
```

---

## 🧰 Tech Stack

| Tool | Purpose |
|------|---------|
| **dbt** | Data transformation & modeling |
| **Databricks** | Cloud data warehouse & compute |
| **SQL + Jinja** | Modeling & templating |
| **dbt-utils** | Utility macros (surrogate keys, date spine) |
| **Power BI** | BI & dashboarding layer |
| **Git / GitHub** | Version control |

---

## 📂 Project Structure

```
airbnb-dbt-project/
│
├── models/
│   ├── staging/              # stg_listings, stg_hosts, stg_reviews
│   ├── dimensions/           # dim_listing, dim_host, dim_date
│   ├── facts/                # fct_reviews, fct_bookings
│   └── marts/                # mart_host_performance, mart_listing_insights
│
├── seeds/                    # Static CSV reference data
├── snapshots/                # SCD Type 2 historical tracking
├── macros/                   # Reusable Jinja logic
├── tests/                    # Custom data quality tests
├── analyses/                 # Ad-hoc SQL analyses
│
├── dbt_project.yml           # Project configuration
├── packages.yml              # dbt packages
└── profiles.yml              # Connection profile (not committed in prod)
```

---

## 📐 Data Model

### Dimensions

| Table | Description | Key Columns |
|-------|-------------|-------------|
| `dim_listing` | Airbnb listing details | `listing_sk`, `listing_id`, `room_type`, `price` |
| `dim_host` | Host information with SCD Type 2 | `host_sk`, `host_id`, `host_name`, `is_superhost` |
| `dim_date` | Date dimension (date spine) | `date_sk`, `full_date`, `year`, `month`, `quarter` |

### Facts

| Table | Grain | Key Metrics |
|-------|-------|-------------|
| `fct_reviews` | One row per review | `review_score`, `review_count` |
| `fct_bookings` | One row per booking | `price`, `minimum_nights`, `availability` |

### Bridge Tables

| Table | Purpose |
|-------|---------|
| `bridge_listing_amenities` | Many-to-many: listings ↔ amenities |

---

## ⚙️ dbt Features Used

- ✅ **Incremental models** — efficient processing of new data only
- ✅ **Snapshots** — SCD Type 2 tracking for hosts & listings
- ✅ **Source freshness tests** — alerting on stale data
- ✅ **Generic tests** — `unique`, `not_null`, `accepted_values`, `relationships`
- ✅ **Custom singular tests** — business-logic validation
- ✅ **dbt-utils macros** — `generate_surrogate_key`, `date_spine`
- ✅ **Jinja macros** — reusable SQL logic across models
- ✅ **dbt docs** — auto-generated project documentation

---

## 🚀 Getting Started

### Prerequisites

```bash
pip install dbt-databricks
```

### Setup

**1. Clone the repo**
```bash
git clone https://github.com/belalwaleed787/airbnb-dbt-project.git
cd airbnb-dbt-project
```

**2. Configure your profile** — create `~/.dbt/profiles.yml`:
```yaml
airbnb:
  target: dev
  outputs:
    dev:
      type: databricks
      host: your-workspace.cloud.databricks.com
      http_path: /sql/1.0/warehouses/your_warehouse_id
      token: your_personal_access_token
      catalog: your_catalog
      schema: dev
      threads: 4
```

**3. Install packages**
```bash
dbt deps
```

**4. Test the connection**
```bash
dbt debug
```

**5. Run the project**
```bash
dbt seed        # Load static reference data
dbt run         # Build all models
dbt test        # Run data quality tests
dbt docs serve  # View documentation in browser
```

---

## 📊 Key Use Cases

This data warehouse enables the following analytical workloads:

- 🏡 **Listing Analysis** — pricing trends, room type distribution, availability patterns
- 👤 **Host Performance** — superhost tracking, response rate, revenue estimation
- ⭐ **Review Trends** — sentiment over time, score distributions by neighbourhood
- 📍 **Market Insights** — geographic analysis, demand hotspots
- 💰 **Revenue Estimation** — occupancy rate modeling, pricing benchmarks

---

## 🔄 Running in Production

```bash
# Full refresh (rebuild everything)
dbt run --full-refresh

# Run only a specific model and its dependencies
dbt run --select +fct_reviews

# Run tests on a specific model
dbt test --select dim_host

# Generate & serve docs
dbt docs generate
dbt docs serve
```

---

## 🗺️ Roadmap

- [ ] Add orchestration with **Apache Airflow** or **Dagster**
- [ ] CI/CD pipeline using **GitHub Actions**
- [ ] Expand test coverage with **dbt-expectations**
- [ ] Connect live **Power BI** dashboard
- [ ] Add **dbt metrics layer** for KPI definitions
- [ ] Optimize with Databricks **liquid clustering**

---

## 📖 What I Learned

Through this project I deepened my knowledge of:

- Modern **analytics engineering** principles
- **Dimensional modeling** (star schema, slowly changing dimensions)
- **Incremental vs full-refresh** strategies and when to use each
- Writing **maintainable, modular SQL** with dbt
- **Data quality testing** as part of the transformation pipeline
- Structuring a dbt project for **team collaboration**

---

## 🤝 Contributing

Feel free to open issues or submit pull requests. Any feedback on modeling decisions or dbt patterns is welcome!

---

## 📬 Contact

**Belal Waleed**
- GitHub: [@belalwaleed787](https://github.com/belalwaleed787)

---

<p align="center">⭐ If you found this useful, give the repo a star!</p>
