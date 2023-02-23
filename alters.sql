/* Alters */

--Run commands
-- @C:\csy2038\as2\alters.sql

/*
Group 5
Khagendra Chhetri
Suman Aryal
Madhab Shrestha - 
Uttam Thakur - 20419147
*/




/* _______________________________________________
            
            PRIMARY KEYS
__________________________________________________
*/

ALTER TABLE experiences
ADD CONSTRAINT pk_experinces
PRIMARY KEY (experience_id);

ALTER TABLE ambassadors
ADD CONSTRAINT pk_ambassadors
PRIMARY KEY (ambassador_id);

ALTER TABLE experience_ambassadors
ADD CONSTRAINT pk_experience_ambassadors
PRIMARY KEY (experience_id, ambassador_id);

ALTER TABLE experience_natures
ADD CONSTRAINT pk_experience_natures
PRIMARY KEY (experience_nature_id);

ALTER TABLE locations
ADD CONSTRAINT pk_locations
PRIMARY KEY (location_id);

/* _______________________________________________
            
            FOREIGN KEYS
__________________________________________________
*/

ALTER TABLE experiences
ADD CONSTRAINT fk_e_experience_natures
FOREIGN KEY (experience_nature_id)
REFERENCES experience_natures(experience_nature_id);

ALTER TABLE experiences
ADD CONSTRAINT fk_e_locations
FOREIGN KEY (location_id)
REFERENCES locations(location_id);

ALTER TABLE experience_ambassadors
ADD CONSTRAINT fk_ea_ambassadors
FOREIGN KEY (ambassador_id)
REFERENCES ambassadors(ambassador_id);

ALTER TABLE experience_ambassadors
ADD CONSTRAINT fk_ea_experiences
FOREIGN KEY (experience_id)
REFERENCES experiences(experience_id);

/* _______________________________________________
            
            CHECK CONSTRAINTS
__________________________________________________
*/

COLUMN object_name FORMAT A20;
SELECT constraint_name 
FROM user_constraints 
WHERE constraint_type = 'P' OR constraint_type = 'R';