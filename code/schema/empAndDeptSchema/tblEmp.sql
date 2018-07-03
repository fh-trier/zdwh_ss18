CREATE TABLE emp(
  empno     NUMBER(4,0),
  ename     VARCHAR2(10),
  job       VARCHAR2(9),
  mgr       NUMBER(4,0),
  hiredate  DATE,
  sal       NUMBER(7,2),
  comm      NUMBER(7,2),
  deptno    NUMBER(2,0),
  CONSTRAINT pk_emp PRIMARY KEY (empno),
  CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
);