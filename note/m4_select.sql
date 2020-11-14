SELECT * FROM employee; -- 查詢所有欄位
SELECT ename , hiredate , salary FROM  employee; -- 查詢部分欄位

SELECT 17/4 , 17 div 4 , 17%4 ,17*Null; -- 算術運算子

SELECT ename AS '員工姓名',salary*12 AS '年薪' FROM employee; -- 別名

SELECT SUBSTRING(ename,1,1) '姓氏' FROM employee; -- 擷取部分字串
SELECT SUBSTRING(ename,2) '姓名' FROM employee;
SELECT SUBSTRING('David Wang',1,5) ;
SELECT SUBSTRING('David Wang',7) ;
SELECT SUBSTRING('David Wang',-4) ;
SELECT SUBSTRING('David Wang',-4,2) ;
SELECT CONCAT(ename,' is a ',title) '員工' FROM employee; -- 串接字串
SELECT LENGTH('我是一個strdent') 'length' ; -- 字串長度
SELECT CHAR_LENGTH('我是一個strdent') 'length' ; -- 幾個字元

SELECT SYSDATE(); -- 傳回日期時間
SELECT NOW(); -- 傳回日期時間 (不會改)
SELECT SYSDATE(), SLEEP(2),SYSDATE(); -- SLEEP(2)是休息2秒的意思
SELECT NOW(), SLEEP(2),NOW();
SELECT SYSDATE() + interval 5 day; -- 日期/時間的加減
SELECT SYSDATE() - interval 3 minute;
SELECT CURDATE(); -- 傳回日期
SELECT CURTIME(); -- 傳回時間
SELECT ADDDATE(CURDATE(),5); -- 加日期(預設是天)
SELECT ADDDATE(CURDATE(),interval 5 day); -- 等同上面
SELECT SUBDATE(CURDATE(),interval 3 year); -- 減日期

SELECT empno,ename,hiredate,YEAR(hiredate)'year',MONTH(hiredate)'month',DAY(hiredate)'day' FROM employee; -- 傳回int值,取得日期
SELECT empno,ename,hiredate,
	DATEDIFF(NOW(),hiredate) div 365 'year', -- 年資(整除)
    DATEDIFF(NOW(),hiredate) / 365 'year', -- 年資
    ROUND(DATEDIFF(NOW(),hiredate) / 365) 'year', -- 年資(四捨五入)
    ROUND(DATEDIFF(NOW(),hiredate) / 365,1) 'year' FROM employee; -- 年資(小數點1位)


SELECT empno,ename,salary,salary*IF(salary >= 50000,2,1.5) 'bouns' FROM employee; -- IF函數 如果...
SELECT empno,ename,salary,
	CASE
		WHEN salary >100000 THEN 'A'
        WHEN salary BETWEEN 70000 AND 100000 THEN 'B'
        WHEN salary BETWEEN 50000 AND 69999 THEN 'C'
        WHEN salary BETWEEN 30000 AND 49999 THEN 'D'
        ELSE 'E'
	END 'Grade'
FROM employee;       -- 多種條件的判斷
SELECT DISTINCT deptno FROM employee; -- 去除重複的資料列(值)
SELECT DISTINCT deptno,title FROM employee; -- 去除重複的資料列(若有兩個以上 會查出所有組合)
select * FROM employee WHERE deptno = 100; -- 篩選資料列
select * FROM employee WHERE title = 'engineer';
select * FROM employee WHERE hiredate = '2010/11/10'; -- 日期要加單引號 
select * FROM employee WHERE salary BETWEEN 30000 AND 40000; -- 介於兩個之間 包含頭尾值
SELECT * FROM department WHERE mgrno IS NULL; -- 是否為NULL值
select * FROM employee WHERE title IN ('manager','engineer'); --  in 集合所列的範圍中
select * FROM employee WHERE ename LIKE '林%'; -- LIKE 包含某字串
select * FROM employee WHERE ename LIKE '%生';
select * FROM employee WHERE ename LIKE '%麗%';
select * FROM employee WHERE ename LIKE '_麗%';
select * FROM employee WHERE title LIKE '%SA\_%'; -- ESCAPE 脫離字元
select * FROM employee WHERE title LIKE '%SA#_%' ESCAPE '#'; -- ESCAPE 脫離字元
select * FROM employee WHERE salary >= 45000 AND ename LIKE '林%'; -- AND 運算子
select * FROM employee WHERE salary >= 45000 OR ename LIKE '林%'; -- OR 運算子

select * FROM employee WHERE salary NOT BETWEEN 30000 AND 40000; -- NOT運算子
SELECT * FROM department WHERE mgrno IS NOT NULL;
select * FROM employee WHERE title NOT IN ('manager','engineer');
select * FROM employee WHERE ename NOT LIKE '林%';


SELECT * FROM employee ORDER BY hiredate DESC; -- 依欄位名稱排序
SELECT ename,deptno,salary FROM employee ORDER BY deptno,salary DESC; -- 多個欄位排序
SELECT ename,deptno,salary FROM employee ORDER BY deptno DESC ,salary DESC;
SELECT ename ,salary*12 'Annual' FROM employee ORDER BY Annual; -- 依別名排序
SELECT ename ,salary*12 'Annual' FROM employee ORDER BY salary*12; -- 依運算式排序
SELECT ename,deptNO,salary FROM employee ORDER BY 3; -- 依欄位編號排序
SELECT * FROM employee ORDER BY 3;
SELECT * FROM employee ORDER BY hiredate LIMIT 3; -- 取前幾筆資料
SELECT * FROM employee ORDER BY salary DESC LIMIT 3;

SELECT SUM(salary) 'sum',AVG(salary) 'average',MAX(salary)'maximum',MIN(salary) 'minimum' FROM employee; -- 集合函數
SELECT COUNT(*) 'Number' FROM employee;
SELECT COUNT(deptno) 'Number' FROM employee;
SELECT COUNT(DISTINCT deptno) 'Number' FROM employee;
SELECT COUNT(mgrno) 'Count' FROM department;
SELECT deptno,COUNT(*) 'Count',AVG(salary) 'Average' FROM employee GROUP BY deptno; -- 以某欄位為集合透過集合函數來計算
SELECT deptno,COUNT(*) 'Count',AVG(salary) 'Average' FROM employee GROUP BY deptno ORDER BY AVG(salary);
SELECT deptno,title, SUM(salary) 'Total' FROM employee GROUP BY deptno,title;
SELECT deptno,COUNT(*) 'Count',AVG(salary) 'Average' FROM employee GROUP BY deptno HAVING AVG(salary) > 50000 ; -- 限制GROUP BY的條件

