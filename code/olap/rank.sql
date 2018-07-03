-- Geben Sie die 3 Mitarbeiter mit dem geringsten Gehalt aus
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