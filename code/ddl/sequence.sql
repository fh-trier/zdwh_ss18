-- ###################################################
-- #################### SEQUENZ ######################
-- ###################################################

-- Allgemeine Syntax
CREATE SEQUENCE <name_der_sequence>
  [ INCREMENT BY integer ]            -- Bestimmt die ganze Zahl, um die eine SEQUENCE erhöht wird
  [ START WITH integer]               -- Bestimmt die ganze Zahl, mit der die SEQUENCE startet
  [ MAXVALUE integer | NOMAXVALUE ]   -- MAXVALUE: Obere Grenze der SEQUENCE, NOMAXVALUE: Sequenz hat eine Obergrenze von 10^27
  [ MINVALUE integer |NOMINVALUE ]    -- MINVALUE: Untere Grenze der SEQUENCE bei absteigenden SEQUENCEN, NOMINVALUE: SEQUENCE hat keine untere Grenze
  [ CYCLE { NOCYCLE]                  -- Bestimmt, ob nach Erreichen des MAXVALUE bzw. MINVALUE zyklisch weiter vergeben wird
  [ CACHE | NOCACHE]                  -- Bestimmt, wie viele Schlüsselwerte im Hauptspeicher bereitgestellt werden.
  [ ORDER | NOORDER ]
