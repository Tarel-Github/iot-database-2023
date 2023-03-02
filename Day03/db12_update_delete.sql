-- UPDATE & TRANSACTION
START TRANSACTION;

-- 경고! UPDATE 구문에는 WHERE절을 빼면 안됨!!
UPDATE usertbl_bak
   SET mobile1 = '010'
     , mobile2 = '1234'
     , addr = '부산'
 WHERE userID = 'SMS';
 
COMMIT;
ROLLBACK;

-- DELETE
-- WHERE절이 빠지면 죄다 날려버린다. 상당히 위험하다.
DELETE FROM usertbl
 WHERE userID = 'HGS'