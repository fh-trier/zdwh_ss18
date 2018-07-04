-- #################### SEQUENZ ######################
-- Allgemeine Syntax
CREATE OR REPLACE VIEW <VIEW_NAME> AS
  <SQL_STATEMENT>

-- Beispiel 1
CREATE OR REPLACE VIEW "artikel" AS
  SELECT *
  FROM artikel

-- Beispiel 2
CREATE OR REPLACE VIEW "empdept" AS
  SELECT e.empno, e.ename, d.dname, d.loc
  FROM emp e
    INNER JOIN dept d ON (e.deptno = d.deptno)
  WHERE d.deptno IN (10, 20);
