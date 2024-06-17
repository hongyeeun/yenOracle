-- 3일차
-- 오라클 함수의 종류
-- 1. 단일행 함수 - 결과값 여러개
-- 2. 다중행 함수 - 결과값 1개 (그룹함수)
SELECT SUM(SALARY) FROM EMPLOYEE;

-- a. 숫자 처리 함수
-- ABS(절댓값), MOD(나머지), TRUNC(소숫점 지점 버림), FLOOR(버림), ROUND(반올림), CEIL(올림)
SELECT SYSDATE-HIRE_DATE FROM EMPLOYEE;
SELECT TRUNC(SYSDATE-HIRE_DATE,1) FROM EMPLOYEE;    -- 소수점 첫째 자리 이후로 다 버림
-- 함수의 결과를 테스트해볼 수 있게 해주는 가상의 테이블 DUAL
SELECT MOD(35, 3) FROM DUAL; 
SELECT ABS(-1) FROM DUAL;
SELECT SYSDATE FROM DUAL;
-- b. 문자 처리 함수
-- c. 날짜 처리 함수
--  ADD_MONTHS(), MONTHS_BETWEEN(), LAST_DAY(), EXTRACT, SYSDATE
SELECT ADD_MONTHS(SYSDATE, 3) FROM DUAL;    --3개월 뒤를 출력해줌
SELECT MONTHS_BETWEEN(SYSDATE, '24/05/07') FROM DUAL;   --  두 날짜의 차이(개월)를 계산
SELECT LAST_DAY(SYSDATE) FROM DUAL; -- 해당 달의 마지막 날짜를 출력
SELECT LAST_DAY('24/02/23')+1 FROM DUAL;    -- 다음 달의 첫 날
-- EXTRACT 년도, 월, 일 추출해줌, DATE에서 추출해줌
SELECT EXTRACT (YEAR FROM SYSDATE) FROM DUAL;
SELECT EXTRACT (MONTH FROM SYSDATE) FROM DUAL;
SELECT EXTRACT (DAY FROM SYSDATE) FROM DUAL;

DESC EMPLOYEE;
-- ex1) EMPLOYEE 테이블에서 사원의 이름, 입사일, 입사 후 3개월이 된 날짜를 조회하시오.
SELECT EMP_NAME "이름", HIRE_DATE "입사일", 
ADD_MONTHS(HIRE_DATE, 3) "입사 후 3개월이 된 날" FROM EMPLOYEE;
-- ex2) EMPLOYEE 테이블에서 사원의 이름, 입사일, 근무 개월수를 조회하시오.
SELECT EMP_NAME "이름", HIRE_DATE "입사일", 
FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "근무 개월수" FROM EMPLOYEE;
-- ex3) EMPLOYEE 테이블에서 사원이름, 입사일, 입사월의 마지막날을 조회하세요.
SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE) FROM EMPLOYEE;
-- ex4) EMPLOYEE 테이블에서 사원이름, 입사 년도, 입사 월, 입사 일을 조회하시오.
SELECT EMP_NAME, EXTRACT(YEAR FROM HIRE_DATE)||'년' AS 입사년도, 
EXTRACT(MONTH FROM HIRE_DATE)||'월' AS 입사월, 
EXTRACT(DAY FROM HIRE_DATE)||'일' AS 입사일 FROM EMPLOYEE;
-- 연결 연산자 || 을 통해 출력값에 추가해준다.

COMMIT;