# 联合查询
/*
union 联合 ：将多条查询语句的结果合并成一个结果
语法：
	查询语句1
	union 
	查询语句2

应用场景：
	要查询的结果来自于多个表，且多个表没有直接的连接关系，但查询的信息一致时
特点：
1、要求多条查询语句的查询列数是一致的
2、要求多条查询语句的查询的每一列的类型和顺序最好一致
3、union关键字默认去重，若使用[union all] 可以包含重复项	
	
*/


# 查询部门编号>90或邮箱包含a的员工信息
SELECT * FROM employees WHERE department_id>90 OR email LIKE '%a%';

#等价于
SELECT * FROM employees WHERE department_id>90 
UNION 
SELECT * FROM employees WHERE email LIKE '%a%';