#分页查询
/*
应用场景：当要显示的数据，一页显示不全时，需要分页提交sql请求
语法：
	select 查询列表
	form 表
	[join type  join 表2
	on 连接条件
	where 筛选条件
	group by 分组字段
	having 分组后的筛选
	order by 排序的字段]
	limit [offset], size;
	
	offset要显示条目的起始索引（起始索引从0开始）,可省略
	size：要显示的条目个数
	
公式：
    要显示的页数page、每页的条目数size
    limit (page-1)*size, size;
*/


# 查询前五条员工信息
SELECT * FROM employees LIMIT 0,5;

# 查询有奖金的员工信息，并且工资较高的前10名显示出来
SELECT * FROM employees WHERE commission_pct IS NOT NULL
ORDER BY salary DESC LIMIT 10;