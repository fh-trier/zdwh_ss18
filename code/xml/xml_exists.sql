SELECT deptno
FROM dept_xml
WHERE XMLEXISTS('/department/manager' PASSING XMLDATA);