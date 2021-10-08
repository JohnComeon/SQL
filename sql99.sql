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
#


