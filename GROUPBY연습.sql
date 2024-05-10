SELECT 
*
--FIRST_NAME, MIN(SALARY) -- �ȵǴ� ���̽� ���� �׷��� �׷��Լ��� �ƴ�
--TO_CHAR(MIN(HIRE_DATE),'YY-MM-DD')  --DATE�� TOCHAR�� ���ϴ�  �������� ��ȯ
--MAX(HIRE_DATE)  --�ִ� ����
--ROUND(AVG(SALARY),-2)   --�ڸ����� 
--TO_CHAR (SUM(SALARY),'$999,999') AS TOTAL  --����
--COUNT(*), COUNT(COMMISSION_PCT) --������ ī��Ʈ 
FROM EMPLOYEES; 

--���� �׷��� �׷��Լ��� �ƴ� ��� �׷���̷� ���� �׷��Լ� ó��
SELECT 
FIRST_NAME, MIN(SALARY)
FROM EMPLOYEES 
GROUP BY FIRST_NAME;  --�������� ���� ǥ�� �ڱ� �̸����� �ּڰ��� ǥ��?

SELECT 
DEPARTMENT_ID, MIN(SALARY), MAX (SALARY), 
SUM(SALARY), ROUND(AVG(SALARY),1)
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID DESC;


--HAVING

SELECT -- �ȵǴ� ���� ���� ������ WHERE���� �׷��� ����� HAVING ���
DEPARTMENT_ID, ROUND(AVG(SALARY),1)
FROM EMPLOYEES 
WHERE AVG(SALARY) > 5000
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID DESC;

SELECT -- ���� HAVING ��� ���� 
--SELECT ���� ������ ����Ͽ� ����� ������ ���� WHERE ���� ���������, �׷��� ����� ������
--���� HAVING���� ����Ѵ�.
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
-- �׷���̷� �Ѿ� �հ踦 ���ִ� ��� ���� ��������� ���� �˾Ƶθ� ����
ORDER BY DEPARTMENT_ID;

--CUBE�� ����� ǥ���� ������ ���� ������ ��� ���պ��� ������ ����� ��ȯ�Ѵ�.
SELECT 
DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES 
GROUP BY CUBE(DEPARTMENT_ID, JOB_ID)  
-- �׷���̷� ť�� �հ踦 ���ִ� ��� ���� ��������� ���� �˾Ƶθ� ����
ORDER BY DEPARTMENT_ID;

--���� ������
CREATE TABLE exp_goods_asia ( -- �ѱ��� �Ϻ��� 10�� ����ǰ ���̺�
country VARCHAR2(10), -- �����
seq NUMBER, -- ��ȣ
goods VARCHAR2(80) -- ��ǰ��
);
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 1, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 2, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 5, 'LCD');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 6, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 7, '�޴���ȭ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 8, 'ȯ��źȭ����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 9, '�����۽ű� ���÷��� �μ�ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 10, 'ö �Ǵ� ���ձݰ�');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 1, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 2, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 5, '�ݵ�ü������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 6, 'ȭ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 7, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 8, '�Ǽ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 9, '���̿���, Ʈ��������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 10, '����');

--1 UNION
--UNION�� �������� �ǹ��Ѵ�. ���� ���, �� ���� ������ ������ ������ �� ���� ����(SELECT ���)��
--��� ������ ����� ��ȯ�ȴ�.
SELECT *
FROM EXP_GOODS_ASIA
WHERE COUNTRY='�ѱ�';

--��������

SELECT 
DEPARTMENT_ID
FROM EMPLOYEES 
