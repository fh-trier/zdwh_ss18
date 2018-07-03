-- ###################################################
-- #################### TO_DATE ######################
-- ###################################################

-- Allgemeine Syntax (Exemplarisch)
TO_DATE('01.01.2016', dd.mm.yyyy)

-- Beispiel 1
SELECT *
FROM receipts r
WHERE r.c_date > TO_DATE('01.01.2016', 'dd.mm.yyyy');