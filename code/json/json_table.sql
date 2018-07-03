-- Erzeuge folgende Bestellübersicht,
-- in der nur Bestellungen aus 2014 berücksichtigt werden:
CREATE VIEW AS "SNIPPET_JSON_TABLE" AS
SELECT
  m.first AS "FIRST",
  m.last AS "LAST",
  m.gend AS "GEND",
  m.phone AS "PHONE"
FROM weborders,
     JSON_TABLE(
       jsonord,
      '$' COLUMNS
        first VARCHAR2(30) PATH '$.firstname',
        last VARCHAR2(30) PATH '$.lastname',
        gend VARCHAR2(30) PATH '$.gender',
        phone VARCHAR2(30) PATH '$.phone',
        regist VARCHAR2(40) PATH '$.registered'
     ) m
WHERE SUBSTR(m.regist,0,4) = '2014';