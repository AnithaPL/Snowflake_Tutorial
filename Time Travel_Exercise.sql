-- Time Travel_Exercise
-- 1. Create exercise table
USE DATABASE EXERCISE_DB;
USE WAREHOUSE COMPUTE_WH;

CREATE OR REPLACE TABLE EXERCISE_DB.PUBLIC.PART
AS
SELECT * FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."PART";

SELECT * FROM PART
ORDER BY P_MFGR DESC;

-- 2. Update the table
UPDATE EXERCISE_DB.PUBLIC.PART
SET P_MFGR='Manufacturer#CompanyX'
WHERE P_MFGR='Manufacturer#5';

-- Copy the Query ID
01a56083-0004-2569-0016-3607000104fa

SELECT * FROM PART
ORDER BY P_MFGR DESC;

-- 3.1: Travel back using the offset until you get the result of before the update
SELECT * FROM EXERCISE_DB.PUBLIC.PART at (OFFSET => -60*6.0) ORDER BY P_MFGR DESC

-- 3.2: Travel back using the query id to get the result before the update
SELECT * FROM EXERCISE_DB.PUBLIC.PART before (statement => '01a56083-0004-2569-0016-3607000104fa')


-- Exercise 2
-- Exercise on UNDROP
-- 1. Create a database & Schema

CREATE OR REPLACE DATABASE TIMETRAVEL_EXERCISE;
CREATE OR REPLACE SCHEMA TIMETRAVEL_EXERCISE.COMPANY_X;

-- 2. Create a customers table
CREATE OR REPLACE TABLE CUSTOMER AS
SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER
LIMIT 500;

-- 3. Drop the schema (assuming it happened by accident)
DROP SCHEMA TIMETRAVEL_EXERCISE.COMPANY_X;

-- 4. Verify table doesn't exist anymore
SELECT * FROM "TIMETRAVEL_EXERCISE"."COMPANY_X"."CUSTOMER"

-- 5. Undrop Schema
UNDROP SCHEMA TIMETRAVEL_EXERCISE.COMPANY_X;