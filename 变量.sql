#变量
/*
系统变量：
	全局变量
	会话变量
	
自定义变量：
	用户变量
	局部变量


*/

#系统变量
/*
变量由系统提供，不是用户定义，属于服务器层面
语法：
1、查看所有的系统变量
show global|[session] variables;

2、查看所有满足条件的部分系统变量
show global|[session] variables like '%char%';

3、查看指定的某个系统变量的值
select @@global|[session].系统变量名;

4、为某个系统变量赋值
方法一：set global|[session] 系统变量名 = 值;
方法二：set global|[session].系统变量名 = 值;

注意：
若是全局级别，则需要加global，若是会话级别，则需要加session，若不写则默认。
*/

# 全局变量
# 作用域：服务器每次启动将为所有的全局变量赋初始值，对于所有的会话有效，但不能跨重启。
# 查看所有的全局变量
SHOW GLOBAL VARIABLES;


# 3、查看指定的全局变量的值
SELECT @@global.autocommit;

# 会话变量
# 查看所有的会话变量
SHOW SESSION VARIABLES;


#自定义变量
/*
使用步骤：
声明、赋值、使用（查看、比较、运算等）

1、用户变量
赋值的操作符： =或:=
声明并初始化
set @用户变量名=值;
或
set @用户变量名:=值;
或
select @用户变量名:=值; 



2、赋值
方法一：通过set或select
	set @用户变量名=值;
	或
	set @用户变量名:=值;
	或
	select @用户变量名:=值; 

方法二：通过select into
	select 字段 into 变量名
	from 表;

3、使用（查看用户变量的值）
select @用户变量名;


局部变量
作用域：仅仅在定义它的begin、end中有效
应用在 begin end中的第一句话
###声明
declare 变量名 类型;
declare 变量名 类型 default 值;

###赋值
方法一：通过set或select
	set 局部变量名=值;
	或
	set 局部变量名:=值;
	或
	select @局部变量名:=值; 

方法二：通过select into
	select 字段 into 局部变量名
	from 表;

###使用
select 局部变量名;

*/



