-- Für jeden Mitarbeiter soll die Summe seines Gehalts
-- und das Gehalt aller Mitarbeiter in seiner Abteilung
-- ausgegeben werden, die vor ihm/gleichzeitig eingestellt wurden.
CREATE OR REPLACE VIEW "SNIPPET_OLAP_PARTITION_ORDER_BY" AS
SELECT
  ename,
  deptno,
  hiredate,
  sal,
  SUM(sal) OVER (PARTITION BY deptno ORDER BY hiredate) AS "sl"
FROM emp;