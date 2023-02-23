/* procedures */

--Run commands
-- @C:\csy2038\as2\procedure.sql

/*
Group 5
KHAGENDRA CHHETRI -  21427623
SUMAN ARYAL - 21430467
MADHAB SHRESTHA -  22400129
UTTAM THAKUR - 20419147
*/

--example 1
--return experinces and its price
CREATE OR REPLACE PROCEDURE proc_experience_price
(in_experience_id experiences.experience_id%TYPE) IS 
vc_sentence VARCHAR2(255);
vc_expericene_name experiences.experience_name%TYPE;
vn_price experiences.price%TYPE;

BEGIN
SELECT experience_name,price
INTO vc_expericene_name,vn_price
FROM experiences
WHERE experience_id = in_experience_id;

vc_sentence:=(vc_expericene_name)|| (' costs ') ||(' -> ') ||(vn_price);
DBMS_OUTPUT.PUT_LINE('Full details: '||vc_sentence); 

END proc_experience_price;
/
show errors;
--TESTING 
EXECUTE proc_experience_price(101);
EXECUTE proc_experience_price(104);

--example 2--deleting maximum ambassador id

CREATE OR REPLACE PROCEDURE proc_delete_ambassador IS
vn_ambassador_id ambassadors.ambassador_id%TYPE;

BEGIN
SELECT MAX(ambassador_id) 
INTO vn_ambassador_id
FROM ambassadors;

DELETE FROM ambassadors
WHERE ambassador_id = vn_ambassador_id;

END proc_delete_ambassador;
/
SHOW ERRORS;
 --TESTING
 EXECUTE proc_delete_ambassador;


--example 3
--update price of maximum experince id
CREATE OR REPLACE PROCEDURE proc_update_experience 
(in_price experiences.price%TYPE)
IS
vn_experience_id experiences.experience_id%TYPE;

BEGIN
SELECT MAX(experience_id) 
INTO vn_experience_id
FROM experiences;

UPDATE experiences SET price = in_price
WHERE experience_id = vn_experience_id;


END proc_update_experience;
/
SHOW ERRORS;
 --TESTING
 EXECUTE proc_update_experience;
 select experience_id, price from experiences;

 --example 4
 --gives no of experinces
 --procedure using function


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
--testing
SELECT func_experience_ct() FROM DUAL;

--procedure using function
CREATE OR REPLACE PROCEDURE proc_using_func IS
vn_no_of_experinces NUMBER(3);
BEGIN
vn_no_of_experinces:= func_experience_ct;
DBMS_OUTPUT.PUT_LINE('There is ' || vn_no_of_experinces || ' different experiences to explore.');
END proc_using_func;
/

--testing 
EXECUTE proc_using_func;
SELECT experience_name from experiences;