-- ###################################################
-- #################### TO_CHAR ######################
-- ###################################################

-- Allgemeine Syntax (Exemplarisch)
SELECT TO_CHAR(<spaltenname>, dd.mm.yyyy)
FROM dual

-- Beispiel 1
SELECT *
FROM receipts r
WHERE TO_CHAR(r.c_DATE, 'dd.mm.yyyy') > '01.01.2016';


