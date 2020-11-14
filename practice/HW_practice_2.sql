-- 1 
SELECT * FROM food;

-- 2
SELECT name,expiredate,price FROM food;

-- 3
SELECT name '食物名稱',expiredate '到期日' , price '價格' FROM food;

-- 4
SELECT DISTINCT catalog FROM food;

-- 5
SELECT CONCAT(name,' ',catalog) 'Food name & catalog' FROM food;

-- 6
SELECT name , price FROM food WHERE price > 400;

-- 7
SELECT name , price FROM food WHERE price BETWEEN 250 AND 530;

-- 8
SELECT name , price FROM food WHERE price NOT BETWEEN 250 AND 530;

-- 9
SELECT name , price FROM food WHERE catalog = '點心' ;

-- 10
SELECT name , price,catalog FROM food WHERE catalog ='點心' OR catalog = '飲料';

-- 11
SELECT name , price FROM food WHERE placeid = 'TW' OR placeid = 'JP';

-- 12
SELECT name , expiredate , price FROM food WHERE name LIKE '%油%';

-- 13
SELECT name , price FROM food WHERE expiredate < '2020-12-31';

-- 14
SELECT name , price FROM food WHERE expiredate < '2021-06-30';

-- 15
SELECT name , price FROM food WHERE expiredate < '2020-12-22';   -- ***

-- 16
SELECT name , expiredate , price FROM food ORDER BY price DESC;

-- 17
SELECT name , expiredate , price FROM food ORDER BY price DESC LIMIT 3;

-- 18
SELECT name , price FROM food WHERE catalog = '點心' AND price <= 250 ORDER BY price;

-- 19
SELECT name , price , ROUND(price * 1.05) 'New Price' FROM food ;

-- 20
SELECT name , price , ROUND(price * 1.05) 'New Price' , ROUND(price * 1.05) - price 'Increase' FROM food ;

-- 21
SELECT name , price , 
					CASE
                    WHEN price <= 250 THEN CEILING(price *1.08)
                    WHEN price > 251 AND price <= 500 THEN CEILING(price * 1.05)
                    WHEN price > 501 THEN CEILING(price * 1.03)
					END 'New Price' FROM food;     					
                    
-- 22
SELECT name , catalog , DATEDIFF(NOW(),expiredate) 'Days of expired',
						IF(DATEDIFF(NOW(),expiredate) > 0,'未過期','有過期')'expired or not' 
                        FROM food ;
                        
-- 23
SELECT name , catalog , DATEDIFF(NOW(),expiredate) 'Days of expired',
						IF(DATEDIFF(NOW(),expiredate) > 0,'未過期','有過期')'expired or not' 
                        FROM food ORDER BY DATEDIFF(NOW(),expiredate) ;                      
                        
-- 24
SELECT MAX(price) 'Max' , MIN(price) 'Min' , SUM(price) 'Sum' , ROUND(AVG(price)) 'Avg' FROM food;

-- 25
SELECT catalog , MAX(price) 'Max' , MIN(price) 'Min' , SUM(price) 'Sum' , ROUND(AVG(price)) 'Avg' FROM food GROUP BY catalog ;

-- 26
SELECT catalog , MAX(price) 'Max' , MIN(price) 'Min' , SUM(price) 'Sum' , ROUND(AVG(price)) 'Avg' 
			FROM food GROUP BY catalog HAVING ROUND(AVG(price)) >300 ORDER BY ROUND(AVG(price)) DESC ;
            
-- 27
SELECT catalog , COUNT(catalog) FROM food GROUP BY catalog ;

-- 28
SELECT placeid , catalog , COUNT(catalog) FROM food GROUP BY placeid , catalog ;