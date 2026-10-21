CREATE OR REPLACE STAGE MANAGED_DB.EXTERNAL_STAGE.AWS_STAGE_ERROREX
    url = 's3://bucketsnowflakes4';


LIST @MANAGED_DB.EXTERNAL_STAGE.AWS_STAGE_ERROREX;

// create an example temple
CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.ORDERS_EX (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30)
);

// Demonstrating error message
COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_EX 
    FROM @MANAGED_DB.EXTERNAL_STAGE.AWS_STAGE_ERROREX
    file_format = (type = csv field_delimiter = ',' skip_header = 1)
    files = ('OrderDetails_error.csv')
    ON_ERROR = 'CONTINUE';



SELECT * FROM OUR_FIRST_DB.PUBLIC.ORDERS_EX;


COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_EX 
    FROM @MANAGED_DB.EXTERNAL_STAGE.AWS_STAGE_ERROREX
    file_format = (type = csv field_delimiter = ',' skip_header = 1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = 'ABORT_STATEMENT';



COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_EX 
    FROM @MANAGED_DB.EXTERNAL_STAGE.AWS_STAGE_ERROREX
    file_format = (type = csv field_delimiter = ',' skip_header = 1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = 'SKIP_FILE';

// error limit  - number
COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_EX 
    FROM @MANAGED_DB.EXTERNAL_STAGE.AWS_STAGE_ERROREX
    file_format = (type = csv field_delimiter = ',' skip_header = 1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = 'SKIP_FILE_2';


// error limit - percentage of rows 
OPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_EX 
    FROM @MANAGED_DB.EXTERNAL_STAGE.AWS_STAGE_ERROREX
    file_format = (type = csv field_delimiter = ',' skip_header = 1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = 'SKIP_FILE_3%';