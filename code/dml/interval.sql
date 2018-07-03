
-- #################### INTERVAL #####################
-- Beispiel 1
-- Das heutige Datum plus 2 Jahre, 4 Monate, 8 Tage
SELECT SYSDATE + INTERVAL '2' YEAR + INTERVAL '4' MONTH + INTERVAL '8' DAY
FROM dual;

-- Beispiel 2
-- Personen alter 18 Jahre
SELECT vorname, nachname, geburtstag
FROM person
WHERE geburtstag < SYSDATE - INTERVAL '18' YEAR;
