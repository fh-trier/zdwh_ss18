SELECT
  XMLROOT(
    XMLELEMENT("Mitarbeiter",
      XMLATTRIBUTES(e.employee_id "ID"),
      XMLELEMENT("Vorname", e.first_name)
    ), VERSION '1.1.7.0'
  ) ergebnis
FROM employees e
WHERE e.department_id = 40;