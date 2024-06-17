DESC EMPLOYEE;

-- 데이터를 조회한 결과를 Result Set이라고 함
-- Result Set : SELECT 구문에 의해 반환된 행들의 집합
-- Result Set은 0개 이상의 행이 포함될 수 있음.
-- ResultSet은 특정한 기준에 의해 정렬될 수 있음.
-- 특정 컬럼이나 특정 행을 조회할 수 있음
SELECT EMP_ID, EMP_NAME FROM EMPLOYEE; -- ,를 이용해서 특정 컬럼 여러개 조회가능하다.
SELECT * FROM EMPLOYEE 
-- WHERE EMP_ID = '200';   -- 특정 행 조회
ORDER BY EMP_ID ASC;   -- 오름차순정렬
SELECT * FROM EMPLOYEE ORDER BY EMP_ID DESC; -- 내림차순 정렬

DESC EMPLOYEE;
-- SELECT 실습 문제
-- 1.EMPLOYEE 테이블에서 이름,연봉, 총수령액(보너스포함),
-- 실수령액(총 수령액-(월급*세금 3%))가 출력되도록 하시오.
SELECT EMP_NAME AS 이름 , SALARY*12 AS 연봉
, SALARY*12+SALARY*NVL(BONUS,0) AS "총수령액"
, SALARY*12+SALARY*NVL(BONUS,0)-(SALARY*0.03) AS "실수령액" 
-- NVL(값,0) : 이 값이 NULL 일때 0으로 처리해주는 함수 
-- -> 보너스가 없는 사람은 연봉이랑 똑같이 나온다.
FROM EMPLOYEE;
-- AS를 통해 단위명을 깔끔하게 바꿔줄 수 있다. 칼럼명 AS 단위명 ("" 혹은 그냥)

-- 2. EMPLOYEE 테이블에서 이름, 근무 일수를 출력해보시오.
-- (SYSDATE를 사용하면 현재 시간 출력)
SELECT EMP_NAME AS 이름, HIRE_DATE AS 입사일, SYSDATE AS 오늘
, ROUND(NVL(ENT_DATE,SYSDATE)-HIRE_DATE) AS 근무일수
FROM EMPLOYEE;
-- DATE끼리는 연산이 가능하다.
-- ROUND는 소수점을 없애주는 함수이다.
-- 3. EMPLOYEE 테이블에서 20년 이상 근속자의 이름,월급,보너스율 출력하시오
SELECT EMP_NAME AS 이름, SALARY AS 월급, NVL(BONUS,0) AS 보너스율
FROM EMPLOYEE
WHERE ROUND(NVL(ENT_DATE,SYSDATE)-HIRE_DATE)>=(20*365);

SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE EMP_NAME LIKE '전%'; 
-- %는 뒤나 앞 모든 글자, __ 같은 경우는 글자수 정해짐
DESC EMPLOYEE;
-- 1.EMPLOYEE 테이블에서 이름 끝이 연으로 끝나는 사원의 이름을 출력하시오
SELECT EMP_NAME AS 이름 FROM EMPLOYEE 
WHERE EMP_NAME LIKE '%연';
-- 2.EMPLOYEE 테이블에서 전화번호 처음 3자리가 010이 아닌 
-- 사원의 이름, 전화번호를 출력하시오
SELECT EMP_NAME AS 이름, PHONE AS 전화번호
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';
-- 3.EMPLOYEE 테이블에서 메일주소의 's'가 들어가면서,  --> %s%
-- DEPT_CODE가 D9 또는 D6이고  --> 조건이 2개니까 컬럼명 다시 써줘야함
-- 고용일이 90/01/01 ~ 01/12/01이면서,     --> DATE끼리 비교가능. '' 써줘서!
--- 월급이 270만원이상인 사원의 전체 정보를 출력하시오
SELECT * FROM EMPLOYEE
WHERE EMAIL LIKE '%s%' 
-- AND (DEPT_CODE = 'D9' OR DEPT_CODE='D6')
AND (DEPT_CODE IN('D9', 'D6'))  -- IN을 사용하면 OR의 기능이 있다. 이 D9, D6이 포함되어있냐?
-- AND (HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '01/12/01')
AND (HIRE_DATE BETWEEN '90/01/01' AND '01/12/01')   -- 이 사이에 있는지
AND SALARY >= 2700000;

