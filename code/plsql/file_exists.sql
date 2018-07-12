SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE FileExists(
  inDirName IN VARCHAR2,
  inFileName IN VARCHAR2
)
IS
  vFileLoc bfile;
BEGIN
  vFileLoc := BFILENAME(UPPER(inDirName), inFileName);
  IF DBMS_LOB.FILEEXISTS(vFileLoc) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('FILE EXISTS ON ' || UPPER(inDirName) || '/' || inFileName);
  ELSE
    DBMS_OUTPUT.PUT_LINE('FILE DOES NOT EXISTS!');
  END IF;
END;
/

-- Execure Procedure
EXEC FileExists('student_dir','BESTELLUNG.csv');
