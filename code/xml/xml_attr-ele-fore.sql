SELECT
  XMLELEMENT("department",
    XMLELEMENT("name",
      XMLATTRIBUTES(
        d.department_id as "deptno"
      ),
      department_name
    ),
    XMLFOREST(
      e.last_name as "manager",
      l.city as "city"
    )
  )
FROM departments d
  INNER JOIN locations l ON (d.location_id = l.location_id)
  LEFT JOIN employees e ON (d.manager_id = e.employee_id);