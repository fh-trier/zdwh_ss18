CREATE OR REPLACE PROCEDURE "timeDim" (
  startDate IN VARCHAR2,
  endDate IN VARCHAR2)
IS
  timeOfDay CHAR(2);
  startTime TIMESTAMP;
  endTime TIMESTAMP;
  weekStart NUMBER(1) := 0; --0 entspricht Wochenstart Montag
                            --1 entspricht Wochenstart Sonntag
  calendarWeek NUMBER(2);
  calendarYear NUMBER(4);
  unfinished BOOLEAN := true;
  counterDate NUMBER; -- Hilfsvariable >1 wenn Datensatz vorhanden
  createTable VARCHAR2(4000);
BEGIN
  IF REGEXP_LIKE(startDate, '^[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}$') THEN
    startTime := TO_TIMESTAMP(StartDate,'YYYY-MM-DD HH24:MI:SS');
  ELSE
  RAISE_APPLICATION_ERROR(-20002,'Ungültiges Format beim Startzeitpunkt (YYYY-MM-DD)');
  END IF;

  IF REGEXP_LIKE(endDate, '^[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}$') THEN
    endTime := TO_TIMESTAMP(endDate,'yyyy-mm-dd HH24:MI:SS');
  ELSE
    RAISE_APPLICATION_ERROR(-20003,'Ungültiges Format beim Endzeitpunkt (YYYY-MM-DD)');
  END IF;

  IF(startTime >= endTime) THEN -- Prüft ob die Startzeit größer ist als die Endzeit
    RAISE_APPLICATION_ERROR(-20001,'Startzeitpunkt liegt vor dem Endzeitpunkt');
  END IF;

  WHILE (unfinished) LOOP
    /* Prüfen ob Vormittag oder Nachmittag */
    IF(TO_CHAR(startTime, 'HH24') < 12) THEN
      timeOfDay := 'AM';
    ELSE
      timeOfDay := 'PM';
    END IF;

    IF(weekStart = 0) THEN
      calendarWeek := TO_NUMBER(TO_CHAR(startTime, 'IW'));
      calendarYear := TO_CHAR(startTime, 'iyyy');
    ELSE
      calendarWeek := TO_NUMBER(TO_CHAR(startTime, 'WW'));
      calendarYear := TO_CHAR(startTime, 'yyyy');
    END IF;


    INSERT INTO DIM_Zeit (
      DIM_ZEIT_ID,
      Jahr,
      Quartalnr,
      Quartalsname,
      Monat,
      Monat_name,
      Wochenjahr,
      wochennr,
      tag,
      wochentag,
      tag_name,
      tageshälfte_desc,
      stunde,
      minute)

    VALUES(
      NULL,
      TO_NUMBER(TO_CHAR(startTime, 'yyyy')),
      TO_NUMBER(TO_CHAR(startTime, 'Q')),
      'Quartal ' || TO_NUMBER(TO_CHAR(startTime, 'Q')),
      TO_NUMBER(TO_CHAR(startTime, 'mm')),
      TO_CHAR(startTime, 'MONTH'),
      calendarYear,
      calendarWeek ,
      TO_NUMBER(TO_CHAR(startTime, 'dd')),
      TO_NUMBER(TO_CHAR(startTime, 'd')),
      TO_CHAR(startTime, 'DAY'),
      timeOfDay,
      TO_NUMBER(TO_CHAR(startTime, 'HH24')),
      TO_NUMBER(TO_CHAR(startTime, 'MI'))
    );

    /*Um eine Minute hochzählen*/
    startTime := startTime + (1/1440);
    IF (startTime=endTime) THEN
      unfinished := false;
    END IF;
  END LOOP;
END;
/

COMMIT;