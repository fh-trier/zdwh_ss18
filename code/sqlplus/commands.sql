SET NULL (NULL)                       -- Kennzeichnet Null-Werte als (NULL) und nicht als blank
cl scr                                -- Gibt eine leere Anzeige aus
DESC emp                              -- Gibt die Spalten einer Tablle (emp) aus
SET numwidth 7                        -- Setzt die
SET pagesize 100                      -- Setzt die Zeileneinträge auf 100 bevor der Spaltenname wieder eingeblendet wird
COLUMN <spaltenname> FORMAT a<Länge>  -- Setzt in SQL die Ausgabe der Spalte <Spaltenname> aus eine <Länge> fest
save k:\peschm\auf1                   -- Speichert die Letzte SQL-Ausgabe unter k:\pesch\auf1
define _editor=notepad                -- Definiert in SQL-PLUS den Editor
edit                                  -- Zum Bearbeiten des letzten SQL Statements im Editor
SELECT * FROM tab;                    -- Gibt alle Tablennamen mit SPalten aus
SET serveroutput                      -- Ermöglicht die Ausgabe von Servermeldungen in SQL-PLUS
show errors;                          -- Gibt einen detailierten Bericht über die letzte Fehlermeldung aus
SET escape '\'                        -- Setzt ein Escape Zeichen fest

