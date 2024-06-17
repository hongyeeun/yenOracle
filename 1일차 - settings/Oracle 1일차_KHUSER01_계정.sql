SHOW USER;

-- 테이블 생성은 CREATE TABLE
CREATE TABLE EMPLOYEE(
    NAME VARCHAR2(20),
    T_CODE VARCHAR2(10),
    D_CODE VARCHAR2(10),
    AGE NUMBER
);
-- 1. 컬럼의 데이터 타입없이 테이블 생성하여 오류남
-- -> 데이터 타입 작성
-- 2. 권한도 없이 테이블을 생성하여 오류남
-- -> System_계정에서 RESOURCE 권한부여
-- 3. 접속해제 후 접속, 새로운 워크시트 말고 기존 워크시트에서 접속을 선택하여 
-- 명령어 재실행

-- 삽입은 INSERT INRO
INSERT INTO EMPLOYEE(NAME, T_CODE, D_CODE, AGE)
VALUES('일용자', 'T1', 'D1', 33);
INSERT INTO EMPLOYEE(NAME, T_CODE, D_CODE, AGE)
VALUES('이용자', 'T2', 'D1', 44);
INSERT INTO EMPLOYEE
VALUES('심용자', 'T1', 'D2', 32);
--  INSERT하고자 하는 컬럼이 모든 컬럼인 경우 컬럼명 생략이 가능하다.
-- 단, 컬럼의 순서를 지켜서 VALUES에 값을 기입해야 한다

-- 테이블 삭제는 DROP TABLE
DROP TABLE EMPLOYEE;
-- 삭제한 후에 다시 테이블 생성하려면 CREATE 부터 다시~

-- 삭제 : 테이블의 행을 삭제하는 구문
DELETE FROM EMPLOYEE;
-- WHERE 없으면 모든 행 삭제된다.
DELETE FROM EMPLOYEE WHERE NAME = '일용자';
--  WHERE 후에 조건 (WHERE과 무조건 같이 쓰인다) / NAME이 '일용자'인 행 지움

-- 수정 : WHERE 이후 조건의 어떠한 컬럼값을 수정한다.
UPDATE EMPLOYEE SET T_CODE ='T3' WHERE NAME='일용자';

-- 선택해서 출력
-- WHERE을 통해 조건에 해당하는 것만 출력 가능하다.
SELECT NAME, T_CODE, D_CODE, AGE FROM EMPLOYEE
WHERE NAME = '일용자';
-- 물론 전체 출력도 가능하다. ( * FROM) : 회사에선 X
SELECT * FROM EMPLOYEE;

-- 이름이 STUDENT_TBL인 테이블을 만드세요.
-- 이름, 나이, 학년, 주소를 저장할 수 있도록 하며
CREATE TABLE STUDENT_TBL(
    NAME VARCHAR(20),
    AGE NUMBER,
    GRADE NUMBER,
    ADDRESS VARCHAR(30)
);
-- 출력문
SELECT * FROM STUDENT_TBL;
-- 일용자, 21, 1, 서울시 중구를 저장해주세요.
INSERT INTO STUDENT_TBL
VALUES('일용자', 21, 1, '서울시 중구');
-- 일용자를 사용자로 바꿔주세요.
UPDATE STUDENT_TBL SET NAME='사용자' WHERE NAME='일용자';
-- 데이터를 삭제하는 쿼리문을 작성하고 삭제를 확인하시고
DELETE FROM STUDENT_TBL;
-- 테이블을 삭제하는 쿼리문을 작성하여 테이블이 사라진 것을 확인하세요.
DROP TABLE STUDENT_TBL;

-- 아이디가 KHUSER02 비밀번호가 KHUSER02인 계정을 생성하고
-- 접속이 되도록하고 테이블도 만들 수 있도록 하세요.
CREATE USER KHUSER02 IDENTIFIED BY KHUSER02;
SHOW USER;