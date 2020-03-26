SELECT * FROM JOBS WHERE MIN_SALARY > 10000
    2. Display the first name and join date of the employees who joined between 2002 and 2005.

SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES 
WHERE TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN 2002 AND 2005 ORDER BY HIRE_DATE
   
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES WHERE JOB_ID IN ('IT_PROG', 'SA_MAN')
    
SELECT * FROM EMPLOYEES  where hire_date > '01-jan-2008' 

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID in (150,160)
   
SELECT FIRST_NAME, SALARY, COMMISSION_PCT, HIRE_DATE FROM EMPLOYEES WHERE SALARY < 10000

SELECT JOB_TITLE, MAX_SALARY-MIN_SALARY DIFFERENCE FROM JOBS WHERE MAX_SALARY BETWEEN 10000 AND 20000

SELECT FIRST_NAME, SALARY, ROUND(SALARY, -3) FROM EMPLOYEES

SELECT * FROM JOBS ORDER BY JOB_TITLE

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE  FIRST_NAME  LIKE 'S%' OR LAST_NAME LIKE 'S%'

SELECT * FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'MON')= 'MAY'
   
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL AND SALARY BETWEEN 5000 AND 10000 AND DEPARTMENT_ID=30

SELECT FIRST_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE)+1 FROM EMPLOYEES

SELECT FIRST_NAME, HIRE_DATE, FLOOR((SYSDATE-HIRE_DATE)/365) FROM EMPLOYEES

SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'YYYY')=2001

SELECT INITCAP(FIRST_NAME), INITCAP(LAST_NAME) FROM EMPLOYEES

SELECT JOB_TITLE,  SUBSTR(JOB_TITLE,1, INSTR(JOB_TITLE, ' ')-1) FROM JOBS
    18. Display the length of first name for employees where last name contain character ‘b’ after 3rd position.
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE INSTR(LAST_NAME,'B') > 3

SELECT UPPER(FIRST_NAME), LOWER(EMAIL) FROM EMPLOYEES WHERE UPPER(FIRST_NAME)= UPPER(EMAIL)

SELECT * FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'YYYY')=TO_CHAR(SYSDATE, 'YYYY')

SELECT SYSDATE - to_date('01-jan-2011') FROM DUAL
    
SELECT TO_CHAR(HIRE_DATE,'MM'), COUNT (*) FROM EMPLOYEES 
WHERE TO_CHAR(HIRE_DATE,'YYYY')= TO_CHAR(SYSDATE,'YYYY') GROUP BY TO_CHAR(HIRE_DATE,'MM') 


 SELECT MANAGER_ID, COUNT(*) FROM EMPLOYEES GROUP BY MANAGER_ID
    
 SELECT EMPLOYEE_ID, MAX(END_DATE) FROM JOB_HISTORY GROUP BY EMPLOYEE_ID

SELECT COUNT(*) FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'DD') > 15
    
SELECT COUNTRY_ID,  COUNT(*)  FROM LOCATIONS GROUP BY COUNTRY_ID
    
SELECT DEPARTMENT_ID, AVG(SALARY) FROM EMPLOYEES 
WHERE COMMISSION_PCT IS NOT NULL GROUP BY DEPARTMENT_ID
    
SELECT JOB_ID, COUNT(*), SUM(SALARY), MAX(SALARY)-MIN(SALARY) SALARY FROM EMPLOYEES GROUP BY JOB_ID

SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES 
GROUP BY JOB_ID 
HAVING AVG(SALARY)>10000

SELECT TO_CHAR(HIRE_DATE,'YYYY') FROM EMPLOYEES 
GROUP BY TO_CHAR(HIRE_DATE,'YYYY') 
HAVING COUNT(EMPLOYEE_ID) > 10
  
SELECT DEPARTMENT_ID FROM EMPLOYEES 
WHERE COMMISSION_PCT IS NOT NULL
GROUP BY DEPARTMENT_ID 
HAVING COUNT(COMMISSION_PCT)>5
    
SELECT EMPLOYEE_ID FROM JOB_HISTORY GROUP BY EMPLOYEE_ID HAVING COUNT(*) > 1

