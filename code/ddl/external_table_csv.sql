CREATE TABLE "KDWH_SS17_A2A_BESTELLUNG" (
  "BESTELLNR"     NUMBER,
  "KUNDENNR"      NUMBER,
  "BESTELLDATUM"  DATE,
  "LIEFERDATUM"   DATE
)
ORGANIZATION EXTERNAL (
  TYPE ORACLE_LOADER
  DEFAULT DIRECTORY STUDENT_DIR
  ACCESS PARAMETERS (
    RECORDS DELIMITED BY NEWLINE
    NOBADFILE
    NOLOGFILE
    NODISCARDFILE
    FIELDS TERMINATED BY ','
    OPTIONALLY enclosed by '"'
    MISSING FIELD values are null
    (
      BESTELLNR,
      KUNDENNR,
      BESTELLDATUM DATE 'DD-MON-YY',
      LIEFERDATUM DATE 'DD-MON-YY'
    )
  )
  LOCATION ('BESTELLUNG.csv')
)
REJECT LIMIT UNLIMITED;
/