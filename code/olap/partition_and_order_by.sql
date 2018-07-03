-- Partition und Order By
-- Beispiel 1:
-- Für jeden Mitarbeiter soll die Summe seines Gehalts und das Gehalt aller
-- Mitarbeiter in seiner Abteilung ausgegeben werden, die vor ihm/gleichzeitig eingestellt wurden.
SELECT  ename,
        deptno,
        hiredate,
        sal,
        RSUM(sal) OVER (PARTITION BY deptno ORDER BY hiredate) sl
FROM emp;