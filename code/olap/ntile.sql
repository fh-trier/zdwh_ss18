-- Die Mitarbeitergehälter sollen in 3 Klassen eingeteilt werden
CREATE OR REPLACE VIEW "SNIPPET_OLAP_NTILE" AS
SELECT
  ename,
  hiredate,
  sal,
  NTILE(3) OVER (ORDER BY sal DESC) class
FROM emp;