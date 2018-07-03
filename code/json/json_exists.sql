-- Zeige den Index und den Status von
-- allen Weborders an, die einen Status haben.
CREATE OR REPLACE VIEW "SNIPPET_JSON_EXISTS"
SELECT
  JSON_VALUE(jsonord, '$.index' DEFAULT 'NA' ON ERROR) AS "INDEX",
  JSON_VALUE(jsonord, '$.status') AS "STATUS"
FROM weborders
WHERE JSON_EXISTS(jsonord, '$.status');