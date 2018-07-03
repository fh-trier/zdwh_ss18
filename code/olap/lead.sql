-- Für jeden Mitarbeiter soll zusätzlich das Gehalt desjenigen
-- Mitarbeiters ausgegeben werden, der unmittelbar nach ihm
-- eingestellt wurde
CREATE OR REPLACE VIEW "SNIPPET_OLAP_LEAD" AS
SELECT
  ename,
  hiredate,
  sal,
  LEAD(sal,1,9999) OVER(ORDER BY hiredate) AS "Gehalt"
FROM emp;
