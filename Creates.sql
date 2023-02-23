/* Creates */

--Run commands
-- @C:\csy2038\as2\Creates.sql

/*
Group 5

KHAGENDRA CHHETRI -  21427623
SUMAN ARYAL - 21430467
MADHAB SHRESTHA -  22400129
UTTAM THAKUR - 20419147
*/


/*Useful Commands
COLUMN object_name FORMAT A20;
COLUMN object_type FORMAT A20;
SELECT object_name, object_type FROM user_objects;
*/

/* _______________________________________________
            
            CREATE TYPES
__________________________________________________
*/

CREATE OR REPLACE TYPE address_type AS OBJECT (
street           VARCHAR2(25),
city             VARCHAR2(25),
country          VARCHAR2(20)
);
/
SHOW ERRORS;

CREATE TABLE addresses OF address_type;


CREATE OR REPLACE TYPE activity_type AS OBJECT (
    name            VARCHAR2(25),
    description     VARCHAR2(25),
    category        VARCHAR2(25)
);
/
SHOW ERRORS;

CREATE TYPE activity_varray_type AS VARRAY(50) OF activity_type;
/


CREATE OR REPLACE TYPE facility_type AS OBJECT (
    facility_name  VARCHAR2(25),
    services        VARCHAR2(25),
    description     VARCHAR2(25)
);
/
SHOW ERRORS;

CREATE TYPE facility_table_type AS TABLE OF facility_type;
/


/* _______________________________________________
            
            CHECK TYPES
__________________________________________________
*/
COLUMN object_name FORMAT A20;
SELECT object_name FROM user_objects WHERE object_type = 'TYPE';



/* _______________________________________________
            
            CREATE TABLES
__________________________________________________
*/

CREATE TABLE experiences(
    experience_name     VARCHAR2(25),
    experience_id       NUMBER(25),
    experience_nature_id  NUMBER(25), 
    location_id     NUMBER(25), 
    price       NUMBER(20,2),
    activity    activity_varray_type
);

CREATE TABLE ambassadors (
    ambassador_id   NUMBER(25),
    ambassador_name VARCHAR2(25),
    profile          CLOB,
    address         REF address_type
                     SCOPE IS addresses
);

CREATE TABLE experience_ambassadors(
  ambassador_id   NUMBER(25),
experience_id       NUMBER(25));

CREATE TABLE  experience_natures (
experience_nature_id NUMBER(25),
category    VARCHAR2(25),
duration    NUMBER(10) 
);

CREATE TABLE locations (
    location_id  NUMBER(25),
    address         address_type,
    facility         facility_table_type)
NESTED TABLE facility STORE AS facility_table;

/* _______________________________________________
            
            CHECK TABLES
__________________________________________________
*/

COLUMN tname FORMAT A20;
SELECT tname FROM TAB;

/* _______________________________________________
            
            CREATE SEQUENCES
__________________________________________________
*/
CREATE SEQUENCE experinces_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE ambassadors_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE experince_ambassadors_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE experience_natures_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE locations_seq START WITH 100 INCREMENT BY 1;

/* _______________________________________________
            
            CHECK SEQUENCES
__________________________________________________
*/

COLUMN sequence_name FORMAT A20;
SELECT sequence_name FROM user_sequences;
