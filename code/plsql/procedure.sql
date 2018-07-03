-- Serverausgaben einschalten
SET serveroutput ON;

-- Prozedur
CREATE OR REPLACE PROCEDURE get_klausurfach_info(
  klausurnr_in IN NUMBER,
  bez_out OUT VARCHAR2)
AS

BEGIN
  SELECT DISTINCT(f.bezeichnung) INTO bez_out
  FROM fach f
    INNER JOIN klaus_bezie_angebo kba ON (kba.fachnr = f.fachnr)
  WHERE kba.klausurnr = klausurnr_in;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001,'Klausur oder Fach nicht vorhanden!');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001,SQLERRM);
END;
/

-- Prozedur ausführen
DECLARE
  bezeichnung VARCHAR2(50);
BEGIN
  get_klausurfach_info(4, bezeichnung);
  DBMS_OUTPUT.PUT_LINE(bezeichnung);
END;
/