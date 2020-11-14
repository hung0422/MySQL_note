START TRANSACTION;                  -- 外顯示交易之ROLLback
INSERT INTO department VALUES (601,'RD',1001);
INSERT INTO department VALUES (602,'IT',NULL);
SELECT * FROM department;
ROLLBACK;
SELECT * FROM department;

START TRANSACTION;                  -- 外顯示交易之commit
INSERT INTO department VALUES (601,'RD',1001);
INSERT INTO department VALUES (602,'IT',NULL);
SELECT * FROM department;
COMMIT;
SELECT * FROM department;

SET AutoCommit = 0;                 -- 隱含式交易
INSERT INTO department VALUES (603,'RD',1001);
INSERT INTO department VALUES (604,'IT',NULL);
SELECT * FROM department;
ROLLBACK;
SELECT * FROM department;
INSERT INTO department VALUES (605,'RD',1001);
INSERT INTO department VALUES (606,'IT',NULL);
SELECT * FROM department;
COMMIT;
SELECT * FROM department;
SET AutoCommit = 1;

BEGIN;                               -- SAVEPOINT
SELECT empno,ename,salary
	FROM employee
    WHERE empno IN (1001,1002,1003);
UPDATE employee SET salary = 60000 WHERE empno = 1001;
SAVEPOINT A;
UPDATE employee SET salary = 40000 WHERE empno = 1002;
SAVEPOINT B;
UPDATE employee SET salary = 80000 WHERE empno = 1003;
ROLLBACK TO A;
COMMIT;
SELECT empno,ename,salary
	FROM employee
    WHERE empno IN (1001,1002,1003);
    
    

BEGIN;          -- Lock 範例
SELECT salary
FROM employee
WHERE empno = 1001;

UPDATE employee
SET salary = 60001
WHERE empno = 1001;

COMMIT;

SELECT salary
FROM employee
WHERE empno = 1001;