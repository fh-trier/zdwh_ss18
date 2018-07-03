-- Erzeuge folgende Bestellübersicht,
-- in der nur Bestellungen aus 2014 berücksichtigt werden:
CREATE OR REPLACE VIEW "SNIPPET_JSON_VALUE" AS
SELECT
  JSON_VALUE(jsonord, '$.firstname') AS "FIRST",
  JSON_VALUE(jsonord, '$.lastname') AS "LAST",
  JSON_VALUE(jsonord, '$.gender') AS "GEND",
  JSON_VALUE(jsonord, '$.phone') AS "PHONE"
FROM weborders
WHERE SUBSTR(JSON_VALUE(jsonord, '$.registered'),0, 4) = '2014';