SELECT JOB_ID FROM JOB_HISTORY 
WHERE END_DATE-START_DATE > 100 
GROUP BY JOB_ID 
HAVING COUNT(*)>3

SELECT DEPARTMENT_ID, TO_CHAR(HIRE_DATE,'YYYY'), COUNT(EMPLOYEE_ID) 
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY DEPARTMENT_ID
    
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, MANAGER_ID 
HAVING COUNT(EMPLOYEE_ID) > 5
  
UPDATE EMPLOYEES SET SALARY = 8000 WHERE EMPLOYEE_ID = 115 AND SALARY < 6000
  
INSERT INTO EMPLOYEES  (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE,JOB_ID, SALARY, DEPARTMENT_ID) 
VALUES (207, 'ANGELA', 'SNYDER','ANGELA','215 253 4737', SYSDATE, 'SA_MAN', 12000, 80)

DELETE FROM DEPARTMENTS WHERE DEPARTMENT_ID=20
    
UPDATE EMPLOYEES SET JOB_ID= 'IT_PROG' 
WHERE EMPLOYEE_ID=110 AND DEPARTMENT_ID=10 AND NOT JOB_ID LIKE 'IT%' 
    
INSERT INTO DEPARTMENTS (150,'SPORTS',120,1200)
  
SELECT DEPARTMENT_NAME, COUNT(*) FROM EMPLOYEES NATURAL JOIN DEPARTMENTS GROUP BY DEPARTMENT_NAME

SELECT EMPLOYEE_ID, JOB_TITLE, END_DATE-START_DATE DAYS 
FROM JOB_HISTORY NATURAL JOIN JOBS 
WHERE DEPARTMENT_ID=30

SELECT DEPARTMENT_NAME, FIRST_NAME FROM DEPARTMENTS D JOIN EMPLOYEES E ON (D.MANAGER_ID=E.EMPLOYEE_ID)

SELECT DEPARTMENT_NAME, FIRST_NAME, CITY FROM DEPARTMENTS D JOIN EMPLOYEES E ON (D.MANAGER_ID=E.EMPLOYEE_ID) JOIN LOCATIONS L USING (LOCATION_ID)

SELECT COUNTRY_NAME, CITY, DEPARTMENT_NAME 
FROM COUNTRIES JOIN LOCATIONS USING (COUNTRY_ID) 
JOIN DEPARTMENTS USING (LOCATION_ID)
    
SELECT JOB_TITLE, DEPARTMENT_NAME, LAST_NAME, START_DATE 
FROM JOB_HISTORY JOIN JOBS USING (JOB_ID) JOIN DEPARTMENTS 
USING (DEPARTMENT_ID) JOIN  EMPLOYEES USING (EMPLOYEE_ID) 
WHERE TO_CHAR(START_DATE,'YYYY') BETWEEN 2000 AND 2005

SELECT JOB_TITLE, AVG(SALARY) FROM EMPLOYEES 
NATURAL JOIN JOBS GROUP BY JOB_TITLE

SELECT JOB_TITLE, FIRST_NAME, MAX_SALARY-SALARY DIFFERENCE FROM EMPLOYEES NATURAL JOIN JOBS
   
SELECT JOB_TITLE, FIRST_NAME, MAX_SALARY-SALARY DIFFERENCE FROM EMPLOYEES NATURAL JOIN JOBS WHERE DEPARTMENT_ID  = 30

SELECT JH.*
FROM  JOB_HISTORY JH JOIN EMPLOYEES E ON (JH.EMPLOYEE_ID = E.EMPLOYEE_ID)
WHERE SALARY > 15000

SELECT DEPARTMENT_NAME, FIRST_NAME, SALARY 
FROM DEPARTMENTS D JOIN EMPLOYEES E ON (D.MANAGER_ID=E.MANAGER_ID) 
WHERE  (SYSDATE-HIRE_DATE) / 365 > 5 
  
SELECT FIRST_NAME FROM  EMPLOYEES E1 JOIN EMPLOYEES E2 ON (E1.MANAGER_ID=E2.EMPLOYEE_ID) 
WHERE E1.HIRE_DATE < E2.HIRE_DATE

