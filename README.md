# MySQL
###### Primary Key & Foreign Key
* Primary Key
  * 唯一且不重複
  * 沒有規定每個表格都要有
  * 目的:透過Primary Key查詢紀錄時通常會得到較佳的效能
* Foreign Key
  * 參考另一個表格的Primary Key或unique Key
  * 定義Foreign Key的表格稱為Depent 或Child表格
  * 被參考的表格則稱為Referenced 或Parent表格
  * Child表格的Foreign Key和parent表格的Primary Key為相同欄位
  
###### SQL常用分類
* CREATE
  * 建立資料庫中的物件，包括資料庫、表格等
* ALTER
  * 變更資料庫中的物件的結構
* DROP
  * 刪除資料庫中的物件
* SELECT
  * 查詢資料庫中表格的資料
    * SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT
* INSERT
  * 新增資料庫中表格的資料（列）
* UPDATE
  * 變更資料庫中表格的資料
* DELETE
  * 刪除資料庫中表格的資料（列）

###### 資料型態
* 整數
  * UNSIGNED:無負數
  * ZEROFILL:位數不足時以0補足
  
| 型態      | 預設長度 | length | unsigned |
|:---------:|:--------:|:------:|:-------------:|
| TINYINT[(length)]  | 4        | (-128~127) | (0~255) |
| SMALLINT[(length)]  | 6        | (-32,768~32,767) | (0~65,535) |
| MEDIUMINT[(length)] | 9        | (-8,388,608~8,388,607) | (0~16,777,215) |
| INT[(length)]       | 11       | (-2,147,483,648~2,147,483,647) | (0~4,294,967,295) |
| BIGINT[(length)]    | 20       | (-9,233,372,036,854,775,808~9,223,372,036,854,775,807) | (0~18,446,744,073,709,551,615) |
* 浮點數
  * FLOAT[(length,scale)]
    * 佔４bytes，總長度超過6位數時，會改以科學記號表示
  * DOUBLE[(length,scale)]
    * 佔８bytes，總長度超過15位數時，會改以科學記號表示
  * DECIMAL[(length,scale)]
    * 固定小數位數；length為總長度，整數+小數位數，不含小數點，預設長度為10 ;scale為小數位數，預設長度為0
    * EX:DECIMAL(10,2) ->整數8，小數點２
* 字串
  * CHAR[(n)]
    * 固定長度，預設長度為１，n最大為255個byte，未填滿部分自動補空白字元　
  * VARCHAR[(n)]
    * 變動長度，n最大為65535個byte
    * 儲存空間為字元數+1 byte(n<256)或+2 byte(n>=256)
  * TINYTEXT
    * 變動長度，n最大為255個byte
    * 儲存空間為字元數+1 byte
  * TEXT
    * 變動長度，n最大為65535個byte
    * 儲存空間為字元數+2 byte
  * MEDIUMTEXT
    * 變動長度，n最大為16,777,215個byte
    * 儲存空間為字元數+3 byte
  * LONGTEXT
    * 變動長度，n最大為4,294,967,295個byte
    * 儲存空間為字元數+4 byte
* 日期與時間
  * DATETIME
    * 1000/1/1~9999/12/31，輸入格式為'YYYY-MM-DD hh:mm:ss'
  * TIMESTAMP
    * 1970/1/1~2037/12/31，輸入格式為'YYYY-MM-DD hh:mm:ss'
  * DATE
    * 1000/1/1~9999/12/31，輸入格式為'YYYY-MM-DD'
  * TIME
    * 輸入格式為'hh:mm:ss'
