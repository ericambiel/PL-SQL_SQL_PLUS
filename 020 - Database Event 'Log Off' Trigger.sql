CREATE OR REPLACE TRIGGER hr_lgon_audit
BEFORE LOGOFF ON SCHEMA
BEGIN
    INSERT INTO hr_evnt_audit VALUES(ORA_SYSEVENT,
                                     NULL,
                                     NULL,
                                     sysdate,
                                     TO_CHAR(sysdate, 'hh24:mi:ss')
                                     );
    COMMIT;
end;
/
SELECT * FROM hr_evnt_audit;