---------------------------------------------------
--- SQL: CREATING AND UPDATING TABLES
---------------------------------------------------

-- P1: CREATE
-- P2: INSERT
-- P3: UPDATE & SET
-- P4: ALTER
-- P5: DROP

---------------------------------------------------
--- P1: Creating tables >> CREATE
--- Documentation: https://www.postgresql.org/docs/current/sql-createtable.html
---------------------------------------------------

/* Syntax:
CREATE TABLE table_name (
	column1_name column1_type ,
	column2_name column2_type ,
	column3_name column3_type 
		);
*/

CREATE TABLE  ade_1.ttheo_toy_data (
	ids INT 
	, first_name VARCHAR(10)
	, fav_colour VARCHAR(10)
	, fav_num INT 
	, holiday_recent BOOL
);



-- There are many data types to choose from:
-- INT, BIGINT, FLOAT, NUMERIC
-- VARCHAR, TEXT, CHAR
-- DATE, BOOL, ARRAY

---------------------------------------------------
--- P2: Inserting new data >> INSERT
--- Documentation: https://www.postgresql.org/docs/current/sql-insert.html
---------------------------------------------------

/* Syntax:
INSERT INTO table_name VALUES 
	( value1_1, value1_2, value1_3 ),
	( value2_1, value2_2, value2_3 );
*/

INSERT INTO ade_1.ttheo_toy_data VALUES
	(6, 'Steve', 'Blue', 14, TRUE)
	, (7, 'Steve', NULL, 47, TRUE);


-- We can also specify the names of the columns

INSERT INTO ade_1.ttheo_toy_data (ids, first_name, fav_num) VALUES 
	(8, 'Tom', 33);


/* Syntax:
INSERT INTO table_name (column_1, column_2, column_3)
	VALUES (value_1, value_2, value_3);
*/

---------------------------------------------------
--- P3: Updating existing data >> UPDATE & SET
--- Documentation: https://www.postgresql.org/docs/current/sql-update.html
---------------------------------------------------

-- We can update the existing data in our table on a specific record
-- We typically designate the record we want using the table's PRIMARY KEY

/* Syntax:
UPDATE table_name
SET column = new_value
WHERE ID = record_value;
*/

UPDATE ade_1.ttheo_toy_data
SET fav_num = 24.22
WHERE ids = 4;

---------------------- Here's a typical example
-- UPDATE my_table
-- SET flag = 1
-- WHERE ID = 2337;

---------------------------------------------------
--- P4: Modifying the table >> ALTER
--- Documentation: https://www.postgresql.org/docs/current/sql-altertable.html
---------------------------------------------------

-- The ALTER TABLE flag can interact with your table in many ways, such as
-- 1. Adding a new column

/* Syntax:
ALTER TABLE table_name
	ADD COLUMN column_name column_type;
*/
UPDATE ade_1.ttheo_toy_data
SET like_sql = TRUE;

ALTER TABLE ade_1.ttheo_toy_data
	ADD COLUMN like_sql BOOL;

-- 2. Dropping an existing column

/* Syntax:
ALTER TABLE table_name
	DROP COLUMN column_name;
*/

ALTER TABLE ade_1.ttheo_toy_data
	DROP COLUMN like_sql;

-- 3. Changing the data type of an existing column

/* Syntax:
ALTER TABLE table_name
	ALTER COLUMN column_name TYPE new_column_type;
*/

ALTER TABLE ade_1.ttheo_toy_data
	ALTER COLUMN fav_num TYPE FLOAT;

ALTER TABLE ade_1.ttheo_toy_data
	ADD COLUMN like_pizza VARCHAR(5);

UPDATE ade_1.ttheo_toy_data
SET like_pizza = 'yes'
WHERE ids < 4;

UPDATE ade_1.ttheo_toy_data
SET like_pizza = 'no'
WHERE ids >= 4;

ALTER TABLE ade_1.ttheo_toy_data
	ALTER COLUMN like_pizza TYPE BOOL
	USING CASE
		WHEN like_pizza = 'yes' THEN TRUE
		WHEN like_pizza = 'no' THEN FALSE 
	END;
	

-- 4. BONUS: Adding constraints

/* Syntax:
ALTER TABLE table_name
	ADD CONSTRAINT your_table_pkey PRIMARY KEY (column1, column2, ...);
*/

ALTER TABLE ade_1.ttheo_toy_data
	ADD CONSTRAINT pkey PRIMARY KEY (ids);


-- Overall: There are many, many possible use cases for ALTER TABLE

---------------------------------------------------
--- P5: Deleting your table >> DROP
--- Documentation: https://www.postgresql.org/docs/current/sql-droptable.html
---------------------------------------------------
DELETE FROM ade_1.ttheo_toy_data
	WHERE pkey = 1;




-- This action is irreversible!
-- DROP will completely delete your table from the database. To remove its contents rather than deleting it, use DELETE

-- Syntax:
-- DROP TABLE IF EXISTS table_name;

DROP TABLE IF EXISTS ade_1.ttheo_toy_data;

CREATE TYPE ade_1.colour_type AS ENUM ('red', 'orange', 'yellow', 'green', 'purple');

ALTER TABLE ade_1.ttheo_toy_data
 ALTER COLUMN fav_colour TYPE ade_1.colour_type
 USING fav_colour::ade_1.colour_type;