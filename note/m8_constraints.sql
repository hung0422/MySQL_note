CREATE TABLE emp1(
-- column level constraint
empno		DECIMAL(4)		PRIMARY KEY,
ename		VARCHAR(30)		NOT NULL,
hiredate	date			NOT NULL,
email		VARCHAR(30)		UNIQUE,
salary		INT,
deptno		DECIMAL(3)		NOT NULL,
title		VARCHAR(20)		NOT NULL DEFAULT 'engineer',
-- table level constraint
CONSTRAINT emp_deptno_fk FOREIGN KEY (deptno)
	REFERENCES department(deptno)
);


ALTER TABLE `db01`.`emp1`    -- 變更FOREIGN KEY限制條件 
DROP FOREIGN KEY `emp_deptno_fk`;
ALTER TABLE `db01`.`emp1` 
ADD CONSTRAINT `emp_deptno_fk`
  FOREIGN KEY (`deptno`)
  REFERENCES `db01`.`department` (`deptno`)
  ON UPDATE CASCADE;

ALTER TABLE `db01`.`emp1`    -- 變更FOREIGN KEY限制條件 
DROP FOREIGN KEY `emp_deptno_fk`;
ALTER TABLE `db01`.`emp1` 
ADD CONSTRAINT `emp_deptno_fk`
  FOREIGN KEY (`deptno`)
  REFERENCES `db01`.`department` (`deptno`)
  ON DELETE CASCADE;
  
CREATE TABLE men(                            -- 欄位自動編序號
memmo INT 			PRIMARY KEY 	AUTO_INCREMENT,
mname VARCHAR(30) 	NOT NULL
) AUTO_INCREMENT = 100;

INSERT INTO men (mname) VALUES ('David Ho'),('Maria Wang'),('Pam Pan'),('Tina Lee'),('Jean Taso'); 

SELECT LAST_INSERT_ID();    -- 查詢最後的自動編號