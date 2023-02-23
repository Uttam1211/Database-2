/*testing */

--Run commands
-- @C:\csy2038\as2\testing.sql
/*
Group 5
KHAGENDRA CHHETRI -  21427623
SUMAN ARYAL - 21430467
MADHAB SHRESTHA -  22400129
UTTAM THAKUR - 20419147
*/

--TESTING PROCEDURE
EXECUTE proc_experience_price(101);
EXECUTE proc_experience_price(104);

--TESTING PROCEDURE updating price on basis of condition
 EXECUTE proc_update_experience;
 select experience_id, price from experiences;

  --TESTING --deleting maximum amassador id 
 EXECUTE proc_delete_ambassador;

--testing FUNCTION

 SELECT calculate_price_per_hour(101) from DUAL;
SELECT price, duration
  FROM experiences
  JOIN experience_natures
  ON experiences.experience_id = experience_natures.experience_nature_id
  WHERE experiences.experience_id = 101;

   SELECT calculate_price_per_hour(102) from DUAL;
SELECT price, duration
  FROM experiences
  JOIN experience_natures
  ON experiences.experience_id = experience_natures.experience_nature_id
  WHERE experiences.experience_id = 102;

  --testing FUNCTION
SELECT func_experience_ct() FROM DUAL;


--TESTING triggers update on condition
INSERT INTO experiences(experience_id, price)
VALUES(experinces_seq.NEXTVAL, 100);
SELECT prices, experience_id from experiences;

INSERT INTO experiences(experience_id, price)
VALUES(experinces_seq.NEXTVAL, 500);
SELECT prices, experience_id from experiences;

--testing -- inserting ambassadors values
INSERT INTO ambassadors(ambassador_id,ambassador_name,profile)
VALUES (ambassadors_seq.NEXTVAL, 'Uttam Thakur', 'Experienced hiker and outdoor enthusiast');
SELECT ambassador_id,ambassador_name from ambassadors;