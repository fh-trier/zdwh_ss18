-- Settings
SET serveroutput ON;

-- Procedure
CREATE OR REPLACE PROCEDURE getLocations
AS
  -- Declare Types
  TYPE typeLocationsAsNestedTable IS TABLE OF locations%ROWTYPE;
  TYPE typeLocationsAsAArray IS TABLE OF locations.city%TYPE INDEX BY PLS_INTEGER;
  TYPE typeLocationsAsVArray IS VARRAY(12) OF locations%ROWTYPE;

  -- Initialize
  listLocationsAsNestedTable typeLocationsAsNestedTable := typeLocationsAsNestedTable();
  listLocationsAsVArray typeLocationsAsVArray := typeLocationsAsVArray();

  -- No Initialize
  listLocationsAsNestedTable2 typeLocationsAsNestedTable;
  listLocationsAsAArray typeLocationsAsAArray;

  -- Variables
  vIndex PLS_INTEGER := 1;
BEGIN
  -- Load Nested Table (LOOP)
  DBMS_OUTPUT.PUT_LINE('------------------------');
  DBMS_OUTPUT.PUT_LINE('Load Nested Table (LOOP)');
  DBMS_OUTPUT.PUT_LINE('------------------------');
  FOR recLocations IN (SELECT * FROM locations) LOOP
    listLocationsAsNestedTable.EXTEND();
    listLocationsAsNestedTable(listLocationsAsNestedTable.LAST) := recLocations;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Done!');

  -- Print entries from NestedTable (LOOP)
  DBMS_OUTPUT.PUT_LINE('------------------------');
  DBMS_OUTPUT.PUT_LINE('Print entries from Nested Table (LOOP)');
  DBMS_OUTPUT.PUT_LINE('------------------------');
  vIndex := listLocationsAsNestedTable.FIRST;
  WHILE(vIndex IS NOT NULL) LOOP
    DBMS_OUTPUT.PUT_LINE(
      listLocationsAsNestedTable(vIndex).Location_ID || ' ' ||
      listLocationsAsNestedTable(vIndex).City
    );
    vIndex := listLocationsAsNestedTable.NEXT(vIndex);
  END LOOP;

  -- Load Nested Table (BULK)
  DBMS_OUTPUT.PUT_LINE('------------------------');
  DBMS_OUTPUT.PUT_LINE('Load Nested Table (BULK)');
  DBMS_OUTPUT.PUT_LINE('------------------------');
  SELECT * BULK COLLECT INTO listLocationsAsNestedTable2
  FROM locations;
  DBMS_OUTPUT.PUT_LINE('Done!');

  -- Print entries from NestedTable (BULK)
  DBMS_OUTPUT.PUT_LINE('------------------------');
  DBMS_OUTPUT.PUT_LINE('Print entries from Nested Table (BULK)');
  DBMS_OUTPUT.PUT_LINE('------------------------');
  vIndex := listLocationsAsNestedTable2.FIRST;
  WHILE(vIndex IS NOT NULL) LOOP
    DBMS_OUTPUT.PUT_LINE(
      listLocationsAsNestedTable2(vIndex).Location_ID || ' ' ||
      listLocationsAsNestedTable2(vIndex).City
    );
    vIndex := listLocationsAsNestedTable2.NEXT(vIndex);
  END LOOP;

  -- Load Assoziatives Array
  -- Automatically sorted by Index-Number!
  DBMS_OUTPUT.PUT_LINE('-----------------------');
  DBMS_OUTPUT.PUT_LINE('Load Assoziatives Array');
  DBMS_OUTPUT.PUT_LINE('-----------------------');
  FOR recLocations IN (SELECT * FROM locations) LOOP
    listLocationsAsAArray(recLocations.Location_ID) := recLocations.CITY;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Done!');

  -- Print entries from Assoziatives Array
  DBMS_OUTPUT.PUT_LINE('------------------------');
  DBMS_OUTPUT.PUT_LINE('Print entries from Assoziatives Array');
  DBMS_OUTPUT.PUT_LINE('------------------------');
  vIndex := listLocationsAsAArray.FIRST;
  WHILE(vIndex IS NOT NULL) LOOP
    DBMS_OUTPUT.PUT_LINE(vIndex || ': ' || listLocationsAsAArray(vIndex));
    vIndex := listLocationsAsAArray.NEXT(vIndex);
  END LOOP;

  -- Load VArray
  DBMS_OUTPUT.PUT_LINE('-----------------------');
  DBMS_OUTPUT.PUT_LINE('Load V-Array');
  DBMS_OUTPUT.PUT_LINE('-----------------------');
  FOR recLocations IN (
    SELECT *
    FROM locations
    WHERE ROWNUM <= 12
    ORDER BY Location_ID
  ) LOOP
    listLocationsAsVArray.EXTEND;
    listLocationsAsVArray(listLocationsAsVArray.LAST) := recLocations;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Done!');

  -- Print entries from V-Array
  DBMS_OUTPUT.PUT_LINE('------------------------');
  DBMS_OUTPUT.PUT_LINE('Print entries from V-Array');
  DBMS_OUTPUT.PUT_LINE('------------------------');
  FOR i IN listLocationsAsVArray.FIRST..listLocationsAsVArray.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(listLocationsAsVArray(i).Location_ID || ': ' || listLocationsAsVArray(i).City);
  END LOOP;

-- Exception
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'no data found');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20000, 'error in getLocations ' || SUBSTR(SQLERRM(),20));
END;
/

-- Execute Procedure
EXEC getLocations();