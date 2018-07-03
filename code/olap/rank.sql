-- Rank
-- Top N Abfragen
-- Beispiel 1:
-- Geben Sie die 3 Mitarbeiter mit dem geringsten Gehalt aus
SELECT *
FROM (
    SELECT ename,
           hiredate,
           sal,
           RANK() OVER(ORDER BY sal) rang
    FROM emp
)
WHERE rang < 4;