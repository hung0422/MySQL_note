CREATE VIEW empvu100       -- 建立檢視表 VIEW
AS SELECT empno,ename,salary
	FROM employee
	WHERE deptno = 100;
SELECT * FROM empvu100;

CREATE VIEW salvu100
AS SELECT empno id,ename name,salary*12 'annual_salart'
	FROM employee
	WHERE deptno = 100;
SELECT * FROM salvu100;

CREATE VIEW salvu100_1 (id,name,annual_salary)
AS SELECT empno,ename,salary*12
	FROM employee
	WHERE deptno = 100;
SELECT * FROM salvu100_1;

UPDATE empvu100
SET ename = '孫悟淨' WHERE empno = 1009;   -- 修改資料

UPDATE empvu100
SET ename = '孫大為' WHERE empno = 1003;   -- 不再範圍內 即使沒出現錯誤 依然不能改

UPDATE empvu100                            -- Error Code: 1054. Unknown column 'titlt' in 'field list'
SET titlt = 'SA' WHERE empno = 1009;

DELETE FROM empvu100 WHERE empno = 1009;    -- 刪除資料

CREATE VIEW emp_sal_vw                     -- 使用 WITH CHECK OPTION
AS SELECT empno,ename,salary
	FROM employee
    WHERE salary <= 40000
    WITH CHECK OPTION;
SELECT * FROM emp_sal_vw;
UPDATE emp_sal_vw                           -- Error Code: 1369. CHECK OPTION failed 'db01.emp_sal_vw'
SET salary = 40001 WHERE empno = 1002;


