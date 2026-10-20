// Database to manage stage objects, fileformats etc.

CREATE OR REPLACE DATABASE MANAGED_DB;

CREATE OR REPLACE SCHEMA external_stage;

// creating a external stage

CREATE OR REPLACE STAGE MANAGED_DB.external_stage.aws_stage
    url = 's3://bucketsnowflakes3'
    credentials = (aws_key_id = 'ABCD_DUMMY_ID' aws_secret_key='1234abcd_key');


// description of external stage

DESC STAGE MANAGED_DB.external_stage.aws_stage;


