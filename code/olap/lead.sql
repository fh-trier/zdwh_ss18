-- LEAD
-- Beispiel 1:
-- Für jeden Mitarbeiter soll zusätzlich das Gehalt desjenigen Mitarbeiters
-- ausgegeben werden, der unmittelbar nach ihm eingestellt wurde
SELECT  ename,
        hiredate,
        sal,
        LEAD(sal,1,9999) OVER(ORDER BY hiredate) Gehalt
FROM emp;

