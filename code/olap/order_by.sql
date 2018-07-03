-- ORDER BY
-- Beispiel 1:
--  Für jeden Mitarbeiter soll die Summe seines Gehalts und des jener Mitarbeiter ausgeben werden, die vor ihm bzw. gleichzeitig eingestellt wurde

SELECT ename,
       deptno,
       job,
       sal,
       SUM(sal) OVER (ORDER BY hiredate) "Summe Gehalt"
FROM emp;

-- Beispiel: Für jeden Mitarbeiter soll die Summe seines Gehalts und des jener Mitarbeiter ausgeben werden, die vor ihm bzw. gleichzeitig eingestellt wurden.
-- Zusätzlich soll sein Gehalt und das aller Mitarbeiter, die nach ihm bzw.
-- gleichzeitig eingestellt wurden, dargestellt werden.
SELECT  ename,
        deptno,
        hiredate,
        SUM(sal) OVER (ORDER BY hiredate) SUMASC,
        SUM(sal) OVER (ORDER BY hiredate DESC) SUMDESC
FROM emp;