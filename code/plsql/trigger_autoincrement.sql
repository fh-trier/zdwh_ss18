-- ###################################################
-- #################### INTERVAL #####################
-- ###################################################

-- Sequenz erstellen
CREATE SEQUENCE seq1
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
CACHE 20;

-- Trigger erstellen mit AutoIncrement
CREATE OR REPLACE TRIGGER tri1
BEFORE INSERT OR UPDATE OF tbl1 ON col1
FOR EACH ROW
DECLARE

BEGIN
  IF UPDATING('col1') THEN
    RAISE_APPLICATION_ERROR(-20001, 'col1 darf nicht verändert werden!');
  END IF;

  IF INSERTING THEN
    :NEW.col1 := seq1.NEXTVAL;
  END IF;
END;
/
