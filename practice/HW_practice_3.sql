-- 1
SELECT f.name , f.placeid , p.name , f.price
	FROM food f JOIN place p
    ON f.placeid = p.id ;

-- 2
SELECT f.name , p.name ,CONCAT(f.name,' ',p.name) 'Food name & place'
	FROM food f JOIN place p
    ON f.placeid = p.id ;

-- 3
SELECT f.name , f.price
	FROM food f JOIN place p
    ON f.placeid = p.id WHERE f.placeid = 'TW';
    
-- 4
SELECT f.name , f.price
	FROM food f JOIN place p
    ON f.placeid = p.id WHERE f.placeid = 'TW' OR f.placeid = 'JP' ORDER BY price DESC;
    
-- 5
SELECT f.name , f.expiredate , f.price
	FROM food f JOIN place p
    ON f.placeid = p.id WHERE f.placeid = 'TW' ORDER BY f.price DESC LIMIT 3 ;
    
-- 6
SELECT p.name , MAX(f.price) 'Max', MIN(f.price) 'Min' , SUM(f.price) 'Sum' , ROUND(AVG(f.price)) 'Avg'
	FROM food f JOIN place p
    ON f.placeid = p.id GROUP BY f.placeid ;
    
-- 7
SELECT p.name , catalog ,COUNT(catalog)
	FROM food f JOIN place p
    ON f.placeid = p.id GROUP BY f.placeid , catalog ;