-- Create as SYS or SYSTEM user/table
CREATE TABLE schema_audit
    (
        ddl_date        DATE,
        ddl_user        VARCHAR2(25),
        ddl_schema      VARCHAR2(255),
        obj_created     VARCHAR2(25),
        obj_name        VARCHAR2(25),
        ddl_operation   VARCHAR2(25)
    );
/
CREATE OR REPLACE TRIGGER hr_audit_tr
AFTER DDL ON SCHEMA
ENABLE
BEGIN
    INSERT INTO schema_audit VALUES (
        sysdate,
        sys_context('USERENV','CURRENT_USER'),
        sys_context('USERENV','CURRENT_USER'),
        ora_dict_obj_type,
        ora_dict_obj_name,
        ora_sysevent);
END;
/
CREATE TABLE DELETE_THIS_TABLE_1(same_column NUMBER);
DROP TABLE DELETE_THIS_TABLE_1;

SELECT  * FROM schema_audit;