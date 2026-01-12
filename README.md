# E-commerce KPI Dashboard (Tableau)

## 🔗 Dashboard
[View dashboard on Tableau Public](https://public.tableau.com/app/profile/oleksandr.tymoshenko2775/viz/E-commerce_KPI_Dashboard/E-commerceSalesPerformanceDashboard?publish=yes)

## 📊 Project Overview
This project presents an interactive **E-commerce KPI Dashboard** built in Tableau.
The dashboard is designed to analyze sales performance, profitability, and order distribution.

It allows users to:
- monitor key business KPIs,
- analyze revenue by product category,
- compare successful vs unsuccessful orders,
- explore geographic distribution of orders across US states.

---

## 📌 Key KPIs
- Total Revenue  
- Total Orders  
- Total Profit  
- Profit Margin  
- Average Order Value (AOV)

---

## 📈 Visualizations
- **KPI Cards** – high-level business performance overview  
- **Revenue by Category (Successful vs Unsuccessful Orders)**  
- **Orders by State (US map)**  

---

## 🎛 Dashboard Filters
- **KPI Year** → KPI cards only  
- **Analysis Year + Category** → Revenue by Category chart and US State map  

---

### 🧮 Data Preparation

Data preparation was performed in SQL by creating analytical views
that aggregate transactional data into daily KPIs and category-level breakdowns.
These views were exported to CSV files and used directly in Tableau.

Core KPI calculations include:
```sql
SUM(Sales)  AS revenue,
SUM(Profit) AS profit,
SUM(Profit) / NULLIF(SUM(Sales), 0) AS profit_margin
Example KPI logic:


