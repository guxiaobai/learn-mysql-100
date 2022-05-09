# 03讲事务隔离：为什么你改了我还看不见


|本期版本|上期版本
|:---:|:---:|
`Sun Feb 20 00:09:54 CST 2022` |

* 简单来说，事务就是要保证一组数据库操作，要么全部成功，要么全部失败。在MySQL中，事务支持是在引擎层实现的


## 隔离性与隔离级别

```
show variables like 'transaction_isolation';
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
```



* ACID（Atomicity、Consistency、Isolation、Durability，即原子性、一致性、隔离性、持久性）
* 出现脏读（dirty read）、不可重复读（non-repeatable read）、幻读（phantom read）
* SQL标准的事务隔离级别包括：读未提交（read uncommitted）、读提交（read committed）、可重复读（repeatable read）和串行化（serializable ）

## 事务隔离的实现

## 事务的启动方式

```
begin...commit
```

* 你可以在`information_schema`库的`innodb_trx`这个表中查询长事务




## Ref

* [15.7.2 InnoDB Transaction Model](https://dev.mysql.com/doc/refman/8.0/en/innodb-transaction-model.html)
* [13.3.7 SET TRANSACTION Statement](https://dev.mysql.com/doc/refman/8.0/en/set-transaction.html)
* [MySQL事务隔离级别和实现原理（看这一篇文章就够了！）](https://zhuanlan.zhihu.com/p/117476959)