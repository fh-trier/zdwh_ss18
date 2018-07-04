-- CREATE
CREATE TYPE typeChannelClass AS OBJECT (
  CHANNEL_CLASS_ID NUMBER NULL,
  CHANNEL_CLASS VARCHAR2(50) NULL,
  CHANNEL_ID NUMBER NULL,
  CHANNEL_DESC VARCHAR2(50) NULL,
  COUNT_ORDERS NUMBER NULL,
  AVG_ORDER_TOTAL NUMBER NULL
);
/

CREATE TYPE typeChannelClassAsNestedTable AS TABLE OF typeChannelClass;
/

CREATE OR REPLACE FUNCTION getChannelClass(inChannelClassId IN NUMBER) RETURN typeChannelClassAsNestedTable
AS
  -- Initialize
  listChannelClass typeChannelClassAsNestedTable;
BEGIN
    SELECT
      typeChannelClass(
        c.channel_class_id,
        c.channel_class,
        c.channel_id,
        c.channel_desc,
        COUNT(o.order_id),
        ROUND(AVG(o.order_total),2)
      )
    BULK COLLECT INTO listChannelClass
    FROM channels c
      INNER JOIN orders o ON (c.channel_id = o.channel_id)
    WHERE channel_class_id = inChannelClassId
    GROUP BY c.channel_class_id, c.channel_class, c.channel_id, c.channel_desc;

    RETURN listChannelClass;
END;
/

-- Abfrage
SELECT *
FROM TABLE(getChannelClass(13));