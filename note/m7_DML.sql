INSERT INTO department(deptno,dname,mgrno)
VALUES  (400,'Research',1001);  -- 新增一筆紀錄

INSERT INTO department
VALUES  (500,'Personnel',1001);

INSERT INTO department(deptno,dname)
VALUES  (601,'IT');

INSERT INTO department
VALUES  (602,'IT',Null);

INSERT INTO department(deptno,dname,mgrno)
VALUES  (603,'HDR',1003),(604,'STK',NULL);

INSERT INTO employee
VALUES (1009,'孫悟空','2013/11/10',
		56000,100,'senior enginer');
        
INSERT INTO employee
VALUES (1010,'李大文',CURDATE(),
		89000,200,'manager');        
        
CREATE TABLE emp_copy LIKE employee; -- 新增表格
INSERT INTO emp_copy SELECT * FROM employee; -- 複製進去

CREATE TABLE emp_copy1 LIKE employee;
ALTER TABLE emp_copy1 drop title;
ALTER TABLE emp_copy1 change empno empid decimal(4);
INSERT INTO emp_copy1 (empid,ename,deptno,hiredate,salary)
SELECT empno,ename,deptno,hiredate,salary
FROM employee
WHERE title NOT LIKE '%SA%';

UPDATE emp_copy -- 修改紀錄
SET salary = 45000
WHERE empno = 1008;

UPDATE emp_copy1
SET hiredate = CURDATE();  
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
SET SQL_SAFE_UPDATES = 0;  -- 關閉SQL預設安全阻擋機制
SET SQL_SAFE_UPDATES = 1;  -- 開啟SQL預設安全阻擋機制

DELETE FROM emp_copy WHERE empno = 1007;  -- 刪除紀錄
DELETE FROM emp_copy1;
DELETE FROM department
WHERE deptno BETWEEN 601 AND 604;

TRUNCATE emp_copy; -- 刪除表格所有紀錄