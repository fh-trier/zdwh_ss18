-- ###################################################
-- ################## RECYCLEBIN #####################
-- ###################################################

-- Gelöschte Tabellen sind bin BIN$ gekennzeichnet
SELECT tname
FROM tab
WHERE REGEXP_LIKE(tname, 'BIN\\$', 'i');

-- Papierkorb löschen
PURGE RECYCLEBIN;

-- Papierkorb Inhalt anzeigen
SELECT *
FROM recyclebin;

-- Papierkorb beschreibung
DESC recyclebin;

-- Tabelle löschen trotz Constraint
DROP TABLE <table_name> CASCADE CONSTRAINTS;

-- Tabelle endgültig löschen
DROP TABLE <table_name> PURGE;

-- Alle Tabellen löschen
begin
  for tbl in (SELECT table_name FROM user_tables) loop
    EXECUTE IMMEDIATE 'DROP TABLE ' || tbl.table_name || ' CASCADE CONSTRAINTS PURGE';
  end loop;
end;

-- Wiederherstellen einer Tabelle
FLASHBACK TABLE HUGO TO BEFORE DROP;
