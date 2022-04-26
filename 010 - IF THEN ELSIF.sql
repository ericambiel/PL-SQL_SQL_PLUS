-- Class 10 - IF THEN ELSEIF Statement --
DECLARE
    v_place VARCHAR2(30) := &enter_place;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_place);
    IF v_place = 'Metropolis' THEN
        DBMS_OUTPUT.PUT_LINE('City is protected by Superman');
    ELSIF v_place = 'Gotham' THEN
        DBMS_OUTPUT.PUT_LINE('Gotham is protected by Batman');
    ELSIF v_place = 'Amazon' THEN
        DBMS_OUTPUT.PUT_LINE('City is protected by Wonder Woman');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The place you give not protect by Justice League');
    END IF;
    DBMS_OUTPUT.PUT_LINE('Thanks for contacting us !!!');
END;