SELECT ename,salary FROM employee WHERE salary >(SELECT salary FROM employee WHERE ename = '潘麗珍'); -- SINGER-ROW 單筆紀錄子查詢
SELECT ename,title salary FROM employee
			WHERE title = (SELECT title FROM employee WHERE empno =1002)
			AND salary > (SELECT salary FROM employee WHERE empno =1005);
SELECT deptno,MIN(salary) 'Minimum Salary'
			FROM employee
			GROUP BY deptno
			HAVING MIN(salary) > (SELECT MIN(salary)
								FROM employee
								WHERE deptno = 200);
SELECT ename,title,salary,
	ROUND(salary*100/
		  (SELECT SUM(salary)
          FROM employee
          WHERE deptno = 100),1)'Percentage'
FROM employee
WHERE deptno = 100;
SELECT ename,title,salary,
		ROUND(salary*100/t.total,1)
        'Percenrage'
FROM employee,(SELECT SUM(salary)'total'
				FROM employee
                WHERE deptno =100) t
WHERE deptno = 100;

SELECT empno,ename    -- 子查詢傳回多個值不能用比較運算子      Error Code: 1242. Subquery returns more than 1 row
FROM employee
WHERE salary = (SELECT MIN(salary)
				FROM employee
                GROUP BY deptno);
                
SELECT ename,title,salary    -- MULTIPLE ROW SUBQUERY  多比筆紀錄子查詢
FROM employee
WHERE salary < ANY
				(SELECT salary
                FROM employee
                WHERE title = 'senior engineer')
AND title <> 'senior engineer';

SELECT ename,title,salary    -- 等同上面
FROM employee
WHERE salary < (SELECT MAX(salary)
                FROM employee
                WHERE title = 'senior engineer')
AND title <> 'senior engineer';

SELECT ename,title,salary    -- MULTIPLE ROW SUBQUERY  多比筆紀錄子查詢
FROM employee
WHERE salary < ALL
				(SELECT salary
                FROM employee
                WHERE title = 'senior engineer')
AND title <> 'senior engineer';

SELECT ename,title,salary    -- 等同上面
FROM employee
WHERE salary < (SELECT MIN(salary)
                FROM employee
                WHERE title = 'senior engineer')
AND title <> 'senior engineer';

SELECT ename
FROM emp
WHERE empno IN
			(SELECT DISTINCT mgrno
				FROM emp);
                
SELECT ename  -- 有NULL 不能這樣下
FROM emp
WHERE empno NOT IN
			(SELECT DISTINCT mgrno
				FROM emp);
                
SELECT ename -- 要改成這樣
FROM emp
WHERE empno not IN
			(SELECT DISTINCT mgrno
				FROM emp
                WHERE mgrno IS NOT NULL);
                
SELECT e.ename,e.title,e.salary,  -- CORRLATED SUBQUERY 互相關聯子查詢
		ROUND(salary * 100 /
				(SELECT SUM(salary)
                FROM employee
                WHERE deptno = e.deptno),1)'Percentage'
FROM employee e
WHERE e.deptno = 100;

CREATE TABLE emp100 AS    -- CREATE TABLE with query
SELECT empno,ename,salary*12 'annualSalary',hiredate
FROM employee
WHERE deptno = 100

