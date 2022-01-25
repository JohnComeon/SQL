DDL语言
/*
数据定义语言

库和表的管理
1、库的管理
创建、修改、删除

2、表的管理
创建、修改、删除

创建：create
修改：alter
删除：drop

*/


#库的创建
/*
语法：
	create database 库名;
*/

CREATE DATABASE IF NOT EXISTS books;

#库的修改
ALTER DATABASE books CHARACTER SET gbk;

# 库的删除
DROP DATABASE IF EXISTS books;


####表的创建
/*
create table 表名(
	列名 列的类型[（长度） 约束],
	列名 列的类型[（长度） 约束],
	...
	列名 列的类型[（长度） 约束]
)

*/


# 创建表book
CREATE TABLE book(
	id INT,
	bname VARCHAR(20),
	price DOUBLE,
	authorid INT,
	publishDate DATETIME
);

DESC book;

CREATE TABLE author(
	id INT,
	au_name VARCHAR(20),
	nation VARCHAR(10)
)

DESC author;

#表的修改
#修改列名、修改列的类型或约束、添加新列、删除列、修改表名
# alter table 表名 add\drop\modify\change column 列名 【列类型 约束】;

ALTER TABLE book CHANGE COLUMN publishDate pubDate DATETIME;

ALTER TABLE book MODIFY COLUMN pubDate TIMESTAMP;

ALTER TABLE author ADD COLUMN annual DOUBLE;

ALTER TABLE author DROP COLUMN annual;

ALTER TABLE author RENAME TO b_author;

DESC b_author;

#表的删除
DROP TABLE b_author;

###表的复制

INSERT INTO b_author VALUES
(1, 'aaa','cc'),
(2, 'sss','dd'),
(3, 'aaas','cc'),
(4,'asda','cc');


1、仅仅复制表的结构
CREATE TABLE copy LIKE b_author;

2、复制表的结构+数据
CREATE TABLE copy2 SELECT * FROM b_author;

3、只复制部分数据

CREATE TABLE copy3 SELECT id,au_name FROM b_author
WHERE nation='dd';

4、仅复制某些字段
CREATE TABLE copy4
SELECT id,au_name
FROM b_author
WHERE 0;   # 非

####################数据类型
/*
整型：
	tinyint，int...
默认是有符号，若要设置无符号，则加入unsigned关键字


小数：
	浮点型：float(M, D)、double(M, D)
	定点型：dec(M, D)/decimal(M, D)，最大取值范围与double相同，但精度更高，由M和D决定
M:整数部分和小数部分之和
D:小数部分
注意：decimal中默认M=10，D=0	
	
字符型：
	较短的文本：char, varchar
	char(M)：M是最大的字符数， 固定长度的字符
	varchar(M):  可变长度的字符

	其他：binary和varbinary 保存较短的二进制
	      enum用于保存枚举
	      set用于保存集合
	      
	较长的文本：text, blob（用于保存较大的二进制）

日期型：
	datetime  保存日期+时间 不受时区影响

	timestamp  保存日期+时间 受时区影响                                             
	

*/

CREATE TABLE tab_date(
	t1 DATETIME,
	t2 TIMESTAMP
);

INSERT INTO tab_date VALUES(NOW(), NOW());

SHOW VARIABLES LIKE 'time_zone';   # 显示时区这个变量

SET time_zone = '+9:00';



#######常见约束
#含义：用于限制表中的数据，为了保证表中的数据的准确和可靠性。
# 分类：六大约束
	NOT NULL: 非空，用于保证该字段的值非空。比如姓名、学号
	DEFAULT：默认，用于保证该字段有默认值
	PRIMARY KEY：主键，用于保证该字段的值具有唯一性，并且非空  比如学号
	UNIQUE：唯一，用于保证该字段的值具有唯一性，可以为空， 比如座位号
	CHECK：检查约束（MySQL中不支持）
	FOREIGN KEY：外键，用于限制两个表的关系，用于保证该字段的值必须要来自于主表的关联列的值
	在从表添加外键约束，用于引用主表中某列的值。比如学生表的专业编号，员工表的部门编号

添加约束的时机：
	1、创建表时
	2、修改表时
	
约束的添加分类：	
	列级约束：六大约束语法上都支持，但外键约束没有效果；不可以起约束名
	表级约束：除了非空、默认，其他的都支持；可以起约束名，但对主键没效果
	
/*
主键与唯一的对比：
		保证唯一性      是否允许为空  一个表中可以有多少个   是否允许组合
	主键       √                ×			至多1个	     允许但不推荐	
	唯一       √                √			可以多个     允许但不推荐

外键：
	1、要求在从表中设置外键关系
	2、要求从表的外键列的类型与主表的关联列的类型要求一致或兼容，名称无要求
	3、主表的关联列必须是一个key（一般是主键、唯一）
	4、插入数据时，先插入主表，再插入从表，删除时则相反。

*/	
	
##一、创建表时添加约束
###1、添加列级约束
/*
语法：
直接在字段名和类型后面追加 约束类型即可。
只支持： 默认、非空、主键、唯一

*/
CREATE DATABASE students;
USE students;
	
CREATE TABLE stuinfo(
	id INT PRIMARY KEY,   # 主键
	stuName VARCHAR(20) NOT NULL,
	gender CHAR(1),
	seat INT UNIQUE,   # 唯一约束
	age INT DEFAULT 18,  # 默认约束
	majorId INT REFERENCES major(id)   # 外键
)


CREATE TABLE major(
	id INT PRIMARY KEY,
	majorName VARCHAR(20)
)

DESC stuinfo;

SHOW INDEX FROM stuinfo;   # 查看stuinfo表中的所有索引，包括主键、外键、唯一。

###2、添加表级约束
/*
语法：
在各个字段的最下面
[constraint 约束名] 约束类型（字段名）
默认和非空不支持，其他都支持
*/
DROP TABLE IF EXISTS stuinfo;
CREATE TABLE stuinfo(
	id INT,
	stuname VARCHAR(20) ,
	gender CHAR(1),
	seat INT,
	age INT,
	majorid INT,
	
	CONSTRAINT pk PRIMARY KEY(id),   #主键
	CONSTRAINT uq UNIQUE(seat)   # 唯一键

);


##二、修改表时添加约束
/*
语法：
1、添加列级约束
alter table 表名 modify column 字段名 字段类型 新约束；

2、添加表级约束
alter table 表名 add [constraint 约束名] 约束类型(字段名) [外键的引用]；


*/


##三、修改表时删除约束



################标识列
/*
又称为自增长列
含义：可以不用手动插入值，系统提供默认的序列值
特点：
1、标识列要求搭配的是一个key
2、一个表最多有一个标识列
3、标识列的类型只能是数值型
4、标识列可以通过： set auto_increment=3;来设置步长
*/

#一、创建表时设置标识列
CREATE TABLE tab(
	id INT PRIMARY KEY AUTO_INCREMENT,   # 自动增加id
	NAME VARCHAR(20)
	
);

INSERT INTO tab VALUES(NULL, 'jhon');
SELECT * FROM tab;

#二、修改表时设置标识列
ALTER TABLE tab MODIFY COLUMN id INT PRIMARY KEY AUTO_INCREMENT;


#三、修改表时删除标识列
ALTER TABLE tab MODIFY COLUMN id INT;