SELECT FIRST_NAME, JOB_TITLE FROM EMPLOYEES E JOIN JOB_HISTORY  JH ON (JH.EMPLOYEE_ID = E.EMPLOYEE_ID) JOIN JOBS J  ON( JH.JOB_ID = J.JOB_ID) 
WHERE  MONTHS_BETWEEN(END_DATE,START_DATE)  < 6 

SELECT FIRST_NAME, COUNTRY_NAME FROM EMPLOYEES JOIN DEPARTMENTS USING(DEPARTMENT_ID) 
JOIN LOCATIONS USING( LOCATION_ID) 
JOIN COUNTRIES USING ( COUNTRY_ID)

 
SELECT DEPARTMENT_NAME, AVG(SALARY), COUNT(COMMISSION_PCT) 
FROM DEPARTMENTS JOIN EMPLOYEES USING (DEPARTMENT_ID) 
GROUP BY DEPARTMENT_NAME
   
SELECT TO_CHAR(HIRE_DATE,'MON-YY')
FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID) JOIN  LOCATIONS USING (LOCATION_ID) 
WHERE  CITY = 'Seattle'
GROUP BY TO_CHAR(HIRE_DATE,'MON-YY')
HAVING COUNT(*) > 5

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID IN 
( SELECT DEPARTMENT_ID FROM EMPLOYEES 
  GROUP BY DEPARTMENT_ID 
  HAVING MAX(SALARY)>10000)

SELECT * FROM DEPARTMENTS WHERE MANAGER_ID IN 
  (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE FIRST_NAME='SMITH')

SELECT * FROM JOBS WHERE JOB_ID IN 
       (SELECT JOB_ID FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'YYYY')=TO_CHAR(SYSDATE,'YYYY'))

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID NOT IN 
       (SELECT EMPLOYEE_ID FROM JOB_HISTORY)

SELECT JOB_TITLE, AVG(SALARY) FROM JOBS NATURAL JOIN EMPLOYEES 
GROUP BY JOB_TITLE 
WHERE EMPLOYEE_ID IN
    (SELECT EMPLOYEE_ID FROM JOB_HISTORY)
   
SELECT COUNTRY_NAME, CITY, COUNT(DEPARTMENT_ID)
FROM COUNTRIES JOIN LOCATIONS USING (COUNTRY_ID) JOIN DEPARTMENTS USING (LOCATION_ID) 
WHERE DEPARTMENT_ID IN 
    (SELECT DEPARTMENT_ID FROM EMPLOYEES 
	 GROUP BY DEPARTMENT_ID 
	 HAVING COUNT(DEPARTMENT_ID)>5)
GROUP BY COUNTRY_NAME, CITY;

SELECT FIRST_NAME FROM EMPLOYEES 
WHERE EMPLOYEE_ID IN 
(SELECT MANAGER_ID FROM EMPLOYEES 
 GROUP BY MANAGER_ID 
 HAVING COUNT(*)>5)
 

SELECT FIRST_NAME, JOB_TITLE, START_DATE, END_DATE
FROM JOB_HISTORY JH JOIN JOBS J USING (JOB_ID) JOIN EMPLOYEES E  ON ( JH.EMPLOYEE_ID = E.EMPLOYEE_ID)
WHERE COMMISSION_PCT IS NULL
 
SELECT  * FROM DEPARTMENTS
WHERE DEPARTMENT_ID NOT IN 
( SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FLOOR((SYSDATE-HIRE_DATE)/365) < 2) 

SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID FROM EMPLOYEES 
 WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM JOB_HISTORY) 
 GROUP BY DEPARTMENT_ID
 HAVING MAX(SALARY) >10000)
   
SELECT * FROM JOBS 
WHERE JOB_ID IN 
 (SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID IN 
        (SELECT EMPLOYEE_ID FROM JOB_HISTORY WHERE JOB_ID='IT_PROG'))
    
SELECT DEPARTMENT_ID,FIRST_NAME, SALARY FROM EMPLOYEES OUTER WHERE SALARY = 
    (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = OUTER.DEPARTMENT_ID)

SELECT CITY FROM LOCATIONS WHERE LOCATION_ID = 
    (SELECT LOCATION_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID =
             	(SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID=105)
	)

select salary 
from employees main
where  2 = (select count( distinct salary ) 
            from employees
            where  salary > main.Salary)

