DECLARE
    v_counter  NUMBER := 0;
    v_multiple NUMBER := &multiplicator;
    v_result   NUMBER;
BEGIN
    LOOP
        v_counter := v_counter + 1;
        v_result := v_multiple * v_counter;

        DBMS_OUTPUT.PUT_LINE(v_multiple || ' x ' || v_counter || ' = ' || v_result);

        EXIT WHEN v_counter >= 10;
    end loop;
end;