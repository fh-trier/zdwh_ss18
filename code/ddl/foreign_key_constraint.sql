-- ############ FOREIGN KEY CONSTRAINT ###############
-- Allgemeine Syntax
ALTER TABLE <tabellenname>
ADD CONSTRAINT <constraintname>
  FOREIGN KEY(spl [,sp2..])
  REFERENCES <name referenzierte tabelle>
  [ON DELETE CASCADE|ON DELETE SET NULL]
  [INITIALLY DEFERRED| INITIALLY IMMEDIATE] [DEFERRABLE];

-- Beziehung mit einem Fremdschlüssel
ALTER TABLE kdn_beinhaltet
ADD CONSTRAINT "FK_VERKAUF_BEINHALTET"
  FOREIGN KEY (vnr)
  REFERENCES kdn_verkauf(vnr);

-- Beziehung mit zwei Fremdschlüsseln
ALTER TABLE klaus_bezieh_angebo
ADD CONSTRAINT "FK_KLAUS_BEZIEH_ANGEBO_ANGEBOT"
  FOREIGN KEY (studiengangnr, fachnr)
  REFERENCES angebot(studiengangnr, fachnr);

-- DEFERRABLE Constraints, Verzögert die Constraintüberprüfung
-- bis zur Eingabe eines COMMITs. Um das Standard-Verhalten
-- eines DEFERABLE Constraints festzulegen, kann er mit der
-- Klausel INITIALLY IMMEDIATE (sofortige Prüfung) oder
-- INITIALLY DEFERRED (verzögerte Prüfung) definiert werden.

-- DEFERRABLE INITIALLY DEFERRED
ALTER TABLE klaus_bezieh_angebo
ADD CONSTRAINT "FK_KLAUS_BEZIEH_ANGEBO_KLAUSUNR"
  FOREIGN KEY (klausurnr)
  REFERENCES KLAUSUR (klausurnr)
  DEFERRABLE INITIALLY DEFERRED;

-- DEFERRABLE INITIALLY ENABLED
ALTER TABLE klaus_bezieh_angebo
ADD CONSTRAINT "FK_KLAUS_BEZIEH_ANGEBO_KLAUSUNR"
  FOREIGN KEY (klausurnr)
  REFERENCES KLAUSUR (klausurnr)
  DEFERRABLE INITIALLY ENABLED;
