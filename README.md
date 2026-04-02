
# 📊 PhonePe Fintech Performance Analytics (2018–2024)

An end-to-end data analytics project built on **PhonePe Pulse** open data — covering user adoption, engagement depth, and insurance penetration across India from 2018 to 2024.

The project follows a **warehouse-first architecture**: Python for ingestion, MySQL for all KPI logic, and Power BI for visualisation. No business logic is defined in the BI layer.

---

## 🗂️ Project Structure

```
phonepe-analytics/
│
├── 01_Raw_Data/
│   ├── phonepe_users_aggregated.csv
│   └── phonepe_insurance_aggregated_india.csv
│
├── 02_Python/
│   └── data_ingestion.py              # JSON flattening, standardisation, CSV export
│
├── 03_SQL/
│   ├── schema/
│   │   ├── dim_tables.sql             # dim_time, dim_state, dim_region
│   │   ├── fact_users.sql
│   │   └── fact_insurance.sql
│   └── views/
│       ├── layer1_core/               # Base aggregations
│       ├── layer2_derived/            # Growth, engagement, ranking views
│       └── layer3_snapshots/          # KPI summary & historical views
│
├── 04_PowerBI/
│   └── PhonePe_Analytics.pbix
│
└── 05_Documentation/
    ├── 01_Project_Overview.docx
    ├── 02_Data_Methodology.docx
    ├── 03_Data_Model_Architecture.docx
    ├── 04_Dashboard_Framework.docx
    ├── 05_KPI_Governance_Framework.docx
    ├── 01_Data_Assumptions.docx
    ├── 02_Data_Dictionary.docx
    └── 03_Region_Mapping.docx
```

---

## 📁 Datasets

| Dataset | File | Rows | Coverage | Granularity |
|---------|------|------|----------|-------------|
| Users | `phonepe_users_aggregated.csv` | 1,008 | 2018 Q1 – 2024 Q4 | State × Quarter |
| Insurance | `phonepe_insurance_aggregated_india.csv` | 19 | 2020 Q2 – 2024 Q4 | National × Quarter |

### Users Dataset — Columns
| Column | Type | Description |
|--------|------|-------------|
| `state` | String | Indian state or union territory (36 unique) |
| `region` | String | Region classification (North / South / East / West / Central / North-East) |
| `year` | Integer | Calendar year (2018–2024) |
| `quarter` | Integer | Quarter number (1–4) |
| `registered_users` | Bigint | Total registered PhonePe users — range: 501 to 71,807,805 |
| `app_opens` | Bigint | Total app open events — range: 0 to 5,335,171,033 |

### Insurance Dataset — Columns
| Column | Type | Description |
|--------|------|-------------|
| `year` | Integer | Calendar year (2020–2024) |
| `quarter` | Integer | Quarter number (1–4) |
| `insurance_type` | String | Product category — `Insurance` throughout |
| `policy_count` | Bigint | Total policies issued — range: 185,348 to 1,475,429 |
| `insurance_amount_rupees` | Decimal | Total premium collected in INR |
| `insurance_amount_crore` | Decimal | Premium in Crore INR |
| `avg_policy_value` | Decimal | Average policy value — Rs.181.99 to Rs.1,600.69 |

---

## 📈 Key Metrics

### Users
| Metric | Value |
|--------|-------|
| Total Registered Users (2018) | 292.8 Million |
| Total Registered Users (2024) | 2.24 Billion |
| Total Cumulative App Opens | 402.29 Billion |
| Avg Engagement Ratio | 39.20 |
| Largest State (Maharashtra) | 1.14 Billion cumulative |
| Largest Region (South) | 2.54 Billion cumulative |

### Insurance
| Metric | Value |
|--------|-------|
| Total Policies Issued | 14.52 Million |
| Total Premium Collected | ₹2,001.59 Crore |
| Policies in 2020 | 788,258 |
| Policies in 2024 | 5,067,888 |
| Avg Policy Value (2020 Q2) | ₹181.99 |
| Avg Policy Value (2024 Q4) | ₹1,600.69 |

---

## 🗺️ Regional Distribution (Users)

| Region | States / UTs | Cumulative Users | Share |
|--------|-------------|-----------------|-------|
| South | 5 | 2,536,836,574 | 28.6% |
| West | 4 | 2,182,584,883 | 24.6% |
| North | 7 | 1,936,416,831 | 21.8% |
| East | 4 | 1,430,368,921 | 16.1% |
| Central | 2 | 612,954,641 | 6.9% |
| North-East | 8+ | 165,035,008 | 1.9% |

---

## 🛠️ Tech Stack

