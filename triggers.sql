/* triggers */

--Run commands
-- @C:\csy2038\as2\triggers.sql
/*
Group 5
KHAGENDRA CHHETRI -  21427623
SUMAN ARYAL - 21430467
MADHAB SHRESTHA -  22400129
UTTAM THAKUR - 20419147
*/

--example-1

--check insert of price is more than 50, if so value will be doubled
CREATE OR REPLACE TRIGGER experience_price_update
BEFORE INSERT OR UPDATE ON experiences
FOR EACH ROW
BEGIN

IF :NEW.price > 50 THEN
:NEW.price := :NEW.price * 2;
DBMS_OUTPUT.PUT_LINE('VALUE IS DOUBLED');
END IF;
END experience_price_update;
/
--TESTING
INSERT INTO experiences(experience_id, price)
VALUES(experinces_seq.NEXTVAL, 100);
SELECT prices, experience_id from experiences;

INSERT INTO experiences(experience_id, price)
VALUES(experinces_seq.NEXTVAL, 500);
SELECT prices, experience_id from experiences;

--example 2
CREATE OR REPLACE TRIGGER display_new_ambassador
AFTER INSERT ON ambassadors
FOR EACH ROW
BEGIN
   DBMS_OUTPUT.PUT_LINE('New ambassador is '||:NEW.ambassador_name);
   
END;
/
--testing
INSERT INTO ambassadors(ambassador_id,ambassador_name,profile)
VALUES (ambassadors_seq.NEXTVAL, 'Uttam Thakur', 'Experienced hiker and outdoor enthusiast');
SELECT ambassador_id,ambassador_name from ambassadors;

--example 3

CREATE OR REPLACE TRIGGER 
update_ambassador_address
BEFORE UPDATE OF street ON
addresses
FOR EACH ROW
BEGIN
UPDATE ambassadors
SET address = (SELECT address FROM addresses 
WHERE street = :NEW.street)
WHERE address = (SELECT address FROM addresses WHERE
street = :OLD.street);
END update_ambassador_address;
/
SHOW ERRORS;
--testing
UPDATE ambassadors SET address = 
(SELECT REF(a) FROM addresses a 
WHERE a.street = '132 Main St') 
WHERE ambassador_id = 103;

 select a.address.street, a.ambassador_id from ambassadors a;