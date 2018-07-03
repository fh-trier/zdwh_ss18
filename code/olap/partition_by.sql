-- Für jeden Mitarbeiter soll die Summe der Gehälter
-- innerhalb seiner Abteilung ausgegeben werden
CREATE OR REPLACE VIEW "SNIPPET_OLAP_PARTITION_BY_1" AS
SELECT
  ename,
  deptno,
  job,
  sal,
  SUM(sal) OVER (PARTITION BY deptno) AS "SUM_SALARY"
FROM emp;

-- Für jeden Mitarbeiter soll die Summe der Gehälter
-- innerhalb seiner Abteilung mit dem gleichen Job ausgegeben
-- werden
CREATE OR REPLACE VIEW "SNIPPET_OLAP_PARTITION_BY_2" AS
SELECT
  ename,
  deptno,
  job,
  sal,
  SUM(sal) OVER (PARTITION BY deptno, job) AS "SUM_SALARY"
FROM emp;