-- NTILE
-- Beispiel 1
-- Die Mitarbeitergehälter sollen in 3 Klassen eingeteilt werden
SELECT  ename,
        hiredate,
        sal,
        NTILE(3) OVER (ORDER BY sal DESC) class
FROM emp;