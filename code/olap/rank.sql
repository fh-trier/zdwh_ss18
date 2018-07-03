-- Geben Sie die 3 Mitarbeiter mit dem geringsten Gehalt aus
CREATE OR REPLACE VIEW "SNIPPET_OLAP_RANK_1" AS
SELECT *
FROM (
  SELECT
    ename,
    hiredate,
    sal,
    RANK() OVER(ORDER BY sal) AS "RANG"
  FROM emp
)
WHERE rang < 4;