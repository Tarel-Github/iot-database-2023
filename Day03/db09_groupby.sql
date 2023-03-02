-- 집계함수를 사용하기 위해서 / 그룹핑
-- USE sqldb;

-- GROUP BY에 작성된 컬럼명만 SELECT에 쓸 수 있음(*를 사용할 수 없음)
-- buytbl 테이블의 userId값을 가져오는데, 같은 값끼리 하나로 묶는다.
-- buytbl 테이블의 amount값을 가져오는데, userID가 같은 값끼리 평균을 구한다.
-- 이로써 유저별로 구매수량의 평균을 구할 수 있다.
SELECT userID AS '아이디'
     , AVG(amount) AS '평균 구매갯수'
  FROM buytbl
 GROUP BY userID;

-- HAVING은 집계 함수 등의 결과 값을 조건으로 필터링하기 위해서 사용
SELECT userID
     , SUM(price * amount) AS '합산'
  FROM buytbl
 GROUP BY userID
HAVING SUM(price * amount) >= 1000;

-- ROLLUP 전체합계 계산
SELECT userID
     , SUM(price * amount) AS '합산'
  FROM buytbl
 GROUP BY userID
  WITH ROLLUP;
