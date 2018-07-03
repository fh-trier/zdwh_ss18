-- Für jeden Mitarbeiter soll das Durchschnittsgehalt zwischen
-- ihm und den Personen ermittelt werden, die unmittelbar vor
-- und nach ihm eingestellt wurden.
CREATE OR REPLACE VIEW "SNIPPET_OLAP_WINDOWING_1" AS
SELECT
  ename,
  deptno,
  hiredate,
  sal,
  AVG(sal) OVER (ORDER BY hiredate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS "AVG"
FROM emp;

-- Für jeden Mitarbeiter soll das Durchschnittsgehalt zwischen
-- ihm und den Personen ermittelt werden, die vor ihm eingestellt
-- wurden.
CREATE OR REPLACE VIEW "SNIPPET_OLAP_WINDOWING_2" AS
SELECT
  ename,
  deptno,
  hiredate,
  sal,
  AVG(sal) OVER (ORDER BY hiredate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "AVG"
FROM emp;

-- Für jeden Mitarbeiter wird die durchschnittliche Provision
-- aller Mitarbeiter angegeben, die höchstens 200 weniger und
-- 300 mehr verdienen.
CREATE OR REPLACE VIEW "SNIPPET_OLAP_WINDOWING_3" AS
SELECT
  ename,
  deptno,
  hiredate,
  sal,
  AVG(comm) OVER (ORDER BY sal RANGE BETWEEN 200 PRECEDING AND 300 FOLLOWING) AS "AVG"
FROM emp;