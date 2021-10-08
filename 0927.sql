SELECT last_name FROM employees;

SELECT DISTINCT department_id FROM employees; # 去重

SELECT CONCAT('a', 'b') AS 结果
 
DESC departments;  # 显示表的结构

#模糊查询
/*
like：一般和通配符搭配使用
通配符：
1、% 任意多个字符
2、_ 任意单个字符

between and
in：in列表中的值类型必须一致或兼容

is null / is not null

*/

SELECT 
	*
FROM
	employees
WHERE
	last_name LIKE '%a%';   # 查询员工名中包含字符a的员工信息
	

SELECT 
	*
FROM
	employees
WHERE 
	last_name LIKE '__n_l%'; # 查询员工名中第三个字符为n，第五个字符为l的员工



WHERE
	last_name LIKE '_\_%';   # 第二个字符时_的员工 

WHERE 
	employee_id BETWEEN 100 AND 120;   # 查询员工编号在100到120之间的员工信息



WHERE job_id IN ('IT_PROG', 'AD_VP');
# 查询员工的工种编号是 IT_PROG、AD_VP中的

SELECT DISTINCT job_id FROM employees;  # 去重


SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NULL;  # 查询没有奖金的员工名和奖金率


# 安全等于 <=>
# 查询没有奖金的员工名字和奖金率
SELECT 
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct <=>NULL;
	

# 查询工资为12000的员工名和工资
SELECT 
	last_name,
	salary
FROM
	employees	
WHERE 
	salary <=>12000;


SELECT
	last_name,
	salary
FROM
	employees
WHERE
	salary<18000 AND commission_pct IS NULL;   # 查询没有奖金，且工资小于18000的员工


SELECT
	* 
FROM
	employees
WHERE	
	job_id <> 'IT' OR salary = 12000;


