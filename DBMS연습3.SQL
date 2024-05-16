DECLARE
    -- 클래스 타입 레코드 타입 정의
    TYPE EMP_RECORD_TYPE IS RECORD(
        EMPID EMPLOYEES.EMPLOYEE_ID%TYPE,
        EMPNAME EMPLOYEES.FIRST_NAME%TYPE,
        EMPJOB EMPLOYEES.JOB_ID%TYPE,
        EMPDEPID EMPLOYEES.DEPARTMENT_ID%TYPE
    );
    
    -- 레코드 타입 변수 선언
    EMP_RECORD EMP_RECORD_TYPE;
    
BEGIN
    SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID INTO EMP_RECORD
    FROM EMPLOYEES
    WHERE MANAGER_ID IS NULL;

    DBMS_OUTPUT.PUT_LINE('아이디 / 이름 / 직군 / 부서'); 
    DBMS_OUTPUT.PUT_LINE('----------------------------');

    DBMS_OUTPUT.PUT_LINE(RPAD(EMP_RECORD.EMPID, 15) || '/' || 
                         RPAD(EMP_RECORD.EMPNAME, 10) || '/' || 
                         RPAD(EMP_RECORD.EMPJOB, 15) || '/' || 
                         RPAD(EMP_RECORD.EMPDEPID, 15));
    
END;
/

