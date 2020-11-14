SELECT * FROM food;

-- 1
SELECT name , expiredate , price FROM food WHERE price > (SELECT price FROM food WHERE name = '鳳梨酥');

-- 2
SELECT name , expiredate , price FROM food 
	WHERE price < (SELECT price FROM food WHERE name = '曲奇餅乾')
    AND catalog = (SELECT catalog FROM food GROUP BY '點心');
    
-- 3
SELECT name , expiredate , price FROM food 
	WHERE YEAR(expiredate) = (SELECT YEAR(expiredate) FROM food WHERE name ='鳳梨酥');

-- 4
SELECT name , expiredate , price FROM food WHERE price > (SELECT AVG(price) FROM food);

-- 5
SELECT name , expiredate , price FROM food 
	WHERE price < (SELECT AVG(price) FROM food)
    AND placeid in (SELECT placeid FROM food WHERE placeid = 'TW');

-- 6
SELECT name , expiredate , price FROM food
	WHERE catalog = (SELECT catalog FROM food WHERE name = '仙貝')
    AND price < (SELECT price FROM food WHERE name = '仙貝');
    
-- 7
SELECT name , expiredate , price FROM food
	WHERE placeid = (SELECT placeid FROM food WHERE name = '仙貝')
    AND expiredate IN (SELECT expiredate FROM food WHERE expiredate < SUBDATE(CURDATE(),INTERVAL 6 MONTH));

-- 8
SELECT placeid , name , expiredate , price FROM food f
	WHERE price IN (SELECT MIN(price) FROM food WHERE placeid = f.placeid );
    
SELECT placeid , name , expiredate , price FROM food f
	WHERE price IN  (SELECT MIN(price) FROM food GROUP BY placeid HAVING placeid = f.placeid);  
    
-- 9
SELECT catalog , name , price FROM food f
	WHERE price = (SELECT MAX(price) FROM food WHERE catalog = f.catalog);
    
SELECT catalog , name , price FROM food f
	WHERE price in (SELECT MAX(price) FROM food GROUP BY catalog having catalog = f.catalog);
    
-- 10
SELECT name , catalog , price FROM food 
	WHERE catalog NOT IN (SELECT catalog FROM food WHERE catalog = '點心')
    AND price >ALL (SELECT price FROM food WHERE catalog = '點心')
    ORDER BY price DESC;
    
-- 11
SELECT p.name , f.name , f.price 
	FROM food f JOIN place p 
    ON f.placeid = p.id
	WHERE price in (SELECT MAX(price) FROM food GROUP BY placeid HAVING placeid = f.placeid);
    
SELECT p.name , f.name , f.price 
	FROM food f JOIN place p 
    ON f.placeid = p.id
	WHERE price = (SELECT MAX(price) FROM food WHERE placeid = f.placeid);