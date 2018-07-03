-- ############## USER_CONS_COLUMNS ##################
-- C = CHECK CONSTRAINT
-- R = FOREIGEN KEY
-- P = PRIMATY KEY
-- U = UNIQUE KEY

-- SQL-Plus Einstellungen
COLUMN Typ FORMAT a1
COLUMN Constraint FORMAT a15
COLUMN H-Tabelle FORMAT a15
COLUMN R-Tabelle FORMAT a15
COLUMN Spalte FORMAT a15

-- Abfrage
SELECT
  uc.constraint_type AS "Typ",
  uc.constraint_name AS "Constraint",
  uc.table_name AS "H-Tabelle",
  ucc.table_name AS "R-Tabelle",
  ucc.column_name AS "Spalte"
FROM user_constraints uc
  LEFT JOIN user_cons_columns ucc ON (ucc.constraint_name = uc.r_constraint_name)
WHERE REGEXP_LIKE(uc.table_name, 'EMP', 'i');
