CREATE TABLE sh_audit(
    new_name VARCHAR2(30),
    old_name VARCHAR2(30),
    user_name VARCHAR2(30),
    entry_date VARCHAR2(30),
    operation VARCHAR(30)
);
/
CREATE OR REPLACE TRIGGER superheroes_audit
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user  VARCHAR2(30);
    v_date  VARCHAR2(30);
BEGIN
    SELECT user,TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') INTO v_user, v_date FROM DUAL;

    IF INSERTING THEN
        INSERT INTO sh_audit(new_name, old_name, user_name, entry_date, operation)
        VALUES (:NEW.sh_name, NULL, v_user, v_date, 'INSERT');
    ELSIF DELETING THEN
        INSERT INTO sh_audit(new_name, old_name, user_name, entry_date, operation)
        VALUES (NULL, :OLD.sh_name, v_user, v_date, 'DELETE');
    ELSIF UPDATING THEN
        INSERT INTO sh_audit (new_name, old_name, user_name, entry_date, operation)
        VALUES (:NEW.sh_name, :OLD.sh_name, v_user, v_date, 'UPDATE');
    END IF;
END;

SHOW ERRORS TRIGGER superheroes_audit;


INSERT INTO superheroes VALUES ('Superman');
UPDATE SUPERHEROES SET SH_NAME = 'Batman' WHERE SH_NAME = 'Superman';
DELETE FROM SUPERHEROES WHERE SH_NAME = 'Batman';

SELECT * FROM sh_audit;
SELECT * FROM SUPERHEROES;