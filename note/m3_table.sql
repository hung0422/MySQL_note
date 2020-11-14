CREATE TABlE employee (
empno		decimal(4)		PRIMARY KEY,
ename		varchar(30)		NOT NULL,
hiredate	date			NOT NULL,
salary		int				NOT NULL,
deptno		decimal(3)		NOT NULL,
title		varchar(20)		NOT NULL
);   -- 建立一個資料表


CREATE TABLE `db01`.`department` (
  `deptno` DECIMAL(3) NOT NULL,
  `dname` VARCHAR(30) NOT NULL,
  `mgrno` DECIMAL(4) NULL,
  PRIMARY KEY (`deptno`));   -- 建立一個資料表

SHOW TABLES; -- 查看所有表格
SHOW TABLE STATUS; -- 查看所有表格詳細資訊
DESC employee; -- 查看欄位設計


DESC t1;
CREATE TABLE t(a varchar(20) , b decimal , c date);
ALTER TABLE t ADD d char(10);  -- 新增一個欄位 (預設最後一個欄位)
ALTER TABLE t ADD e decimal(8) FIRST; -- 新增一個欄位 (第一欄位)
ALTER TABLE t ADD f varchar(5) AFTER b; -- 在f欄位新增一個欄位 (在f欄位後新增欄位b)
ALTER TABLE t MODIFY c datetime; -- 修改欄位型態或順序
ALTER TABLE t CHANGE f g varchar(12); -- 修改欄位名稱或定義 (f 改名 g)
ALTER TABLE t DROP b; -- 刪除欄位 (b欄位)
ALTER TABLE t RENAME t1; -- 修改表格名稱 (t改成t1)
DROP TABLE t1; -- 刪除資料表 (t1)

CREATE TABLE r1 LIKE employee; -- 複製表格
DESC r1;
DROP TABLE r1;