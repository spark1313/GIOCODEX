--Send output from postgres to external file instead of within the console: (Run this command first then the query to output)
\o /var/lib/pgsql/file.txt
--Return to outputting query results in the shell
\o

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

--Only list a certain number of rows from a long table
SELECT * from tablename limit 5;

--Dry-run or error check your statement before running it:
BEGIN;
test command goes here;
--Then run either COMMIT; or ROLLBACK; below where COMMIT actually performs the changes since BEGIN; and ROLLBACK; ignores any changes since BEGIN;
ROLLBACK; COMMIT;
