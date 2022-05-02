/*视图
含义：虚拟表，和普通表一样使用
是通过表动态生成的数据，只保存了sql逻辑，不保存查询结果。
应用场景：
多个地方用到同样的查询结果；
该查询结果使用的sql语句较为复杂；

视图的好处：
1、复用SQL语句
2、简化SQL操作，不必知道它的查询细节
3、保护数据，提高安全性


	  创建语法的关键字   是否实际占用物理空间        使用
视图	    create view	      只是保留了sql逻辑          增删改查，一般不能增删改
表          create table        保留了数据		 增删改查


*/

#一、创建视图
/*
语法：
create view 视图名
as
查询语句;


*/

# 1、查询姓名中包含a字符的员工名、部门名和工种信息
CREATE VIEW v1
AS

SELECT last_name, department_name, job_title
FROM employees e
JOIN departments d ON e.department_id=d.department_id
JOIN jobs j ON e.job_id = j.job_id;

SELECT * FROM v1 WHERE last_name LIKE '%a%';

# 2、查询各个部门的平均工资级别

# 创建视图查看每个部门的平均工资
CREATE VIEW v2
AS
SELECT AVG(salary) ag,department_id
FROM employees 
GROUP BY department_id;

SELECT v2.`ag`, g.grade_level
FROM v2
JOIN job_grades g
ON v2.`ag` BETWEEN g.`lowest_sal` AND g.`highest_sal`;

# 3、查询平均工资最低的部门信息
SELECT * FROM v2 ORDER BY ag LIMIT 1;


# 2、视图的修改
/*
方法一：
create or replace view 视图名
as
查询语句;

方法二：
alter view 视图名
as
查询语句;


*/

# 3、删除视图
/*
语法：drop view 视图名，视图名...；

*/

# 4、查看视图
DESC v2;

SHOW CREATE VIEW v2;

# 一、创建视图v1，要求查询电话号码以'011'开头的员工姓名和工资、邮箱
CREATE VIEW
AS 
SELECT last_name,salary,email
FROM employees e
WHERE phone_number LIKE '011%';

# 二、创建视图v2，要求查询部门的最高工资高于12000的部门信息

CREATE OR REPLACE VIEW v2
AS
SELECT MAX(salary) ma, department_id
FROM employees
GROUP BY department_id
HAVING MAX(salary)>12000;

SELECT d.*, v2.ma
FROM departments d
JOIN v2
ON v2.`department_id`=d.`department_id`;


# 5、视图的更新


###1、插入
INSERT INTO v1 VALUES('jhon','432@qq.com')

###2、修改
UPDATE

###3、删除
DELETE

# 具备以下特点的视图不允许更新
# ①包含如下关键字的sql语句：分组函数、distinct、group by、having、union或union all

# ②常量视图

# ③select中包含子查询

# ④join

# ⑤from一个不能更新的视图

# ⑥where子句中的子查询引用了from子句中的表


