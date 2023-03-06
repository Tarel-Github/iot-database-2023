/* BookRentalShop 연습 */
SELECT *
  FROM divtbl;

-- 서브쿼리
SELECT b.Author AS '저자'		-- 1
--   , b.Division AS '장르'		-- (주석화되었으므로 무시)
     , (SELECT Names
		  FROM divtbl
		 WHERE Division = b.Division) AS '장르' -- 2
     , b.Names AS '책제목'		-- 3
     , b.ISBN					-- 4
     , b.Price AS '금액'
  FROM bookstbl AS b
 ORDER BY b.Names ASC;		-- 책제목, 3, b.name 모두 같은 의미, (별명, 칼럼명, 인덱스번호 상관 없다는 소리)  
 
-- 조인 -- 서브쿼리 쓸 바에는 조인으로 변경하라
SELECT b.Author AS '저자'
	 , b.Division
     , d.Names AS '장르'
     , b.Names AS '책제목'
     , b.ISBN
     , b.Price AS '금액'
  FROM bookstbl AS b
 INNER JOIN divtbl AS d
    ON b.Division = d.Division
 ORDER BY b.Names;
 
-- 서브쿼리 - 장르로 그룹핑(서브쿼리가 쓰이는 경우)
SELECT (SELECT Names
		  FROM divtbl
		  WHERE Division = bb.Division) AS'장르'
, bb.총합
  FROM (
   SELECT b.Division
	    , SUM(b.Price) AS '총합'
        FROM bookstbl AS b
        GROUP BY b.Division
        
  )AS bb


 
