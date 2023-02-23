/* Creates */

--Run commands
-- @C:\csy2038\as2\drop.sql

/*
Group 5
KHAGENDRA CHHETRI -  21427623
SUMAN ARYAL - 21430467
MADHAB SHRESTHA -  22400129
UTTAM THAKUR - 20419147
*/

--DROP TRIGGERS
DROP TRIGGER experience_price_update;
DROP TRIGGER display_new_ambassador;

--DROP PROCEDURES
DROP PROCEDURE proc_experience_price;
DROP PROCEDURE proc_update_experience;
DROP PROCEDURE proc_using_func;


--DROP FUNCTIONS
DROP FUNCTION func_experience_ct;
DROP FUNCTION calculate_price_per_hour;

--DROP CONSTRAINTS
--DROP FOREIGN KEYS
ALTER TABLE experiences
DROP CONSTRAINT fk_e_experience_natures;

ALTER TABLE experiences
DROP CONSTRAINT fk_e_locations;

ALTER TABLE experience_ambassadors
DROP CONSTRAINT fk_ea_ambassadors;

ALTER TABLE experience_ambassadors
DROP CONSTRAINT fk_ea_experiences;
--DROP PRIMARY KEYS
ALTER TABLE experiences
DROP CONSTRAINT pk_experinces;

ALTER TABLE ambassadors
DROP CONSTRAINT pk_ambassadors;

ALTER TABLE experience_ambassadors
DROP CONSTRAINT pk_experience_ambassadors;

ALTER TABLE experience_natures
DROP CONSTRAINT pk_experience_natures;

ALTER TABLE locations
DROP CONSTRAINT pk_locations;

--DROP TABLES
DROP TABLE locations;
DROP TABLE experience_natures;
DROP TABLE experience_ambassadors;
DROP TABLE ambassadors;
DROP TABLE experiences;

--DROP SEQUENCES
DROP SEQUENCE experinces_seq;
DROP SEQUENCE ambassadors_seq;
DROP SEQUENCE experince_ambassadors_seq;
DROP SEQUENCE experience_natures_seq;
DROP SEQUENCE locations_seq;

--DROP OBJECT TABLES
DROP TABLE addresses;

--DROP TABLE/VARRAY TYPES
DROP TYPE facility_table_type;
DROP TYPE activity_varray_type;

--DROP TYPES
DROP TYPE address_type;
DROP TYPE activity_type;
DROP TYPE facility_type;

--PURGE RECYCLEBIN
PURGE RECYCLEBIN;

--CHECK
SELECT object_name FROM user_objects;

