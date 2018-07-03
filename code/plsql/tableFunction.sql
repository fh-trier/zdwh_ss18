-- Schreibe eine Table Function, der eine Mitarbeiter-ID übergeben wird und
-- die für diesen Mitarbeiter den Namen, die durch ihn abgesetzte Menge insgesamt,
-- je Absatzkanal, und je Produktsubkategorie (Hardware1, Hardware2 usw.) in einer
-- Collection zurückgibt.*/

-- DELETE
DROP FUNCTION get_empdata;
DROP TYPE nttype_empdata;
DROP TYPE ob_empdata;

-- CREATE
CREATE TYPE ob_empdata AS OBJECT (
  emp_id    NUMBER        NULL,
  emp_name  VARCHAR2(100) NULL,
  channel   VARCHAR2(100) NULL,
  category  VARCHAR2(100) NULL,
  quantity  NUMBER        NULL
);
/

CREATE TYPE nttype_empdata AS TABLE OF ob_empdata;
/

CREATE FUNCTION get_empdata(i_emp_id IN NUMBER) RETURN nttype_empdata
IS
  nt_empdata nttype_empdata := nttype_empdata();
BEGIN
  SELECT ob_empdata(a.EMPLOYEE_ID, a.FIRST_NAME || ' ' || a.LAST_NAME,
         c.channel_desc,
         f.category_name,
         NVL(SUM(d.QUANTITY),0)) BULK COLLECT INTO nt_empdata
  FROM employees a
    INNER JOIN orders b ON (a.employee_id = b.sales_rep_id)
    INNER JOIN channels c ON (b.channel_id = c.channel_id)
    INNER JOIN order_items d ON (b.order_id = d.order_id)
    INNER JOIN product_information e ON (d.product_id = e.product_id)
    INNER JOIN categories_tab f ON (e.category_id = f.category_id)
  WHERE a.employee_id = i_emp_id
  GROUP BY GROUPING SETS (
    (a.employee_id, a.first_name ||' '|| a.last_name),
    (a.employee_id, a.first_name ||' '|| a.last_name), f.category_name),
    (a.employee_id, a.first_name ||' '|| a.last_name), c.channel_desc)
  );

-- Abfrage
SELECT *
FROM TABLE(get_empdata(376));