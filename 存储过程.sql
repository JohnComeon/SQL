#存储过程和函数
/*
类似于Java中的方法
好处：
1、提高代码的复用性
2、简化操作

*/

/*存储过程
含义：一组预先编译好的SQL语句的集合，相当于批处理语句

*/

##1、创建语法
CREATE PROCEDURE 存储过程名(参数列表)
BEGIN
	存储过程体（一组合法的SQL语句）

END

注意：
1、参数列表包含三部分
参数模式  参数名  参数类型
参数模式： 
IN:该参数可以作为输入，也就是该参数需要调用方传入值
OUT：该参数可以作为输出，也就是该参数可以作为返回值
INOUT：该参数既可以作为输入又可以作为输出

2、若存储过程体仅仅只有一句话，BEGIN END 可以省略
存储过程中的每条SQL语句的结尾要求必须加分号。
存储过程的结尾可以使用DELIMITER 重新设置
语法：
DELIMITER 结束标记
案例：
DELIMITER $


##2、调用语法

CALL 存储过程名（实参列表）;

#一、空参列表
# 向adim中添加五条记录

SELECT * FROM admin

DELIMITER $
CREATE PROCEDURE p()
BEGIN
	INSERT INTO admin(username, `password`)
	VALUES('aa','11'), ('aga','115'), ('aas','114'), ('aaq','113'),('aaa','112')
END $

#调用
CALL p()$

