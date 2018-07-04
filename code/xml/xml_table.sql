SELECT x.*
FROM
  dept_xml d,
  XMLTABLE('/department' PASSING d.xmldata COLUMNS
    deptno NUMBER PATH 'name/@deptno',
    name VARCHAR2(50) PATH 'name',
    manager VARCHAR2(15) PATH 'manager' DEFAULT 'none',
    city VARCHAR2(25) PATH 'city'
  ) x;