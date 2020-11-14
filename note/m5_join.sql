SELECT emp.ename , dept.dname FROM emp,dept;  -- CROSS JOIN
SELECT emp.ename , dept.dname FROM emp CROSS JOIN dept;  -- ANSI CROSS JOIN

SELECT emp.ename , dept.dname 
	FROM emp,dept
	WHERE emp.deptno = dept.deptno;  -- EQUAL JOIN
    
SELECT emp.ename , dept.dname 
	FROM emp  JOIN dept
	ON emp.deptno = dept.deptno; --  EQUAL JOIN(ANSI)
    
 SELECT emp.ename ,emp.deptno, dept.dname 
	FROM emp,dept
	WHERE emp.deptno = dept.deptno;   
    
SELECT emp.ename ,emp.deptno, dept.dname 
	FROM emp  JOIN dept
	ON emp.deptno = dept.deptno;
    
SELECT emp.ename ,emp.deptno, dept.dname  
	FROM emp  JOIN dept
	USING (deptno) ;
    
SELECT emp.ename ,emp.deptno, dept.dname 
	FROM emp  natural JOIN dept;
    
SELECT emp.ename ,emp.deptno, dept.dname 
	FROM emp,dept
	WHERE emp.deptno = dept.deptno
    AND title = 'manager';  -- 加入條件
    
SELECT emp.ename,emp.deptno , dept.dname 
	FROM emp  JOIN dept
	ON emp.deptno = dept.deptno
    WHERE title = 'manager';  --  加入條件 (ANSI)
    
 SELECT e.ename ,e.deptno, d.dname 
	FROM emp e,dept d
	WHERE e.deptno = d.deptno;     -- 表格別名
    
SELECT e.ename ,e.deptno, d.dname 
	FROM emp e JOIN dept d
	ON e.deptno = d.deptno;    -- 表格別名 (ANSI)
    
SELECT e.ename ,d.dname, c.cname 
	FROM emp e,dept d ,city c
	WHERE e.deptno = d.deptno
    AND d.cityno = c.cityno;  -- JOIN 多個表格
    
SELECT e.ename ,d.dname, c.cname 
	FROM emp e  JOIN  dept d 
	ON e.deptno = d.deptno
    JOIN  city c
    ON d.cityno = c.cityno;  -- JOIN 多個表格 (ANSI)
    
SELECT e.ename , e.salary , g.level
	FROM emp e , grade g
    WHERE e.salary BETWEEN g.lowest AND g.highest; -- NON-EQUAL JOIN
    
SELECT e.ename  ,d.dname , e.salary , g.level
	FROM emp e ,dept d , grade g
    WHERE e.deptno = d.deptno
    AND e.salary BETWEEN g.lowest AND g.highest;
    
SELECT e.ename ,e.deptno, d.dname 
	FROM emp e left JOIN dept d
	ON e.deptno = d.deptno; -- left outer join
    
SELECT e.ename ,d.deptno, d.dname 
	FROM emp e right JOIN dept d
	ON e.deptno = d.deptno; -- RIGHT OUTER JOIN
    
SELECT e.ename ,e.deptno, d.dname 
	FROM emp e left JOIN dept d
	ON e.deptno = d.deptno
UNION
SELECT e.ename ,d.deptno, d.dname  
	FROM emp e right JOIN dept d
	ON e.deptno = d.deptno;     -- FULL OUTER JOIN
    
SELECT worker.ename 'worker name',
	   manager.ename 'manager name'
	FROM  emp worker,emp manager  -- 一定要有別名
    WHERE worker.mgrno = manager.empno;  -- SELF JOIN