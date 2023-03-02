-- 변수 사용
USE sqldb;

SET @myVar = 5;
SELECT @myVar;

SET @myVar = '가수이름 ==> ';

SELECT @myVar, name
  FROM usertbl
 WHERE height > 170;
 
SELECT name, height + @myVar
  FROM usertbl;

-- 형 변환
SELECT CAST(birthYear AS CHAR(4)) FROM usertbl;
SELECT CONVERT((birthYear, CHAR(4)) AS SIGNED INTEGER) FROM usertbl;

SELECT CAST(addr AS decimal) FROM usertbl;
SELECT CONVERT(addr, decimal) FROM usertbl;

SELECT CAST('1000' AS decimal);

-- 암시적 형변환
SELECT 200 + 300;

SELECT CONCAT('Hello','World');

SELECT '200' + '300'; -- MySQL이외에서는 '200300' 그러나 여기선 500
SELECT CONCAT(200,'300'); -- CONCAT은 문자열 더하기, 이건 200300

SELECT 2 = 1;		-- 2와 1이 같냐는 질문, TRUE면 1, FALSE면 0이 반환
