# 常见函数

/*
select 函数名() [from 表];

分类：
1、单行函数
	concat、length、ifnull等
2、分组函数


*/
USE employees;

SELECT LENGTH('jhon');   # 获取参数值的字节个数

SELECT CONCAT(last_name, '_', first_name) FROM employees;  # 拼接字符串

SELECT SUBSTR('abcdefg', 5) output; #截取位置5之后的子字符串，注意下标都从1开始

SELECT SUBSTR('abcdefg', 5,2) output; #截取位置5之后，指定长度为2的子字符串

SELECT INSTR('abcdefg', 'cd') output;  #用于返回子串在原串中的起始索引，如果找不到就返回0
 
SELECT TRIM('   jjj  ') AS output;  # 去除首尾的空格
SELECT TRIM('aa' FROM 'aaajjjaa') AS output; #去除首尾的'aa'

SELECT LPAD('john',6,'*') AS output; #用指定字符实现左填充指定长度
SELECT RPAD('john', 8, '+') AS output;  #右填充

SELECT REPLACE('jhonddd', 'on', 'cc') AS output;


###日期函数
SELECT NOW();  # 当前系统日期+时间

SELECT CURDATE(); # 返回当前的日期

SELECT STR_TO_DATE('1997-5-10', '%Y-%c-%d') AS output;

#### 流程控制函数
# if函数

SELECT last_name, commission_pct, IF(commission_pct IS NULL, 'sad!', 'happy') AS mind
FROM employees;

# case
SELECT salary 原始工资, department_id,
CASE department_id
WHEN 30 THEN salary*1.1
WHEN 40 THEN salary*1.2
WHEN 50 THEN salary*1.3
ELSE salary
END AS 新工资
FROM employees;

/*
case 要判断的字段或表达式
when 常量1 then 要显示的值1或语句1
...
else 要显示的值n或语句n;
end

*/


# case函数使用二，类似于多重if
/*
case 
when 条件1 then 要显示的值1或语句1
when 条件2 then 要显示的值2或语句2
...
else 要显示的值n或语句n
end

*/

SELECT salary,
CASE 
WHEN salary>20000 THEN 'A'
WHEN salary>15000 THEN 'B'
WHEN salary>10000 THEN 'C'
ELSE 'D'
END AS 工资级别
FROM employees;



#######分组函数
/*
sum、avg、max、min、count
特点：  sum、avg一般用于处理数值型
	max、min、count可以处理任何类型

	以上分组函数都忽略null值
	一般使用count(*)用于统计行数
    效率上：
	MyISAM存储引擎：count(*)最高
	InnoDB存储引擎：count(*)和count(1)效率>count(字段)

*/

SELECT SUM(salary) FROM employees;

SELECT SUM(commission_pct), AVG(commission_pct) FROM employees;

SELECT COUNT(salary) FROM employees;

SELECT AVG(salary)

#查询员工表中的最大入职时间和最小入职时间的相差天数（difference）
SELECT DATEDIFF(MAX(hiredate), MIN(hiredate)) difference FROM employees;

SELECT COUNT(*) FROM employees WHERE department_id=90;  # 查询部门编号为90的员工个数
