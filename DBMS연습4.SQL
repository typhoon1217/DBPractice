DECLARE
    -- REPERENCE TYPE 변수선언(클래스타입)
    EMP_RECORD EMPLOYEES%ROWTYPE;

BEGIN
    SELECT * INTO EMP_RECORD
    FROM EMPLOYEES
    WHERE MANAGER_ID IS NULL;

    DBMS_OUTPUT.PUT_LINE('아이디 / 이름 / 직군 / 부서'); 
    DBMS_OUTPUT.PUT_LINE('----------------------------');

    DBMS_OUTPUT.PUT_LINE(RPAD(EMP_RECORD.EMPLOYEE_ID, 15) || '/' || 
                         RPAD(EMP_RECORD.FIRST_NAME, 10) || '/' || 
                         RPAD(EMP_RECORD.JOB_ID, 15) || '/' || 
                         RPAD(EMP_RECORD.DEPARTMENT_ID, 15));
    
END;
/

