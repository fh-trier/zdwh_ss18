-- Windowing
-- Beispiel 1:
-- Für jeden Mitarbeiter soll das Durchschnittsgehalt zwischen ihm und den
-- Personen ermittelt werden, die unmittelbar vor und nach ihm eingestellt wurden.
SELECT  ename,
        deptno,
        hiredate,
        sal,
        AVG(sal) OVER (ORDER BY hiredate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) "Durchschnittsgehalt"
FROM emp;

-- Beispiel 2:
-- Für jeden Mitarbeiter soll das Durchschnittsgehalt zwischen ihm und den
-- Personen ermittelt werden, die vor ihm eingestellt wurden.
SELECT  ename,
        deptno,
        hiredate,
        sal,
        AVG(sal) OVER (ORDER BY hiredate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "Durchschnitt"
FROM emp;

-- Beispiel 3:
-- Für jeden Mitarbeiter wird die durchschnittliche Provision aller Mitarbeiter
-- angegeben, die höchstens 200 weniger und 300 mehr verdienen.
SELECT  ename,
        deptno,
        hiredate,
        sal,
        AVG(comm) OVER (ORDER BY sal RANGE BETWEEN 200 PRECEDING AND 300 FOLLOWING) avgcm
FROM emp;