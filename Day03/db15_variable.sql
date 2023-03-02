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

/* 내장함수 리스트 */
-- 흐름함수
SELECT IF(100>200, '참', '거짓');

-- NULL은 계싼이 오류(결과도 NULL)
SELECT IFNULL(NULL,0) + 100;

-- 쿼리작성할 때 많이 사용
SELECT name
     , birthYear
     , addr
     , CASE addr
       WHEN '서울' THEN '수도권'
       WHEN '경기' THEN '수도권'
       WHEN '부산' THEN '광역시'
       ELSE '광역권' END AS '권역'
  FROM usertbl;
  
  -- 문자열함수
SELECT ASCII('A'), CHAR(65), ASCII('a');
SELECT ASCII('안'), CHAR(236); 		-- 한글 불가
-- CHAR_LENGTH(글자길이), LENTH(byte)
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
-- UTF-8
SELECT char_length('가나다'), length('가나다');  -- 한글 한 글자당 3byte
  
SELECT REPLACE('Hello World', 'Hello', 'Byebye');
-- DB는 인덱스를 1부터 시작
SELECT INSTR('안녕하세요, 여러분', '여');
-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLMN', 3);
-- UPPER, LOWER
SELECT UPPER('Hellow World'), LOWER('Hello World');

-- LTRIM, RTRIM, TRIM
SELECT LTRIM('          Hello World!          ') AS 'ltrim'
	 , RTRIM('          Hello World!          ') AS 'rtrim'
     , TRIM('          Hello World!          ') AS 'trim';

-- 'Hello' * 3
SELECT REPEAT('Hello', 3);

-- substring
SELECT SUBSTRING('대한민국만세', 5, 2);

-- 수학함수, 절대값
SELECT ABS(-10);

-- 올림과 내림, 반올림
SELECT CEILING(4.7), FLOOR(4.9), ROUND(4.5);

SELECT MOD(157,10);

SELECT RAND(), FLOOR(1 + (RAND()*(6)));

-- 날짜 및 시간함수
SELECT NOW();
SELECT ADDDATE('2023-03-02', INTERVAL -10 DAY);

SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAY(NOW());
SELECT TIME(NOW());
SELECT DAYOFWEEK(NOW()); # 1(일)~7(토)
SELECT LAST_DAY('2023-02-01');

-- 시스템 함수
SELECT USER();
SELECT DATABASE();

USE sqldb;
UPDATE buytbl SET price = price * 2;
SELECT ROW_COUNT();

SELECT VERSION()
