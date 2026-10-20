CREATE DATABASE OUR_FIRST_DB;

CREATE TABLE "OUR_FIRST_DB"."PUBLIC"."LOAN_PAYMENT" (
    LOAN_ID          NUMBER(38,0),
    LOAN_STATUS      VARCHAR(50),
    PRINCIPAL        NUMBER(12,2),
    TERMS            NUMBER(10,0),
    EFFECTIVE_DATE   DATE,
    PAID_OFF_TIME    TIMESTAMP_NTZ,
    PAST_DUE_DAYS    NUMBER(10,0),
    AGE              NUMBER(3,0),
    EDUCATION        VARCHAR(100),
    GENDER           VARCHAR(20)
);


SELECT * FROM LOAN_PAYMENT;


COPY INTO LOAN_PAYMENT
    FROM s3://bucketsnowflakes3/loan_payments_data.csv
    file_format = (type = csv 
                    field_delimiter = ','
                    skip_header = 1);