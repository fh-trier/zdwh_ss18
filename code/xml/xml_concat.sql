SELECT
  XMLCONCAT(
    XMLELEMENT("Vorname", e.first_name),
    XMLELEMENT("Nachname", e.last_name)
  ) AS "ERGEBNIS"
FROM employees e
WHERE department_id <= 20;