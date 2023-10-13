--Grant database permission to a user:
GRANT ALL PRIVILEGES ON DATABASE dbname to dbusername;

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

--SQL to delete rows from a table where a value is duplicated and under a condition:
DELETE from tablename WHERE column1name = 'value' AND column2name IN (SELECT column2name FROM tablename group by column2name having count (column2name) >1);

--Dry-run or error check your statement before running it:
BEGIN;
test command goes here;
--Then run either COMMIT; or ROLLBACK; below where COMMIT actually performs the changes since BEGIN; and ROLLBACK; ignores any changes since BEGIN;
ROLLBACK; COMMIT;

--Gather all info about a table:
\d+ tablename

--List all tables:
\dt

--Quit psql:
\q

--Select based on values in another table
SELECT table1value FROM table1 INNER JOIN table2 on table1.table1value = table2.table2value;

--Delete based on values in another table
DELETE FROM table1 t USING table2 s WHERE t.table1value = s.table2value;
