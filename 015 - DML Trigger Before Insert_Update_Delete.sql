CREATE TABLE superheroes (
    sh_name VARCHAR2 (20)
);

-- Example 1 - Before Insert--
CREATE OR REPLACE TRIGGER bi_superheroes
BEFORE INSERT ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user  VARCHAR2 (20);
BEGIN
    SELECT user INTO v_user FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('You will just insert a Line Mr. ' || v_user);
end;
/
-- Example 2 - Before Update--
CREATE OR REPLACE TRIGGER bu_superheroes
BEFORE UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user  VARCHAR2(20);
BEGIN
    SELECT user INTO v_user FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('You will just update a Line Mr. ' || v_user);
end;
/
-- Will be printed a sentence after each query, less DELETE --
INSERT INTO superheroes VALUES ('Batman');
UPDATE superheroes SET  sh_name = 'Superman' WHERE sh_name = 'Batman';
DELETE FROM superheroes WHERE sh_name = 'Superman';

-- Example 3 - Before INSERT OR DELETE OR UPDATE--
CREATE OR REPLACE TRIGGER tr_superheroes
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user  VARCHAR2(20);
BEGIN
    SELECT user INTO v_user FROM DUAL;
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('One row will be inserted ' || v_user);
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('One row will be deleted ' || v_user);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('One row will be updated ' || v_user);
    end if;
end;

SELECT * FROM superheroes;

-- Will be printed a sentence after each query --
INSERT INTO superheroes VALUES ('Batman');
UPDATE superheroes SET  sh_name = 'Superman' WHERE sh_name = 'Batman';
DELETE FROM superheroes WHERE sh_name = 'Superman';