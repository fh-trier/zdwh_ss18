-- Gebe für jeden Mitarbeit aus, wie hoch die durchschnittliche
-- Commission derjenigen ist, die das niedrigste Gehalt haben.
CREATE OR REPLACE VIEW "SNIPPET_OLAP_FIRST" AS
SELECT
  ename,
  comm,
  sal,
  AVG(comm) KEEP(DENSE_RANK FIRST ORDER BY sal) OVER() AS "AVG_SAL"
FROM emp;

CREATE OR REPLACE VIEW "SNIPPET_OLAP_LAST" AS
SELECT
  ename,
  comm,
  sal,
  AVG(comm) KEEP(DENSE_RANK LAST ORDER BY sal) OVER() AS "AVG_SAL"
FROM emp;