/*
Project: E-commerce KPI Dashboard
Purpose: Prepare aggregated daily KPIs for Tableau Public
Database: PostgreSQL
Grain: Day
*/

CREATE OR REPLACE VIEW daily_kpi AS
SELECT
    to_date("Order Date", 'MM/DD/YYYY')               AS order_date,
    SUM("Sales")                                      AS revenue,
    COUNT(DISTINCT "Order ID")                        AS orders,
    COUNT(DISTINCT "Customer ID")                     AS customers,
    ROUND(
        SUM("Sales")::numeric 
        / COUNT(DISTINCT "Order ID"), 
        2
    )                                                 AS aov,
    SUM("Profit")                                     AS profit,
    ROUND(
        SUM("Profit")::numeric 
        / NULLIF(SUM("Sales")::numeric, 0),
        2
    )                                                 AS profit_margin
FROM orders
GROUP BY order_date
ORDER BY order_date;
