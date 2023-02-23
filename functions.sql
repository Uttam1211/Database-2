/* functions */

--Run commands
-- @C:\csy2038\as2\functions.sql

/*
Group 5
KHAGENDRA CHHETRI -  21427623
SUMAN ARYAL - 21430467
MADHAB SHRESTHA -  22400129
UTTAM THAKUR - 20419147
*/

--create functions

--A function to retrieve all experiences offered at a specific location:

 CREATE OR REPLACE function func_experience_ct 
return NUMBER IS
vn_experience_ct NUMBER(3);
BEGIN
SELECT COUNT(experience_name)
INTO vn_experience_ct
FROM experiences;

RETURN vn_experience_ct;

END func_experience_ct;
/
show errors;

---
CREATE OR REPLACE FUNCTION calculate_price_per_hour(p_experience_id IN NUMBER)
RETURN NUMBER
AS
  v_price NUMBER;
  v_duration NUMBER;
BEGIN
  SELECT price, duration INTO v_price, v_duration
  FROM experiences
  JOIN experience_natures
  ON experiences.experience_id = experience_natures.experience_nature_id
  WHERE experiences.experience_id = p_experience_id;

  RETURN v_price / v_duration;
END calculate_price_per_hour;
--testing

 SELECT calculate_price_per_hour(101) from DUAL;
SELECT price, duration
  FROM experiences
  JOIN experience_natures
  ON experiences.experience_id = experience_natures.experience_nature_id
  WHERE experiences.experience_id = 101;