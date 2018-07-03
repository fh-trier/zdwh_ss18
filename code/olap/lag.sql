-- LAG
-- Beispiel 1:
-- Für jeden Mitarbeiter soll zusätzlich das Gehalt desjenigen Mitarbeiters
-- ausgegeben werden, der unmittelbar vor ihm eingestellt wurde
SELECT  ename,
        hiredate,
        sal,
        LAG(sal,1,9999) OVER(ORDER BY hiredate) Gehalt
FROM emp;