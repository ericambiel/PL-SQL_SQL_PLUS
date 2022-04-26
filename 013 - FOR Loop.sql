DECLARE
    v_multiple NUMBER := &multiplicator;
    v_result NUMBER;
BEGIN
--     FOR v_counter IN REVERSE 1 .. 10 -- Decrement counter, backwards
    FOR v_counter IN  1 .. 10
        LOOP
            v_result := v_multiple * v_counter;
            DBMS_OUTPUT.PUT_LINE(v_multiple || ' x ' || v_counter || ' = ' || v_result);
        end loop;
end;