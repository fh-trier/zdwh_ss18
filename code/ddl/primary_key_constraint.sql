-- ###################################################
-- ############ PRIMARY KEY CONSTRAINT ###############
-- ###################################################

-- ALTER TABLE
ALTER TABLE <table_name>
ADD CONSTRAINT <constraint_name>
  PRIMARY KEY ([col1, col2, ..]);

-- Beispiel 1
ALTER TABLE verkauf
ADD CONSTRAINT pk_vnr
  PRIMARY KEY (vnr);


-- CREATE TABLE
CREATE TABLE <table_name> (
  column1_name column1_datatype [OPTION],
  column2_name column2_datatype [OPTION],
  CONSTRAINT "PK_HAUPTTABELLE" PRIMARY KEY (col1)
);

-- Beispiel 1
CREATE TABLE verkauf (
  vnr NUMBER(38) NOT NULL,
  c_date DATE NOT NULL,
  CONSTRAINT "PK_VERKAUF" PRIMARY KEY (vnr)
);
