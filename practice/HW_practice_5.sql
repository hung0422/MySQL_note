-- 1
INSERT INTO food
	VALUE ('DK004','奶茶','2020-12-31 00:00:00','TW',100,'飲料');
    
-- 2
INSERT INTO food (id,name,expiredate,placeid,price,catalog)
	VALUE ('DK005','檸檬茶','2020-12-31 00:00:00','TW',90,'飲料');
    
-- 3   
INSERT INTO food
	VALUE ('SG003','鹽','2020-12-31 00:00:00','TW',90,'調味品') ,
			('SG004','糖','2020-12-31 00:00:00','TW',90,'調味品');

-- 4
UPDATE food SET price = 100 WHERE id = 'DK005';

-- 5

-- 6
DELETE FROM food WHERE id = 'SG004';
DELETE FROM food WHERE id = 'SG003';
DELETE FROM food WHERE id = 'DK004';
DELETE FROM food WHERE id = 'DK005';