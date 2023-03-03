SELECT j.stdName, s.addr, j.clubName, c.roomNo
  FROM stdtbl AS s
 INNER JOIN stdclubtbl AS j
    ON s.stdName = j.stdName
 INNER JOIN clubtbl AS c
    ON c.clubName = j.clubName;