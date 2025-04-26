-- full Snowflake session setup script
-- Set your role (adjust based on what you have access to)
USE ROLE SYSADMIN;

-- Set your virtual warehouse (compute power)
USE WAREHOUSE COMPUTE_WH;

-- Create and use your database
CREATE OR REPLACE DATABASE MY_FIRST_DB;
USE DATABASE MY_FIRST_DB;

-- Create and use your schema
CREATE OR REPLACE SCHEMA PUBLIC;
USE SCHEMA PUBLIC;

-- Optional: Create a sample table
CREATE OR REPLACE TABLE my_table (
    id INT,
    name STRING
);

-- Optional: Insert sample data
INSERT INTO my_table (id, name) VALUES
(1, 'Alice'),
(2, 'Bob');

-- Check the data
SELECT * FROM my_table;

