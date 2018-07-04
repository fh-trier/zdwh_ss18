CREATE MATERIALIZED VIEW "REPORT_53"
  BUILD IMMEDIATE
  REFRESH COMPLETE
  ENABLE QUERY REWRITE
AS
  SELECT
    dd.yearnumber,
    dd.quarter,
    CONCAT(de.emp_firstname, CONCAT(', ', de.emp_lastname)) AS "EMPLOYEE",
    dp.subcategory_name,
    SUM(f.quantity) AS "ABSATZ"
  FROM facts f
    INNER JOIN dim_date dd ON (dd.id = f.date_id)
    INNER JOIN dim_employee de ON (de.id = f.emp_id)
    INNER JOIN dim_product dp ON (dp.id = f.prod_id)
  GROUP BY
    dd.yearnumber,
    dd.quarter,
    de.emp_firstname,
    de.emp_lastname,
    dp.subcategory_name;

-- Aktiviere Query-Rewrite für die Session
ALTER SESSION SET query_rewrite_enabled = true;

-- Greift auf Tabellen anstatt MV zu?
EXPLAIN PLAN FOR
SELECT
    dd.yearnumber,
    dd.quarter,
    CONCAT(de.emp_firstname, CONCAT(', ', de.emp_lastname)) AS "EMPLOYEE",
    dp.subcategory_name,
    SUM(f.quantity) AS "ABSATZ"
  FROM facts f
    INNER JOIN dim_date dd ON (dd.id = f.date_id)
    INNER JOIN dim_employee de ON (de.id = f.emp_id)
    INNER JOIN dim_product dp ON (dp.id = f.prod_id)
  GROUP BY
    dd.yearnumber,
    dd.quarter,
    de.emp_firstname,
    de.emp_lastname,
    dp.subcategory_name;

-- Übersicht ausgeben lassen
SELECT *
FROM TABLE(dbms_xplan.display());