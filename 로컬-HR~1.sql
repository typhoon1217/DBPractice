SELECT * FROM EMPLOYEES WHERE employee_id = 100;
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = 90;

SELECT * FROM EMPLOYEES E
    INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    WHERE EMPLOYEE_ID = 100;
-- DEPARTMENT ID 까지 E의 내용 그 이후는 D의 내용이후는 D의 내용
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES E
    INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    WHERE EMPLOYEE_ID = 100;

    
--ALTER TABLE EMPLOYEES ADD CONSTRAINT EMPLOYEES_DEPARTMENTS_DEPARTMENTID_FK FOREIGN KEY (DEPARTMENT_ID) 
--REFERENCES DEPARTMENTS(DEPARTMENT_ID);