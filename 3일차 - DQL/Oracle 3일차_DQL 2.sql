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