DESC EMPLOYEE;
-- 최종 실습 문제
-- 문제1. 
-- 근속년수가 5년 이상, 10년 이하인 직원의 이름,주민번호,급여,입사일을 검색하여라
SELECT EMP_NAME AS 이름, EMP_NO AS 주민번호, SALARY AS 급여, HIRE_DATE AS 입사일
FROM EMPLOYEE
WHERE ROUND(NVL(ENT_DATE,SYSDATE)-HIRE_DATE) BETWEEN 365*5 AND 356*10 ; 
-- 문제2.
-- 재직중이 아닌 직원의 이름,부서코드, 고용일, 근무기간, 퇴직일을 검색하여라 
--(퇴사 여부 : ENT_YN)
SELECT EMP_NAME AS 이름, DEPT_CODE AS 부서코드, HIRE_DATE AS 고용일
, ROUND(NVL(ENT_DATE,SYSDATE)-HIRE_DATE) AS 근무기간, ENT_DATE AS 퇴직일
FROM EMPLOYEE
WHERE ENT_YN = 'Y';
-- 문제3.
-- 근속년수가 10년 이상인 직원들을 검색하여
-- 출력 결과는 이름,급여,근속년수(소수점X)를 근속년수가 오름차순으로 정렬하여 출력하라
-- 단, 급여는 50% 인상된 급여로 출력되도록 하여라.
SELECT EMP_NAME "이름", SALARY*1.5 "급여"
, FLOOR((SYSDATE-HIRE_DATE)/365) AS 근속년수
FROM EMPLOYEE 
WHERE FLOOR((SYSDATE-HIRE_DATE)/365)>=10 
ORDER BY 3 ASC ;    -- 칼람 순서를 숫자로 넣어서 3번째를 기준으로 정한다.
-- CEIL 은 반올림, FLOOR은 버림
-- 문제4.
-- 입사일이 99/01/01 ~ 10/01/01 인 사람 중에서 급여가 2000000 원 이하인 사람의
-- 이름,주민번호,이메일,폰번호,급여를 검색 하시오
SELECT EMP_NAME "이름", EMP_NO "주민번호", EMAIL "이메일", PHONE "폰번호", SALARY "급여"
FROM EMPLOYEE
WHERE (HIRE_DATE BETWEEN '99/01/01' AND '10/01/01') AND SALARY <=2000000;
-- 문제5.
-- 급여가 2000000원 ~ 3000000원 인 여직원 중에서 4월 생일자를 검색하여 
-- 이름,주민번호,급여,부서코드를 주민번호 순으로(내림차순) 출력하여라
-- 단, 부서코드가 null인 사람은 부서코드가 '없음' 으로 출력 하여라.
SELECT EMP_NAME "이름", EMP_NO "주민번호", SALARY "급여", NVL(DEPT_CODE,'없음') "부서코드"
FROM EMPLOYEE
WHERE (SALARY BETWEEN 2000000 AND 3000000) AND (EMP_NO LIKE '__04__-2%')
ORDER BY EMP_NO DESC;
-- 문제6.
-- 남자 사원 중 보너스가 없는 사원의 오늘까지 근무일을 측정하여 
-- 1000일 마다(소수점 제외) 
-- 급여의 10% 보너스를 계산하여 이름,특별 보너스 (계산 금액) 결과를 출력하여라.
-- 단, 이름 순으로 오름 차순 정렬하여 출력하여라.
SELECT EMP_NAME "이름",  SALARY,
SALARY*(FLOOR((SYSDATE-HIRE_DATE)/1000))*0.1 "특별 보너스", 
FLOOR((SYSDATE-HIRE_DATE)/1000) "근무일/1000"
FROM EMPLOYEE
WHERE (EMP_NO LIKE '%-1%') AND (BONUS IS NULL)
ORDER BY 1 ASC;

DESC EMPLOYEE;
-- extra1
-- EMPLOYEE 테이블에서 EMAIL ID 중 @ 앞자리가 5자리인 직원을 조회한다면?
SELECT * FROM EMPLOYEE
WHERE EMAIL LIKE '_____@%';
-- extra2
-- EMPLOYEE 테이블에서 EMAIL ID 중 '_' 앞자리가 3자리인 직원을 조회한다면?
SELECT * FROM EMPLOYEE
-- WHERE INSTR(EMAIL, '_', 1) = 4;
WHERE EMAIL LIKE '___\_%@%' ESCAPE '\';
-- 문자_대신 \로 취급해서 \_ 앞에 3자리인 수는 이렇게다~

-- 실습1
-- 관리자(MANAGER_ID)도 없고 부서 배치(DEPT_CODE)도 받지 않은  
-- 직원의 이름 조회하시오
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE FROM EMPLOYEE
WHERE MANAGER_ID IS NULL AND DEPT_CODE IS NULL;
-- 실습2
-- 부서배치를 받지 않았지만 보너스를 지급하는 직원 전체 정보 조회
SELECT * FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;
