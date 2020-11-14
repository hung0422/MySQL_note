CREATE DATABASE db01; -- 建立一個資料庫
CREATE SCHEMA `db02` ; -- 建立一個資料庫
CREATE DATABASE IF NOT EXISTS db01; -- 建立一個資料庫
SHOW DATABASES; -- 顯示所有資料庫
USE db01; -- 切換要使用的資料庫   -- 代表註解的意思
SHOW CHARSET; -- 顯示MySQL所有支援的字元集
SHOW COLLATION; -- 顯示MySQL所有支援的Collation
SHOW COLLATION like 'big5%'; -- 顯示所有BIG5的COLLATION

ALTER DATABASE db02   -- 修改 db02 資料庫的語法和collation
CHARACTER SET big5
COLLATE big5_chinese_ci;
SELECT @@character_set_database , @@collation_database; -- 查看資料庫的字元集及COLLATION
DROP DATABASE db02; -- 刪除資料庫db02