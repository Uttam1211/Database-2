/* loops */

--Run commands
-- @C:\csy2038\as2\loops as2.sql

/*
Group 5
KHAGENDRA CHHETRI -  21427623
SUMAN ARYAL - 21430467
MADHAB SHRESTHA -  22400129
UTTAM THAKUR - 20419147
*/

DECLARE
    counter INT := 0;
BEGIN
    WHILE counter < 10 LOOP
        DBMS_OUTPUT.PUT_LINE(counter);
        counter := counter + 1;
    END LOOP;
END;
/



---loop examples
---output: 
/*
H
i
k
i
n
g
by
Jose

*/
SET SERVEROUTPUT ON

DECLARE
vn_counter      NUMBER(3):=1;
vc_nature   VARCHAR2(30):='Hiking';
vc_ambassador     VARCHAR2(30):='Jose';
vn_length       NUMBER(30):= LENGTH(vc_nature);

BEGIN
LOOP
IF vn_counter > vn_length THEN
EXIT;
END IF;
DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_nature,vn_counter,1));
vn_counter:=vn_counter+1;
END LOOP;
DBMS_OUTPUT.PUT_LINE('by');
DBMS_OUTPUT.PUT_LINE(vc_ambassador);
END;
/

--loop in function
--From experience_ambassadors table to return a list of ambassadors

CREATE OR REPLACE FUNCTION get_ambassadors_for_experience (experience_id_in IN NUMBER)
RETURN activity_varray_type
AS
   amb_list activity_varray_type := activity_varray_type();
   amb_id NUMBER;
   amb_cursor SYS_REFCURSOR;
BEGIN
   FOR i IN (SELECT ambassador_id FROM experience_ambassadors WHERE experience_id = experience_id_in)
   LOOP
      amb_id := i.ambassador_id;
      OPEN amb_cursor FOR SELECT ambassador_name FROM ambassadors WHERE ambassador_id = amb_id;
      FETCH amb_cursor INTO amb_list(amb_list.COUNT + 1);
	  
                    
      CLOSE amb_cursor;
	  
   END LOOP;

   RETURN amb_list;
   
END get_ambassadors_for_experience;
/
--example 4
DECLARE
amb_cursor SYS_REFCURSOR;
amb_rec ambassadors%ROWTYPE;
BEGIN
OPEN amb_cursor FOR SELECT * FROM ambassadors;
DBMS_OUTPUT.PUT_LINE('Ambassador List:');
DBMS_OUTPUT.PUT_LINE('Ambassador Name');
LOOP
FETCH amb_cursor INTO amb_rec;
EXIT WHEN amb_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(amb_rec.ambassador_name);
END LOOP;
CLOSE amb_cursor;
END;
/