-- Create Database
CREATE DATABASE MY_FIRST_DB;

--doesn’t know where to look for schemas, tables, or stages unless you fully
--Set the database:
USE DATABASE MY_FIRST_DB;

--Set the schema
USE SCHEMA PUBLIC;

--Set your role
USE ROLE SYSADMIN;  -- or another role you have access to

--set the warehouse
USE WAREHOUSE COMPUTE_WH;

-- Create the stage
CREATE OR REPLACE STAGE MY_FIRST_DB.PUBLIC.AWS_STAGE
  URL='s3://your-bucket-name/path/'
  STORAGE_INTEGRATION = your_storage_integration;

--Use an existing internal stage
CREATE OR REPLACE STAGE my_internal_stage;
PUT file://your_local_file.csv @my_internal_stage;



