DECLARE
    v_counter NUMBER := 1;
    v_multiple NUMBER := &multiplicator;
    v_result NUMBER;
BEGIN
    WHILE v_counter <=  10 LOOP
        v_result := v_multiple * v_counter;
        DBMS_OUTPUT.PUT_LINE(v_multiple || ' x ' || v_counter || ' = ' || v_result);
        v_counter := v_counter + 1;
    end loop;
    DBMS_OUTPUT.PUT_LINE('Outside the Loop');
end;