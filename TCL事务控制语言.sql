/*
TCL: transaction control language 事务控制语言

事务：
一个或一组sql语句组成一个执行单元，这个执行单元要么全部执行，要么全部不执行


*/

SHOW ENGINES   # 显示MySQL支持的存储引擎

/*事务的ACID属性
1、原子性（atomic）
	一个事务不可分割，要么全部执行，要么全部不执行
2、一致性（consistent）
	一个事务执行会使数据从一个一致状态切换到另外一个一致状态
3、隔离性（isolation）
	一个事务的执行不受其他事务的干扰
4、持久性（durability）
	一个事务一旦提交，则会永久改变数据库的数据


事务的创建
隐式事务：事务没有明显的开启和结束的标记
比如insert、update、delete语句

显式事务：事务具有明显的开启和结束的标记
前提：必须先设置自动提交功能为禁用
set autocommit=0;

步骤一：开启事务
set autocommit=0;
start transaction;  可选的

步骤二：编写事务中的sql语句（select、insert、update、delete）
语句1;
语句2;
...

步骤三：结束事务
commit;   提交事务
rollback;   回滚事务



*/

/*事务的隔离级别
mysql 支持4种事务隔离级别，默认的是repeatable read

*/
