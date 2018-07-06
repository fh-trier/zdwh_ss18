SELECT
  XMLSERIALIZE(DOCUMENT
    XMLELEMENT("Mitarbeiter",
      XMLCOMMENT('Hier steht ein Kommentar'),
      XMLELEMENT("Vorname", e.first_name)
    ) AS CLOB INDENT SIZE = 2
  ) ergebnis
FROM employees e
WHERE e.department_id <= 20;