-- Show session parameters Language
SELECT * FROM NLS_SESSION_PARAMETERS

-- Show quotas to specific User
SELECT username,tablespace_name,bytes/1024/1024/1024, MAX_BYTES/1024/1024/1024
FROM dba_ts_quotas
WHERE username='TEST_DB';

-- Grant unlimited quota to specific user;
ALTER USER TEST_DB QUOTA UNLIMITED ON USERS;
GRANT UNLIMITED TABLESPACE TO TEST_DB;

--SET SERVEROUTPUT ON;
DECLARE
	v_test	VARCHAR(15);
BEGIN
	v_test := 'Eric Ambiel';
	DBMS_OUTPUT.PUT_LINE(v_test);
END;

-- Class 3 --
-- Create Table
CREATE TABLE TEST_DB.employees(
	employee_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	salary NUMBER(8),
	first_name VARCHAR(20),
	PRIMARY KEY(employee_id)
);

-- Insert multiples rows at the same time, consider constrants
INSERT ALL
	INTO TEST_DB.employees(employee_id, salary, first_name) VALUES (1, 1200, 'Eric')
	INTO TEST_DB.employees(employee_id, salary, first_name) VALUES (2, 1000, 'Jão')
SELECT 1 FROM DUAL;

DECLARE
	v_salary NUMBER(8);
	v_fname VARCHAR(20);
BEGIN
	SELECT salary, first_name
	INTO v_salary, v_fname
	FROM TEST_DB.employees
	WHERE employee_id = 1;

	DBMS_OUTPUT.PUT_LINE(v_salary || ' Has salary ' || v_fname );
END;

-- Class 4 Anchored Datatype --
CREATE TABLE TEST_DB.students(
	stu_id	NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	first_name	VARCHAR(20),
	PRIMARY KEY(stu_id)
);

-- Insert multiple rows at the same time
INSERT INTO TEST_DB.students(first_name)
	SELECT 'Eric Ambiel' FROM DUAL UNION ALL
	SELECT 'Maria' FROM DUAL;

DECLARE
	v_fname TEST_DB.students.first_name%TYPE; -- Anchored
    -- Datatype
BEGIN
	SELECT first_name INTO v_fname FROM TEST_DB.students FETCH FIRST ROWS ONLY; -- SELECT firt VALUE, same as LIMIT ON MySQL/PostgreSQL
	DBMS_OUTPUT.PUT_LINE(v_fname);
END;

-- Class 5 - Constants --
SET SERVEROUT ON;
DECLARE
	v_pi CONSTANT NUMBER(7,6) := 3.141592;
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_pi);
END;

-- DEFAULT KEYWORD --
DECLARE
	v_pi CONSTANT NUMBER(7,6) DEFAULT 3.141592;
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_pi);
END;

-- Class 6 - Bind|Host Variable
-- SQL*Plus --
VARIABLE v_bind1 VARCHAR2(100);
EXEC :v_bind1 := 'Print Bind Variable in SQL*Plus';
PRINT v_bind1;

-- PL/SQL --
SET SERVEROUT ON;
BEGIN
	:v_bind1 := 'Print Bind Variable in PL/SQL';
	DBMS_OUTPUT.PUT_LINE(:v_bind1);
END;

-- Autoprint values after declare --
SET AUTOPRINT ON;
VARIABLE v_bind2 VARCHAR2(30);
EXEC :v_bind2 := 'Manin';

-- Class 8 - Conditions --
DECLARE
    v_num NUMBER := 9;
BEGIN
    IF v_num < 10 THEN
        DBMS_OUTPUT.PUT_LINE('Inside of IF');
    END IF;
    DBMS_OUTPUT.PUT_LINE('Outside of IF');
END;
/
DECLARE
    v_website   VARCHAR2(30)    := 'devpackage.xyz';
    v_author    VARCHAR2(30)    := 'Eric Ambiel';
BEGIN
    IF v_website = 'devpackage.xyz' AND v_author = 'Eric Ambiel' THEN
        DBMS_OUTPUT.PUT_LINE('Pass inside IF');
    end if;
    DBMS_OUTPUT.PUT_LINE('Outside if IF');
end;

-- Class 9 - IF ELSE Statement --
DECLARE
    v_num NUMBER := &enter_a_number;
BEGIN
    IF MOD(v_num, 2) = 0 THEN -- Returns the remainder of a multiplication and verify IF 0
        DBMS_OUTPUT.PUT_LINE(v_num || ' is Even!');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num || ' is Odd');
    end if;
        DBMS_OUTPUT.PUT_LINE('IF Them Else Construct Complete');
end;



















