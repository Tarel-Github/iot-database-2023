-- 그냥 테이블 접근
SELECT *
  FROM memberTBL;
  
-- 뷰 생성, memberTBL 테이블에서 Name과 Address만 가져와서 View를 생성
CREATE VIEW uv_memberTBL
    AS
    SELECT memberName, memberAddress
      FROM memberTBL;
      
-- 뷰로 조회(uv는 UserView의 약자)
SELECT *
  FROM uv_membertbl;