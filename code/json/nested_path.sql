-- Erzeuge folgende Übersicht, aus der hervorgeht,
-- welche Produkte bestellt wurden.
CREATE OR REPLACE VIEW "SNIPPET_JSON_NESTED_PATH_1" AS
SELECT m.*
FROM weborders,
     JSON_TABLE(
      jsonord,
      '$' COLUMNS
        last VARCHAR2(30) PATH '$.lastname',
        gend VARCHAR2(30) PATH '$.gender',
        phone VARCHAR2(30) PATH '$.phone',
        NESTED PATH '$.items[*]' COLUMNS (
          prod_id NUMBER(8) PATH '$.product_id',
          quant NUMBER(8) PATH '$.quantity'
        )
    ) m;

-- Erzeuge eine Übersicht, die für alle Webkunden die
-- abgesetzte Menge je aktivem und nicht aktivem
-- Mitglied sowie die insgesamt abgesetzte Menge
-- zurückgibt.
CREATE OR REPLACE VIEW "SNIPPET_JSON_NESTED_PATH_2" AS
SELECT
  m.active,
  SUM(m.quant) AS "sumQuant"
FROM
  weborders,
  JSON_TABLE(
    jsonord,
    '$' COLUMNS
      active VARCHAR2(40) PATH '$.active',
      NESTED PATH '$.items[*]' COLUMNS (
        quant VARCHAR2(30) PATH '$.quantity'
      )
  ) m
GROUP BY ROLLUP(m.active);