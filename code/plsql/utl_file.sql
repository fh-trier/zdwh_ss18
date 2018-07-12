SET serverout on;

DECLARE
  v_Line VARCHAR2(32767);
  v_File_Handler UTL_FILE.FILE_TYPE;
  FELD VARCHAR2(20);
  v_Count_Field_Seperator number := 0;
BEGIN
  -- Open FileHandler
  v_File_Handler := UTL_FILE.FOPEN('STUDENT_DIR', 'FF_KUNDEN_TRIER.csv','R');

  -- Write 32767 Bytes in v_Line
  UTL_FILE.GET_LINE(v_File_Handler, v_Line, 32767);

  -- Count numbers of field seperator in v_Line
  FOR i IN 1..LENGTH(v_Line) LOOP
    IF SUBSTR(v_Line, i,1) = ';' THEN
      v_Count_Field_Seperator := v_Count_Field_Seperator + 1;
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Anzahl Trennzeichen in erstem Satz: ' || v_Count_Field_Seperator);

  -- Write n Lines on stdout
  FOR i IN 1..100 LOOP
     DBMS_OUTPUT.PUT_LINE(v_Line);
  END LOOP;
  UTL_FILE.FCLOSE(v_File_Handler);
END;
/