# 排序查询

SELECT * FROM employees 
WHERE	department_id >= 90
ORDER BY salary ASC;
/*
语法：
select 查询列表
from 表
where 筛选条件
order by 排序列表 asc|desc  （默认是升序asc）
*/

SELECT *, salary*12*(1+IFNULL(commission_pct, 0)) AS 年薪  # 别名
FROM employees 
ORDER BY salary*12*(1+IFNULL(commission_pct, 0)) ASC;


# 先按工资升序、再按员工编号降序
SELECT * FROM employees
ORDER BY salary ASC, employee_id DESC;
