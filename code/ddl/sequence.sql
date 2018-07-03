-- #################### SEQUENZ ######################
-- Allgemeine Syntax
CREATE SEQUENCE <name_der_sequence>
  [ INCREMENT BY integer ]
  [ START WITH integer]
  [ MAXVALUE integer | NOMAXVALUE ]
  [ MINVALUE integer |NOMINVALUE ]
  [ CYCLE { NOCYCLE]
  [ CACHE | NOCACHE]
  [ ORDER | NOORDER ]
