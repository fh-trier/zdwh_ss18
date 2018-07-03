-- ############## CHECK CONSTRAINT ###################
-- Allgemeine Syntax
ALTER TABLE <HAUPTTABELLE>
ADD CONSTRAINT <BEZEICHNUNG>
  CHECK (<BEDINGUNG>);

-- Beispiel 1
ALTER TABLE kdn_artikel
ADD CONSTRAINT "c_med_rez"
CHECK (
  (medikament = 0 OR medikament = 1) AND
  (rezeptpflichtig = 0 OR rezeptpflichtig = 1)
);

-- Alternative zu Beispiel 1
ALTER TABLE KDN_Artikel
ADD CONSTRAINT "c_med_rez2"
CHECK (
  medikament IN (0,1) AND
  rezeptpflichtig IN (0,1)
);