| Layer | Tool | Purpose |
|-------|------|---------|
| Ingestion | Python (pandas) | JSON flattening, column standardisation, CSV export |
| Warehouse | MySQL | Star schema, fact/dim tables, all analytical views |
| BI | Power BI Desktop | Semantic model, dashboards, controlled visualisation |

---

## 🗄️ Warehouse Architecture

The warehouse follows a **star schema** with three view layers:

```
fact_users          ──┐
fact_insurance      ──┤──── dim_time
                      ├──── dim_state
                      └──── dim_region

View Layers:
  Layer 1 (Core)     →  Base aggregations per grain
  Layer 2 (Derived)  →  Growth, engagement, ranking, intensity metrics
  Layer 3 (Snapshot) →  Latest-quarter KPI summary + historical alignment
```

### Key SQL Views
| View | Purpose |
|------|---------|
| `vw_core_quarterly_users` | State × Quarter user and app opens aggregation |
| `vw_user_growth` | QoQ & YoY user growth via `LAG()` |
| `vw_engagement_intensity` | Weighted engagement ratio per region |
| `vw_core_quarterly_insurance` | National quarterly insurance aggregation |
| `vw_insurance_growth` | QoQ & YoY policy and premium growth |
| `vw_master_kpi_summary` | Latest-quarter KPI snapshot for all KPI cards |
| `vw_historical_master_kpi` | One row per quarter for trend visuals |

> **Governance rule:** All growth metrics use `LAG()` window functions. No KPI logic is defined in Power BI.

---

## 📊 Power BI Dashboards

| Page | Title | Dataset | Key Visuals |
|------|-------|---------|-------------|
| 1 | PhonePe Overview | Users + Insurance | KPI cards, user growth trend, policy adoption trend, insurance value growth |
| 2 | Regional User Distribution | Users | Treemap, region bar chart, state performance table |
| 3 | Map View | Users | Filled map of registered users by state across India |
| 4 | User Engagement & Growth | Users | App opens trend, engagement ratio, users vs activity combo chart |
| 5 | User Behaviour & Trends | Users | Yearly growth rate, quarterly patterns, regional engagement |
| 6 | Business / Insurance | Insurance | Insurance growth donut, quarterly trend, policy conversion rate |

---

## 🔢 Data Governance

- ✅ **SUM** for all additive metrics (users, app opens, policies, premium)
- ✅ **Weighted ratio** for engagement ratio and avg policy value — `SUM(num) ÷ SUM(den)`
- ✅ **LAG()** window functions for all QoQ and YoY growth metrics
- ✅ **MAX** for latest-quarter KPI card extraction from snapshot views
- ❌ **No blind summation** of percentages or growth rates
  

---

## 📄 Documentation

| File | Contents |
|------|----------|
| `01_Project_Overview.docx` | Objectives, scope, tech stack, key metrics |
| `02_Data_Methodology.docx` | Ingestion process, transformation steps, validation framework |
| `03_Data_Model_Architecture.docx` | Schema design, fact/dim tables, all views documented |
| `04_Dashboard_Framework.docx` | All 6 dashboard pages with visual inventory and SQL sources |
| `05_KPI_Governance_Framework.docx` | Every KPI with formula, SQL view, and actual values |

---

## 🚀 Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/yourusername/phonepe-analytics.git
cd phonepe-analytics
```

### 2. Run Python ingestion
```bash
pip install pandas
python 02_Python/data_ingestion.py
```

### 3. Set up MySQL warehouse
```bash
mysql -u root -p < 03_SQL/schema/dim_tables.sql
mysql -u root -p < 03_SQL/schema/fact_users.sql
mysql -u root -p < 03_SQL/schema/fact_insurance.sql
mysql -u root -p < 03_SQL/views/layer1_core/all_views.sql
mysql -u root -p < 03_SQL/views/layer2_derived/all_views.sql
mysql -u root -p < 03_SQL/views/layer3_snapshots/all_views.sql
```

### 4. Open Power BI
- Open `04_PowerBI/PhonePe_Analytics.pbix`
- Update the MySQL connection string to your local server
- Refresh all tables

---

## 📌 Notes

- Insurance data starts from **2020 Q2** — the product launched mid-2020. The gap before this is expected and not a data quality issue.
- The users dataset covers **36 states and union territories** including smaller UTs like Lakshadweep (min: 501 users).
- All monetary values are in **INR (Rupees)** and **Crore INR** — no currency conversion applied.
- Power BI region and year slicers do **not** filter insurance visuals (insurance is national-level only).

---

## 📃 License

This project uses publicly available data from the [PhonePe Pulse](https://github.com/PhonePe/pulse) open data repository. All analysis, documentation, and warehouse design are original work.

