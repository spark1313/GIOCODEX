--Export a PostgreSQL database table to CSV:
COPY table_name TO '/directory/path/file.csv' WITH DELIMITER ',' CSV HEADER;
--or
\copy (SELECT * FROM table_name) to 'C:\directory\path\file.csv' with csv

--Import a CSV into a PostgreSQL database table:
COPY table_name(column1_name, column2_name, column3_name) FROM '/directory/path/file.csv' WITH DELIMITER ',' CSV HEADER;

--SQL to add text to cells: 
UPDATE tablename SET columnname = CONCAT(columnname, "string") WHERE condition IS status;

--SQL to convert a column to lower case:
UPDATE tablename SET columnname = LOWER(othercolumnname);

--SQL to find cells which contain a specific string:
SELECT * FROM tablename WHERE columnname LIKE "%stringname%";
