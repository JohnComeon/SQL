# 函数
/*
含义：一组预先编译好的SQL语句的集合，相当于批处理语句

有且仅有一个返回

*/


# 一、创建语法
CREATE FUNCTION 函数名(参数列表) RETURN 返回类型
BEGIN 
	函数体
END


若函数体仅仅只有一句话，BEGIN END 可以省略


# 二、调用语法
SELECT 函数名(参数列表)

