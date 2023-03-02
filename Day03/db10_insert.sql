-- INSERT
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('SMS', '손민성', 1994, '부산', '010', '4130', 169, '2023-03-02');

-- 컬림을 다 적을 떄 입력안할 컬럼은 NULL로 지정
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('HGS', '홍길순', 2000, '한양', NULL, NULL, NULL, NULL);

-- NULL 컬럼은 생략 가능
INSERT INTO usertbl
(userID, name, birthYear, addr)
VALUES
('SHM', '손흥민', 1991, '서울');

-- 컬럼 지정을 생략가능(단, 입력할 값의 순서가 컬럼순서 일치)
INSERT INTO usertbl VALUES
('SJW', '손정웅', 1969, '서울', '010', '55664433', '176', NULL);


