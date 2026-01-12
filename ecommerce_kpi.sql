-- E-commerce KPI Dashboard (Tableau)
-- Views: daily_kpi, daily_kpi_breakdown

CREATE OR REPLACE VIEW daily_kpi AS
SELECT
  to_date("Order Date", 'MM/DD/YYYY') AS order_date
, SUM("Sales") AS revenue
, COUNT(DISTINCT "Order ID") AS orders
, COUNT(DISTINCT "Customer ID") AS customers
, ROUND( (SUM("Sales")::numeric / NULLIF(COUNT(DISTINCT "Order ID"), 0)) , 2) AS aov
, SUM("Profit") AS profit
, ROUND( (SUM("Profit")::numeric / NULLIF(SUM("Sales")::numeric, 0)) , 2) AS profit_margin
FROM orders
GROUP BY order_date;

CREATE OR REPLACE VIEW daily_kpi_breakdown AS
SELECT
  to_date("Order Date", 'MM/DD/YYYY') AS order_date
, "Category"                          AS category
, "State"                             AS state
,  CASE
    WHEN SUM("Profit") > 0 THEN 'Successful'
    ELSE 'Unsuccessful'
    END AS success_flag
, SUM("Sales") AS revenue
, COUNT(DISTINCT "Order ID")    AS orders
, COUNT(DISTINCT "Customer ID") AS customers
, ROUND((SUM("Sales")::numeric / NULLIF(COUNT(DISTINCT "Order ID"), 0)), 2) AS aov
, SUM("Profit")                 AS profit
, ROUND((SUM("Profit")::numeric / NULLIF(SUM("Sales")::numeric, 0)), 4)     AS profit_margin
FROM orders
GROUP BY
    order_date, category, state;

