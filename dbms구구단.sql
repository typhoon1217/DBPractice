DECLARE
    x NUMBER := 9; -- �ʱ�ȭ�� ���� x
BEGIN
    FOR i IN 1..x LOOP
        DBMS_OUTPUT.PUT_LINE('------------------------ ' || i || '�� ---------------------------------------'); -- �� ���� ������ ���
        FOR j IN 1..x LOOP
            DBMS_OUTPUT.PUT(i || ' * ' || j || ' = ' || (i * j) || ' | ');
        END LOOP;
        DBMS_OUTPUT.NEW_LINE(); -- �� �� ��� �� ���ο� ���� �߰�
    END LOOP;
END;
/
