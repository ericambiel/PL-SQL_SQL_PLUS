CREATE TABLE hr_evnt_audit
    (
        event_type  VARCHAR2(20),
        logon_date  DATE,
        logon_time  VARCHAR2(15),
        logof_date  DATE,
        logof_time  VARCHAR2(15)
    );
/
CREATE OR REPLACE TRIGGER hr_lgon_audit
AFTER LOGON ON SCHEMA
BEGIN
    INSERT INTO hr_evnt_audit VALUES(ORA_SYSEVENT,
                                     sysdate,
                                     TO_CHAR(sysdate, 'hh24:mi:ss'),
                                     NULL,
                                     NULL);
    COMMIT;
end;
/
SELECT * FROM hr_evnt_audit;