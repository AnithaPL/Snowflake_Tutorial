-- COPY Command Demonstration/Copying File from External Stage to Snowflake
-- Creating ORDERS Table

CREATE OR REPLACE TABLE MY_FIRST_DB.PUBLIC.ORDERS (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30)
);

SELECT * FROM "MY_FIRST_DB"."PUBLIC"."ORDERS";

USE DATABASE MY_FIRST_DB;

-- First Copy Command
COPY INTO "MY_FIRST_DB"."PUBLIC"."ORDERS"
    FROM @aws_stage
    file_format = (type = csv field_delimiter = ',' skip_header = 1); 
    
-- Copy command with fully qualified stage object

COPY INTO MY_FIRST_DB.PUBLIC.ORDERS
    FROM @MANAGE_DB.external_stages.aws_stage
    file_format= (type = csv field_delimiter=',' skip_header=1); --Not working because there is multiple file in our extarnal staging area
    
-- We can list the files in the staging area
LIST @MANAGE_DB.external_stages.aws_stage;

-- Now we have to mention the specific file

COPY INTO MY_FIRST_DB.PUBLIC.ORDERS
    FROM @MANAGE_DB.external_stages.aws_stage
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails.csv');

-- Copy command with pattern for file names

COPY INTO MY_FIRST_DB.PUBLIC.ORDERS
    FROM @MANAGE_DB.external_stages.aws_stage
    file_format= (type = csv field_delimiter=',' skip_header=1)
    pattern='.*Order.*';
