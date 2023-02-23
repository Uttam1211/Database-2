/* Cursors */

--Run commands
-- @C:\csy2038\as2\cursors.sql

/*
Group 5

KHAGENDRA CHHETRI -  21427623
SUMAN ARYAL - 21430467
MADHAB SHRESTHA -  22400129
UTTAM THAKUR - 20419147
*/
--To retrieve all the experience names and their corresponding activity names:


DECLARE
    CURSOR experience_cursor IS
        SELECT experience_name, activity
        FROM experiences;
    vc_experience_name VARCHAR2(25);
    vc_activity activity_varray_type;
BEGIN
    OPEN experience_cursor;
    FETCH experience_cursor INTO vc_experience_name, vc_activity;

    LOOP
        FOR i IN 1..vc_activity.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(vc_experience_name || ' - ' || vc_activity(i).name);
        END LOOP;

        FETCH experience_cursor INTO vc_experience_name, vc_activity;
        EXIT WHEN experience_cursor%NOTFOUND;
    END LOOP;

    CLOSE experience_cursor;
END;
/

--to display all ambassador names
DECLARE
CURSOR cur_ambassador IS
SELECT ambassador_id, ambassador_name
FROM ambassadors;
v_ambassador_id NUMBER;
v_name VARCHAR2(50);
BEGIN
OPEN cur_ambassador;
LOOP
FETCH cur_ambassador INTO v_ambassador_id, v_name;
EXIT WHEN cur_ambassador%NOTFOUND;
dbms_output.put_line(v_ambassador_id || ' - ' || v_name );
END LOOP;
CLOSE cur_ambassador;
END;
/

