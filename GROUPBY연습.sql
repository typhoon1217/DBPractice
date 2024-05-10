SELECT 
*
--FIRST_NAME, MIN(SALARY) -- 안되는 케이스 단일 그룹의 그룹함수가 아님
--TO_CHAR(MIN(HIRE_DATE),'YY-MM-DD')  --DATE를 TOCHAR에 원하는  형식으로 변환
--MAX(HIRE_DATE)  --최대 날자
--ROUND(AVG(SALARY),-2)   --자리수로 
--TO_CHAR (SUM(SALARY),'$999,999') AS TOTAL  --덧셈
--COUNT(*), COUNT(COMMISSION_PCT) --널제외 카운트 
FROM EMPLOYEES; 

--단일 그룹의 그룹함수가 아닌 경우 그룹바이로 단일 그룹함수 처리
SELECT 
FIRST_NAME, MIN(SALARY)
FROM EMPLOYEES 
GROUP BY FIRST_NAME;  --적절하지 않은 표현 자기 이름으로 최솟값을 표현?

SELECT 
DEPARTMENT_ID, MIN(SALARY), MAX (SALARY), 
SUM(SALARY), ROUND(AVG(SALARY),1)
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID DESC;


--HAVING

SELECT -- 안되는 예제 절에 조건은 WHERE지만 그룹의 결과는 HAVING 사용
DEPARTMENT_ID, ROUND(AVG(SALARY),1)
FROM EMPLOYEES 
WHERE AVG(SALARY) > 5000
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID DESC;

SELECT -- 수정 HAVING 사용 예제 
--SELECT 절에 조건을 사용하여 결과를 제한할 때는 WHERE 절을 사용하지만, 그룹의 결과를 제한할
--때는 HAVING절을 사용한다.
DEPARTMENT_ID, MIN(SALARY), MAX (SALARY)
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) > 5000
ORDER BY DEPARTMENT_ID DESC;

---ROLLUP
SELECT 
DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES 
GROUP BY ROLLUP(DEPARTMENT_ID, JOB_ID)  
-- 그룹바이로 롤업 합계를 내주는 기능 거의 사용할일이 없음 알아두면 좋음
ORDER BY DEPARTMENT_ID;

--CUBE는 명시한 표현식 개수에 따라 가능한 모든 조합별로 집계한 결과를 반환한다.
SELECT 
DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES 
GROUP BY CUBE(DEPARTMENT_ID, JOB_ID)  
-- 그룹바이로 큐브 합계를 내주는 기능 거의 사용할일이 없음 알아두면 좋음
ORDER BY DEPARTMENT_ID;

--집합 연산자
CREATE TABLE exp_goods_asia ( -- 한국과 일본의 10대 수출품 테이블
country VARCHAR2(10), -- 나라명
seq NUMBER, -- 번호
goods VARCHAR2(80) -- 상품명
);
INSERT INTO exp_goods_asia VALUES ('한국', 1, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('한국', 2, '자동차');
INSERT INTO exp_goods_asia VALUES ('한국', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('한국', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('한국', 5, 'LCD');
INSERT INTO exp_goods_asia VALUES ('한국', 6, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('한국', 7, '휴대전화');
INSERT INTO exp_goods_asia VALUES ('한국', 8, '환식탄화수소');
INSERT INTO exp_goods_asia VALUES ('한국', 9, '무선송신기 디스플레이 부속품');
INSERT INTO exp_goods_asia VALUES ('한국', 10, '철 또는 비합금강');
INSERT INTO exp_goods_asia VALUES ('일본', 1, '자동차');
INSERT INTO exp_goods_asia VALUES ('일본', 2, '자동차부품');
INSERT INTO exp_goods_asia VALUES ('일본', 3, '전자집적회로');
INSERT INTO exp_goods_asia VALUES ('일본', 4, '선박');
INSERT INTO exp_goods_asia VALUES ('일본', 5, '반도체웨이퍼');
INSERT INTO exp_goods_asia VALUES ('일본', 6, '화물차');
INSERT INTO exp_goods_asia VALUES ('일본', 7, '원유제외 석유류');
INSERT INTO exp_goods_asia VALUES ('일본', 8, '건설기계');
INSERT INTO exp_goods_asia VALUES ('일본', 9, '다이오드, 트랜지스터');
INSERT INTO exp_goods_asia VALUES ('일본', 10, '기계류');

--1 UNION
--UNION은 합집합을 의미한다. 예를 들어, 두 개의 데이터 집합이 있으면 각 집합 원소(SELECT 결과)를
--모두 포함한 결과가 반환된다.
SELECT *
FROM EXP_GOODS_ASIA
WHERE COUNTRY='한국';

--서브쿼리

SELECT 
DEPARTMENT_ID
FROM EMPLOYEES 
