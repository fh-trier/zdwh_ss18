-- Gelöschte Tabellen sind als BIN$ gekennzeichnet
SELECT tname
FROM tab;

-- Papierkorb aufräumen
-- Alle Tabellen im Papierkorb löschen
PURGE RECYCLEBIN;

-- Papierkorb Inhalt anzeigen
SELECT *
FROM recyclebin;

-- Papierkorb beschreibung
DESC recyclebin;

-- Tabelle löschen trotz Constraints
DROP TABLE <tbl> CASCADE CONSTRAINTS;

-- Tabelle endgültig löschen
DROP TABLE <tbl> PURGE;

-- Tabelle engültig löschen trotz Constraints
DROP TABLE <tbl> CASCADE CONSTRAINTS PURGE;

-- Wiederherstellen einer Tabelle
FLASHBACK TABLE <tbl> TO BEFORE DROP;

-- Mehrere Ressourcen löschen
BEGIN
  FOR cur_rec IN (
    SELECT object_name, object_type
    FROM user_objects
    WHERE object_type IN (
      'TABLE',
      'VIEW',
      'PACKAGE',
      'PROCEDURE',
      'FUNCTION',
      'SEQUENCE',
      'SYNONYM',
      'PACKAGE BODY',
      'TYPE'
    )
  )
  LOOP
    BEGIN
      IF cur_rec.object_type = 'TABLE' THEN
        EXECUTE IMMEDIATE 'DROP ' || cur_rec.object_type || ' "' || cur_rec.object_name || '" CASCADE CONSTRAINTS';
      ELSE
        EXECUTE IMMEDIATE 'DROP ' || cur_rec.object_type || ' "' || cur_rec.object_name || '"';
      END IF;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE (
          'FAILED: DROP ' || cur_rec.object_type || ' "' || cur_rec.object_name || '"');
    END;
  END LOOP;
END;
/
