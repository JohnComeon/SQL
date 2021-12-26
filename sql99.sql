# 二、sql99语法
/*
语法：
	select 查询列表
	from 表1 别名 【连接类型】
	join 表2 别名 
	on 连接条件
	【where 筛选条件】
	【group by 分组】
	【having 筛选条件】
	【order by 排序列表】


内连接：inner
外连接：
	左外：left outer
	右外：right outer
	全外：full outer
交叉连接：cross

*/


# 内连接
/*
语法：
select 查询列表
from 表1 别名
inner join 表2 别名
on 连接条件；

分类：
    等值连接
    非等值
    自连接

inner可以省略
筛选条件放在where后面，连接条件放在on后面，提高了分离性，便于阅读。
inner join连接和sql92语法中的等值连接效果是一样的，都是查询多表的交集。

*/

################一、等值连接###############
# 查询员工名、部门名 
SELECT last_name, department_name
FROM employees e
INNER JOIN departments d
ON e.`department_id`=d.`department_id`;


# 查询名字中包含e的员工名和工种名
SELECT last_name, job_title
FROM employees e
INNER JOIN jobs j
ON e.`job_id`=j.`job_id`
WHERE last_name LIKE '%e%';

# 查询部门个数>3的城市名和部门个数
# 先查询每个城市的部门个数，再去筛选满足条件的
SELECT city, COUNT(*) 部门个数
FROM locations l
INNER JOIN departments d
ON l.`location_id`=d.`location_id`
GROUP BY city
HAVING 部门个数>3;
   
# 查询哪个部门的部门员工个数>3的部门名和员工个数，并按个数降序
SELECT department_name, COUNT(*) 员工个数
FROM departments d
INNER JOIN employees e
ON d.`department_id`=e.`department_id`
GROUP BY department_name
HAVING 员工个数>3
ORDER BY 员工个数 DESC;

# 查询员工名、部门名、工种名，并按部门名降序 （多表连接）
SELECT last_name, department_name, job_title
FROM employees e
INNER JOIN departments d ON e.`department_id`=d.`department_id`
INNER JOIN jobs j ON e.`job_id`=j.`job_id`
ORDER BY department_name DESC;

################等值连接###############



################二、非等值连接###############

#查询员工的工资级别
SELECT salary,grade_level
FROM job_grades g
INNER JOIN employees e
ON e.`salary` BETWEEN g.`lowest_sal` AND g.`highest_sal`;


#查询工资级别>20的个数，并且按工资级别降序
SELECT COUNT(*),grade_level
FROM job_grades g
INNER JOIN employees e
ON e.`salary` BETWEEN g.`lowest_sal` AND g.`highest_sal`
GROUP BY grade_level
HAVING COUNT(*)>20
ORDER BY grade_level DESC;

################非等值连接###############


##################自连接###################
#查询员工的名字、上级的名字
SELECT e.last_name, m.last_name
FROM employees e
INNER JOIN employees m 
ON e.`manager_id`=m.`employee_id`;

#查询姓名中包含字符k的员工的名字、上级的名字
SELECT e.last_name, m.last_name
FROM employees e
INNER JOIN employees m 
ON e.`manager_id`=m.`employee_id`
WHERE e.`last_name` LIKE '%k%';

##################自连接###################


####################外连接##################
#应用场景：用于查询一个表中有，另一个表没有的记录
特点：
1、外连接的查询结果为主表中的所有记录
	若从表中有和它匹配的，则显示匹配的值，否则显示NULL
	外连接查询结果 = 内连接结果+主表中有而从表中没有的记录
2、左外连接：LEFT左边的是主表
   右外连接：RIGHT右边的是主表
3、左外和右外交换两个表的顺序，可以实现同样的效果

# 全外连接 = 内连接的结果+表1中有但表2没有的+表2中有但表1没有的 （内连接+左外+右外）

SELECT * FROM beauty;
SELECT * FROM boy;

#查询男朋友不在男生表中的女生名
SELECT b.name, bo.*
FROM beauty b
LEFT OUTER JOIN boys bo
ON b.`boyfriend_id`=bo.`id`
WHERE bo.`id` IS NULL;

# 查询哪个部门没有员工
#左外
SELECT d.*, e.employee_id
FROM departments d
LEFT OUTER JOIN employees e
ON d.`department_id` = e.`department_id`
WHERE e.`employee_id` IS NULL;


####################外连接##################


####################交叉连接##################
SELECT b.*, bo.*
FROM beauty b
CROSS JOIN boys bo;

####################交叉连接##################


# 查询哪个城市没有部门
SELECT city
FROM departments d
RIGHT OUTER JOIN locations l
ON d.`location_id` = l.`location_id`
WHERE d.`location_id` IS NULL;

# 查询部门名为SAL或IT的员工信息
SELECT e.*,d.`department_name`
FROM departments d
LEFT JOIN employees e
ON d.`department_id`= e.`department_id`
WHERE d.`department_name` IN ('SAL', 'IT')



