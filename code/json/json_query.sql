-- Gebe zu jeder Bestellung, deren Kunde jünger
-- als 40 Jahre ist, die erste Bestellposition
-- mittels json_query() aus.
CREATE OR REPLACE VIEW "SNIPPET_JSON_QUERY_1" AS
SELECT JSON_QUERY(jsonord, '$.items[0]') items
FROM weborders
WHERE JSON_VALUE(jsonord, '$.age' returning number(3)) < 40;

-- Was geschieht wenn bspw. versucht wird auf
-- gender mittels json_query() zuzugreifen?
-- Wie lässt sich die Ausgabe trotzdem erzwingen?
-- Es wird für jeden Datensatz der die Bedingung
-- erfüllt ein null ausgegeben!!
CREATE OR REPLACE VIEW "SNIPPET_JSON_QUERY_2" AS
SELECT
  JSON_QUERY(
    jsonord, '$.gender' WITH CONDITIONAL WRAPPER
  ) AS "ITEMS"
FROM weborders
WHERE JSON_VALUE(jsonord, '$.age' RETURNING NUMBER(3)) < 40;