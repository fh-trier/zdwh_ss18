SELECT
  XMLSERIALIZE(DOCUMENT
    XMLELEMENT("Mitarbeiter",
      XMLATTRIBUTES(e.employee_id "ID"),
      XMLFOREST(
        e.first_name "NAME",
        e.job_id "JOB_ID",
        e.salary "Gehalt"
      )
    ) AS CLOB INDENT SIZE = 2
  ) ergebnis
FROM employees e
WHERE e.department_id <= 20;