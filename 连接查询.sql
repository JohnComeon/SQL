# 连接查询
/*
又称多表查询

*/



SELECT * FROM beauty;
SELECT * FROM boys;
SELECT * FROM employees;

# 等值连接
/*
1、多表等值连接的结果为多表的交集部分
2、多表的顺序没有要求
3、n表连接，至少需要n-1个连接条件
4、一般需要为表起别名
5、可以搭配前面介绍的所有子句使用，比如排序、分组、筛选。
*/

# 查询女生名和对应的男生名
SELECT NAME, boyName FROM boys, beauty
WHERE beauty.`boyfriend_id`=boys.`id`;

# 为表起别名
/*
提高语句的简洁度
区分多个重名的字段

注意：如果为表起了别名，则查询的字段就不能使用原来的表名
*/
# 查询员工名，工种号，工种名
SELECT e.last_name, e.job_id, job_title
FROM employees AS e, jobs
WHERE e.`job_id`=jobs.`job_id`;

# 查询有奖金的员工名、部门名
SELECT last_name, department_name,commission_pct
FROM employees e, departments d
WHERE e.`department_id` = d.`department_id`
AND e.`commission_pct` IS NOT NULL;

#加筛选： 查询城市名中第二个字符为o的部门名和城市名
SELECT department_name, city
FROM departments d, locations l
WHERE d.`location_id`=l.`location_id`
AND city LIKE '_o%';

# 查询每个城市的部门个数
SELECT COUNT(*) 个数, city
FROM departments d, locations l
WHERE d.`location_id`=l.`location_id`
GROUP BY city;

# 查询有奖金的每个部门的部门名和部门的领导编号以及该部门的最低工资
SELECT department_name, d.manager_id, MIN(salary)
FROM employees e, departments d
WHERE d.`department_id`=e.`department_id`
AND e.`commission_pct` IS NOT NULL;
GROUP BY department_name;

# 查询每个工种的工种名和员工的个数，并且按员工个数降序
SELECT job_title, COUNT(*)
FROM employees e, jobs j
WHERE e.`job_id`=j.`job_id`
GROUP BY job_title
ORDER BY COUNT(*) DESC;

# 实现三表连接
# 查询员工名，部门名和所在的城市
SELECT last_name, department_name, city
FROM employees e, departments d, locations l
WHERE e.`department_id`=d.`department_id`
AND d.`location_id`=l.`location_id`;



# 非等值连接
# 查询员工的工资和工资级别
SELECT salary, grade_level
FROM employees e, job_grades g
WHERE salary BETWEEN g.`lowest_sal` AND g.`highest_sal`;

/*CREATE TABLE job_grades
(grade_level VARCHAR(3),
 lowest_sal  int,
 highest_sal int);

INSERT INTO job_grades
VALUES ('A', 1000, 2999);

INSERT INTO job_grades
VALUES ('B', 3000, 5999);

INSERT INTO job_grades
VALUES('C', 6000, 9999);

INSERT INTO job_grades
VALUES('D', 10000, 14999);

INSERT INTO job_grades
VALUES('E', 15000, 24999);

INSERT INTO job_grades
VALUES('F', 25000, 40000);*/

 
# 自连接（相当于一个表找了两遍）
# 查询员工名和上级的名称
SELECT e.employee_id, e.last_name, m.`employee_id`, m.`last_name`
FROM employees e, employees m
WHERE e.`manager_id`=m.`employee_id`; 




##########练习题


# 查询每个国家下的部门个数大于2的国家编号
SELECT country_id, COUNT(*) 部门个数
FROM locations l, departments d
WHERE d.`location_id`=l.`location_id`
GROUP BY l.`country_id`
HAVING COUNT(*)>2;     # 大于2相当于是分组后的筛选
