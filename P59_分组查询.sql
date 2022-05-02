# 分组查询
/*
select 分组函数，列（要求出现在group by的后面）
from 表
group by 分组的列表
 
	    数据源           位置                 关键字
分组前筛选：原始表	     group by子句的前面   where
分组后筛选：分组后的结果集   group by子句的后面   having

	注意： 分组函数做条件肯定是放在having子句中
	能用分组前筛选的优先使用
	group by子句支持单个字段分组，多个字段分组（多个字段之间用逗号隔开，没有顺序要求）
	也可以添加排序，排序放在整个分组查询的最后
*/

SELECT AVG(salary) FROM employees GROUP BY department_id; # 查询每个部门的平均工资

DESC employees;

SELECT MAX(salary), job_id FROM employees GROUP BY job_id;  #查询每个工种的最高工资

SELECT AVG(salary), department_id FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;#查询邮箱中包含a字符的，每个部门的平均工资

# 查询有奖金的每个领导手下员工的最高工资
SELECT MAX(salary),manager_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY manager_id;


######  添加分组后的筛选

# 查询哪个部门的员工个数>2
#①查询每个部门的员工数
SELECT COUNT(*), department_id
FROM employees
GROUP BY department_id;

#②根据①的结果进行筛选，查询哪个部门的员工个数>2

SELECT COUNT(*), department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*)>2;


# 查询每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
# 一、查询每个工种有奖金的最高工资
# 二、最高工资大于12000

SELECT MAX(salary), job_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary)>12000;


## 查询领导编号>102的每个领导手下的最低工资>5000的领导编号是哪个，以及其最低工资
SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id>102
GROUP BY manager_id
HAVING MIN(salary)>5000;


#####按表达式或函数分组
# 按员工姓名的长度分组，查询每一组的员工个数，筛选员工个数>5的有哪些
SELECT COUNT(*), LENGTH(last_name) len_name
FROM employees
GROUP BY LENGTH(last_name)
HAVING COUNT(*)>5;


#按多个字段分组
# 查询每个部门每个工种的员工的平均工资，并且按平均工资的从高到低显示
SELECT AVG(salary), department_id, job_id
FROM employees
GROUP BY department_id, job_id
ORDER BY AVG(salary) DESC;


