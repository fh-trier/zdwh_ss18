-- Mustereinstellungen für SQL-Plus
-- Alternativ die Datei glogin.sql im Verzeichnis vom instantclient anpassen!

-- SQL-Plus settings
DEFINE _editor=vim    -- Standart editor
SET NULL (NULL)       -- Festlegung einer Zeichenkette um NULL-Values ab zu bilden.
SET LINESIZE 300      -- Legt die Anzahl der Zeichen als Seitenbreite der Abfrageergebnisse fest.
SET NUMWIDTH 7        -- Legt die Standartlänge für nummerische Werte fest.
SET PAGESIZE 1000     -- Legt die Anzahl an Zeilen pro Seite fest
SET SERVEROUTPUT ON   -- De/Aktiviert die Serverausgabe.
SET SQLPROMPT "_USER'@'_CONNECT_IDENTIFIER> "
SET TRIMSPOOL ON
SET TRIMOUT ON

-- COLUMN FORMATS
COLUMN COLUMN_NAME      FORMAT a16
COLUMN CONSTRAINT_NAME  FORMAT a24
COLUMN DIRECTORY_NAME   FORMAT a14
COLUMN DIRECTORY_PATH   FORMAT a48
COLUMN GRANTABLE        FORMAT a3
COLUMN GRANTEE          FORMAT a16
COLUMN GRANTED_ROLE     FORMAT a16
COLUMN GRANTOR          FORMAT a16
COLUMN Name             FORMAT a32
COLUMN ORIGIN_CON_ID    FORMAT 9999999
COLUMN OWNER            FORMAT a8
COLUMN POSITION         FORMAT 9999999
COLUMN PRIVILEGE        FORMAT a20
COLUMN ROLE             FORMAT a16
COLUMN TABLE_NAME       FORMAT a20
COLUMN TABLE_SCHEMA     FORMAT a8
COLUMN TABTYPE          FORMAT a10
COLUMN TNAME            FORMAT a20
COLUMN TYPE             FORMAT a12
COLUMN Type             FORMAT a24
COLUMN USERNAME         FORMAT a8

-- Session settings
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET QUERY_REWRITE_ENABLED = true;
