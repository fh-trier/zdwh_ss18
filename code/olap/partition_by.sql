-- Partition By
-- Beispiel 1:
-- Für jeden Mitarbeiter soll die Summe der Gehälter innerhalb seiner Abteilung ausgegeben werden
SELECT  ename,
        deptno,
        job,
        sal,
        SUM(sal) OVER (PARTITION BY deptno) "Summe Gehalt"
FROM emp;

-- Beispiel 2:
-- Für jeden Mitarbeiter soll die Summe der Gehälter innerhalb seiner Abteilung mit dem gleichen Job ausgegeben werden
SELECT  ename,
        deptno,
        job,
        sal,
        SUM(sal) OVER (PARTITION BY deptno, job) "Summe Gehalt"
FROM emp;