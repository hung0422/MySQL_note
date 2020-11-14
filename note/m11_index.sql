SHOW INDEX FROM employee;         -- 查詢INDEX的狀況
CREATE INDEX ename_idx ON employee(ename) ;    -- 建立INDEX
DROP INDEX ename_idx ON employee;           -- 刪除INDEX