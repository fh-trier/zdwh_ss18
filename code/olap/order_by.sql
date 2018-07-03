-- Für jeden Mitarbeiter soll die Summe seines Gehalts
-- und des jener Mitarbeiter ausgeben werden, die vor
-- ihm bzw. gleichzeitig eingestellt wurde
CREATE OR REPLACE VIEW "SNIPPET_OLAP_ORDER_BY_1" AS
SELECT
  ename,
  deptno,
  job,
  sal,
  SUM(sal) OVER (ORDER BY hiredate) "Summe Gehalt"
FROM emp;

-- Für jeden Mitarbeiter soll die Summe seines Gehalts
-- und des jener Mitarbeiter ausgeben werden, die vor
-- ihm bzw. gleichzeitig eingestellt wurden.
-- Zusätzlich soll sein Gehalt und das aller Mitarbeiter,
-- die nach ihm bzw. gleichzeitig eingestellt wurden,
-- dargestellt werden.
CREATE OR REPLACE VIEW "SNIPPET_OLAP_ORDER_BY_2" AS
SELECT
  ename,
  deptno,
  hiredate,
  SUM(sal) OVER (ORDER BY hiredate AS) AS "SUM_ASC",
  SUM(sal) OVER (ORDER BY hiredate DESC) AS "SUM_DESC"
FROM emp;