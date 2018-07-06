SELECT
  XMLSERIALIZE(DOCUMENT
    XMLELEMENT("Mitarbeiter",
      XMLAGG(
        ("Vorname", e.first_name)
      )
    ) AS CLOB INDENT SIZE = 2
  ) ergebnis
FROM employees e
WHERE e.department_id <= 40
GROUP BY e.department_id;