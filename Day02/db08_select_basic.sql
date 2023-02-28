-- 사용 데이터 베이스 변경
-- 왼쪽에서 우클릭, set as default schema 와 같음
USE homeplus;

-- SELECT ALL x 이러면 과장님한테 혼남
-- 한 문장 끝은 ; 으로 마침
-- 아래 두 문장은 같은 뜻
SELECT * FROM indextbl;
SELECT * FROM homeplus.indextbl;

-- 필요한 컬럼만 가져오겠다.
SELECT first_name, last_name FROM indextbl;

SELECT * FROM employee.titles; -- 다른 DB의 테이블에서 데이터를 가져올려면

-- sqldb를 사용
USE sqldb;

-- 조건절 검색 (아이디, 이름, 생일, 키 만 본다)
SELECT userId
     , name
     , birthYear
     , height 
  FROM usertbl
 WHERE name ='김경호';

-- 프로그래밍에서 조건절 같다는 == 이지만 DB에서는 = 만 쓴다.
-- DB에서는 쌍따옴표를 쓰지 않는다. 오직 홑따옴표만 쓴다.

-- 관계 연산자
SELECT *
  FROM usertbl
 WHERE birthYear >= 1970
   AND height >= 182;
   
-- 사이의 값을 조회
SELECT *
  FROM usertbl
 WHERE height >= 180
   AND height <= 183;

-- 위 문장은 WHERE height BETWEEN 180 AND 183; 과 같다.

-- IN 연산자
SELECT *
  FROM usertbl
 WHERE addr = '경남' OR addr = '경북' OR addr = '전남'; 
-- 위 연산자는 불편해서 IN 연산자를 써서 아래처럼 편하기 표현한다.
SELECT *
  FROM usertbl
 WHERE addr IN('경남','경북','전남'); 


-- 문자열 검색 - 뉴스 본문안에서 일정단어를 검색
SELECT *
  FROM usertbl
 WHERE name LIKE '%김%';

-- SubQuery (서브쿼리)
-- 서브쿼리의 사용위치는
-- 1. 컬럼위치
-- 2. 테이블 위치
-- 3. 조건절 위치
-- WHERE절에 서브쿼리가 컬럼이 한개 이상이거나 결과가 한개 이상이면
-- 조건연산자로 조회할 수 없음
SELECT name
	 , height
  FROM usertbl
 WHERE height > (SELECT height FROM usertbl WHERE name ='김경호');

-- 가상 테이블 (괄호 안은 서브쿼리)
-- (2023 - u.birthYear) 는 나이를 표시하기 위해 사용할 수 있다.
-- AS는 앞에 있는 결과물을 AS 뒤에 있는것으로 부르겠다는 뜻(AS는 별명)
SELECT u.userID
	 , u.name
     , (2023 - u.birthYear)
  FROM (
		SELECT userID, name, birthYear, addr
		  FROM usertbl
	   ) AS u 
 WHERE u.birthYear > 1969;

-- 칼럼에 쓰는 서브쿼리
-- 칼럼에 서브쿼리를 쓸 때, SELECT * 을 사용할 수 없다.
-- AS를 적극적으로 사용하면 보기가 좋다.
SELECT b.userID AS '아이디'
	 , (SELECT name FROM usertbl WHERE userID = b.userID) AS '이름'
     , b.prodName
     , b.price * amount AS '판매액'
  FROM buytbl AS b;
  
  -- 정렬 Order BY
  -- 정렬은 기본적으로 오름차순, 오름차순은 ASC이나 기본값이라서 없어도 무방
  -- 내림차순은 DESC

  SELECT name
       , birthYear
       , height
    FROM usertbl
   WHERE birthYear > 1069
   ORDER BY birthYear DESC, height ASC; -- 앞에 있는 birthYear을 먼저 정렬하고 그 다음 height를 정렬함

-- 중복제거 / 중복제거할 컬럼만
SELECT DISTINCT birthYear
  FROM usertbl;  
  
-- LIMIT 갯수 제한
USE homeplus;
SELECT * FROM indexTbl
 LIMIT 5;

USE sqlDB; 
-- 조회하면서 새로운 테이블 생성
-- PK / FK 제약조건은 복사안됨
-- 일부 칼럼(열)만 복사 테이블생성 가능
CREATE TABLE elec_buytbl_new
SELECT num
     , prodName
     , price
  FROM buytbl
 WHERE groupName = '전자';



