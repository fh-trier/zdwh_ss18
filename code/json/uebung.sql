-- Hinweis: Für diese aufgaben muss die Datei orderdata.sql eingelesen sein.
-- In dieser gibt es eine Tabelle weborders, welche eine Spalte jsonord besitzt (JSON-Format)

-- Aufgabe 1:
-- Erzeuge folgende Bestellübersicht, in der nur Bestellungen aus 2014 berücksichtigt werden:
-- a) Mithilfe der Funktion json_value()
SELECT JSON_VALUE(jsonord, '$.firstname') first,
       JSON_VALUE(jsonord, '$.lastname') last,
       JSON_VALUE(jsonord, '$.gender') gend,
       JSON_VALUE(jsonord, '$.phone') phone
FROM weborders
WHERE SUBSTR(JSON_VALUE(jsonord, '$.registered'),0, 4) = '2014';

-- b) Mithilfe der Funktion json_table()
SELECT m.first, m.last, m.gend, m.phone
FROM weborders,
     JSON_TABLE(
       jsonord,
      '$' COLUMNS first VARCHAR2(30) PATH '$.firstname',
                  last VARCHAR2(30) PATH '$.lastname',
                  gend VARCHAR2(30) PATH '$.gender',
                  phone VARCHAR2(30) PATH '$.phone',
                  regist VARCHAR2(40) PATH '$.registered'
     ) m
WHERE SUBSTR(m.regist,0,4) = '2014';


-- Aufgabe 2:
-- a) Gebe zu jeder Bestellung, deren Kunde jünger als 40 Jahre ist, die erste Bestellposition mittels
-- json_query() aus.
SELECT JSON_QUERY(jsonord, '$.items[0]') items
FROM weborders
WHERE JSON_VALUE(jsonord, '$.age' returning number(3)) < 40;

-- b) Was geschieht wenn bspw. versucht wird auf gender mittels json_query() zuzugreifen? Wie lässt sich
-- die Ausgabe trotzdem erzwingen?
-- !!Es wird für jeden Datensatz der die Bedingung erfüllt ein null ausgegeben!!
SELECT JSON_QUERY(jsonord, '$.gender' WITH CONDITIONAL WRAPPER) items
FROM weborders
WHERE JSON_VALUE(jsonord, '$.age' RETURNING NUMBER(3)) < 40;


-- Aufgabe 3:
-- Erzeuge folgende Übersicht, aus der hervorgeht, welche Produkte bestellt wurden.
SELECT m.*
FROM weborders,
     JSON_TABLE(jsonord,
                '$' COLUMNS
                  last VARCHAR2(30) PATH '$.lastname',
                  gend VARCHAR2(30) PATH '$.gender',
                  phone VARCHAR2(30) PATH '$.phone',
                  NESTED PATH '$.items[*]' COLUMNS (
                    prod_id NUMBER(8) PATH '$.product_id',
                    quant NUMBER(8) PATH '$.quantity'
                  )
               ) m;


-- Aufgabe 4: Erzeuge eine Übersicht, die für alle Webkunden die abgesetzte Menge je aktivem und nicht
-- aktivem Mitglied sowie die insgesamt abgesetzte Menge zurückgibt.
SELECT m.active,
       SUM(m.quant) sumQuant
FROM weborders,
     JSON_TABLE(jsonord,
                '$' COLUMNS
                  active VARCHAR2(40) PATH '$.active',
                  NESTED PATH '$.items[*]' COLUMNS (
                    quant VARCHAR2(30) PATH '$.quantity'
                  )
               ) m
GROUP BY ROLLUP(m.active);


-- Aufgabe 5:
-- Gebe für jeden Monat im Jahr 2015 die Top-2 Webkunden aus, welche die meisten Produkte bestellt haben.
SELECT *
FROM (
  SELECT m.firstname,
         m.lastname,
         SUBSTR(m.reg,0,7) month,
         SUM(quant) quantPerCust,
         RANK() OVER(PARTITION BY SUBSTR(reg,0,7) ORDER BY SUM(quant) DESC) rang
  FROM weborders,
       JSON_TABLE(jsonord, '$' COLUMNS
                    firstname VARCHAR2(30) PATH '$.firstname',
                    lastname VARCHAR2(30) PATH '$.lastname',
                    reg VARCHAR2(30) PATH '$.registered',
                    NESTED PATH '$.items[*]'
                      COLUMNS (quant NUMBER(8) PATH '$.quantity')
                 ) m
  WHERE SUBSTR(reg,0,4) = '2015'
  GROUP BY firstname, lastname, substr(reg,0,7)
)
WHERE rang <= 2;


-- Aufgabe 6:
-- Gebe für jeden Webkunden die Anzahl der insgesamt georderten Bestellpositionen zurück.
SELECT m.firstname,
       m.lastname,
       COUNT(m.quant)
FROM weborders,
     JSON_TABLE(jsonord, '$' COLUMNS
      firstname VARCHAR2(30) PATH '$.firstname',
      lastname VARCHAR2(30) PATH '$.lastname',
      NESTED PATH '$.items[*]' COLUMNS (quant NUMBER(8) PATH '$.quantity')
     ) m
GROUP BY firstname, lastname;


-- Aufgabe 7:
-- Zeige den Index und den Status von allen Weborders an, die einen Status haben.
SELECT JSON_VALUE(jsonord, '$.index' default 'NA' on error) "INDEX",
	     JSON_VALUE(jsonord, '$.status') "STATUS"
FROM weborders
WHERE JSON_EXISTS(jsonord, '$.status');
