-- ################### FOR UPDATE ####################
-- Repeatable Read bedeutet,
-- dass wenn ein SELECT ausgeführt wird, der Zustand bei einem
-- Update derselbe ist wie bei der, der bei dem SELECT angezeigt
-- wurde. Es könnte ja sein, dass sonst in einer anderen
-- Transaktion eine Spalte geändert wurde.
SELECT a.note
FROM anmeldung a
FOR UPDATE;
