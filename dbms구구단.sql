DECLARE
    x NUMBER := 9; -- 초기화된 변수 x
BEGIN
    FOR i IN 1..x LOOP
        DBMS_OUTPUT.PUT_LINE('------------------------ ' || i || '단 ---------------------------------------'); -- 각 단의 시작을 출력
        FOR j IN 1..x LOOP
            DBMS_OUTPUT.PUT(i || ' * ' || j || ' = ' || (i * j) || ' | ');
        END LOOP;
        DBMS_OUTPUT.NEW_LINE(); -- 각 단 출력 후 새로운 라인 추가
    END LOOP;
END;
/
