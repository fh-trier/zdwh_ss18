-- FIRST / LAST
-- Beispiel 1:
-- Gebe für jeden Mitarbeit aus, wie hoch die durchschnittliche
-- Commission derjenigen ist, die das niedrigste Gehalt haben.
SELECT ename,
       comm,
       sal,
       AVG(comm) KEEP(DENSE_RANK FIRST ORDER BY sal) OVER() avgcom
FROM emp;