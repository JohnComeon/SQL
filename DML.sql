/*DML语言
数据操作语言：
插入：insert
修改：update
删除：delete


*/

/*
插入语句
语法：
	insert into 表名(列名, ...)
	values(值1,...);
语法二：
	insert into 表名
	set 列名=值, 列名=值,...
*/


#1、插入的值的类型要与列的类型一致或兼容
INSERT INTO beauty(id, NAME, sex, borndate, phone, photo, boyfriend_id)
VALUES(13, 'tyx', '女', '1990-9-23','1554443210',NULL, 2);

#2、不可以为null的列必须插入值，可以为null的列则可以直接写null或不写值及其对应的列

#3、列的顺序可以调换
INSERT INTO beauty(NAME, id, sex)
VALUES('gxt', 18, '女');

INSERT INTO beauty
SET id = 14, NAME='刘涛', phone='911';

# 只有方法1支持插入多行
INSERT INTO beauty
VALUES(15, 'tyxaa', '女', '1990-9-23','1554443210',NULL, 2),
(16, 'tyxasd', '女', '1990-9-23','1554443210',NULL, 2),
(17, 'tyxcc', '女', '1990-9-23','1554443210',NULL, 2);

# 只有方法1支持子查询
INSERT INTO beauty(id, NAME, phone)
SELECT 19, 'sq', '156463425';    # 先执行子查询


#修改语句
/*
1、修改单表的记录
语法：
	update 表名
	set 列=新值, 列=新值, ...
	where 筛选条件;

2、修改多表的记录

sql99语法：
	update 表1 别名
	inner/left/right join 表2 别名
	on 连接条件
	set 列=新值, 列=新值, ...
	where 筛选条件;

*/

#修改单表的记录
# 修改beauty的表中姓tyx的女生的电话为13333335
UPDATE beauty
SET phone='13333335'
WHERE NAME LIKE 'tyx%';


#修改多表的记录
# 修改张无忌的女朋友的手机号为110
UPDATE boys b
INNER JOIN beauty be
ON b.`id`=be.`boyfriend_id`
SET phone='110'
WHERE b.`boyName`='张无忌';

#删除语句
/*
方法一：delete
语法：
delete from 表名
where 筛选条件

多表删除
sql99语法：
delete 表1的别名
from 表1 别名
inner/left/right join 表2 别名 on 连接条件
where 筛选条件;

方法二：
truncate table 表名;   # 注意该方法无法添加where条件



truncate删除没有返回值，delete删除有返回值。

truncate删除不能回滚，delete删除可以回滚。

*/

#删除手机号以9结尾的女生信息
DELETE FROM beauty
WHERE phone LIKE '%9';

# 多表的删除
# 删除张无忌的女朋友的信息
DELETE b
FROM beauty b
INNER JOIN boys bo
ON b.`boyfriend_id`=bo.`id`
WHERE bo.`boyName`='张无忌';



