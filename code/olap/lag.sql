-- Für jeden Mitarbeiter soll zusätzlich das Gehalt desjenigen
-- Mitarbeiters ausgegeben werden, der unmittelbar vor ihm
-- eingestellt wurde
CREATE OR REPLACE VIEW "SNIPPET_OLAP_LAG" AS
SELECT
  ename,
  hiredate,
  sal,
  LAG(sal,1,9999) OVER(ORDER BY hiredate) AS "Gehalt"
FROM emp;