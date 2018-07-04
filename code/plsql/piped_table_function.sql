-- CREATE
CREATE TYPE typeCustomer AS OBJECT (
  CUSTOMER_ID NUMBER NULL,
  CUSTOMER_FIRST_NAME VARCHAR2(50) NULL,
  CUSTOMER_LAST_NAME VARCHAR2(50) NULL,
  CUSTOMER_COUNTRY VARCHAR2(50) NULL,
  ORDER_TOTAL NUMBER
);
/

CREATE TYPE typeCustomerAsNestedTable AS TABLE OF typeCustomer;
/

CREATE OR REPLACE FUNCTION getCustomer(inCustomerCursor IN SYS_REFCURSOR) RETURN typeCustomerAsNestedTable PIPELINED
AS
  -- Declare
  recCustomer customers%ROWTYPE;
  vCountry countries.country_name%TYPE;
  vSumOrderTotal orders.order_total%TYPE;
BEGIN
  LOOP
    FETCH inCustomerCursor INTO recCustomer;
    EXIT WHEN inCustomerCursor%NOTFOUND;

    -- Search after country_name for a customer
    SELECT country_name INTO vCountry
    FROM countries
    WHERE country_id = recCustomer.country_id;

    -- SUM Order total for a customer
    SELECT NVL(SUM(o.order_total),0) INTO vSumOrderTotal
    FROM orders o
    WHERE o.customer_id = recCustomer.customer_id;

    -- Add a new row into the table
    PIPE ROW (
      typeCustomer(
        recCustomer.customer_id,
        recCustomer.cust_first_name,
        recCustomer.cust_last_name,
        vCountry,
        vSumOrderTotal
      )
    );

  END LOOP;

  CLOSE inCustomerCursor;

  RETURN;
EXCEPTION
  WHEN NO_DATA_NEEDED THEN
    RAISE;
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20000, 'No data found!');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20000, 'Error: ' || SUBSTR(SQLERRM(),20));
END;
/

-- Abfrage
SELECT *
FROM TABLE(getCustomer(CURSOR(
  SELECT * FROM customers WHERE customer_id <= 200))
);