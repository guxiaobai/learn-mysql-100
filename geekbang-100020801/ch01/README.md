# 01讲基础架构：一条SQL查询语句是如何执行的

|本期版本|上期版本
|:---:|:---:|
`Sat Feb 19 23:04:24 CST 2022` |

<img src="./01.png" />




## 连接器

```
show VARIABLES like 'wait_timeout';
show VARIABLES like 'interactive_timeout';
```

* [`show processlist`](https://dev.mysql.com/doc/refman/8.0/en/show-processlist.html)
* [`wait_timeout`](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_wait_timeout) / [`interactive_timeout`](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_interactive_timeout)
* 建立连接的过程通常是比较复杂的，所以我建议你在使用中要尽量减少建立连接的动作，也就是尽量使用长连接。
* [`5.4.60 mysql_reset_connection()`](https://dev.mysql.com/doc/c-api/5.7/en/mysql-reset-connection.html)


## 查询缓存

* 但是大多数情况下我会建议你不要使用查询缓存，为什么呢？因为查询缓存往往弊大于利。
* 查询缓存的失效非常频繁，只要有对一个表的更新，这个表上所有的查询缓存都会被清空
* MySQL 8.0版本直接将查询缓存的整块功能删掉了，也就是说8.0开始彻底没有这个功能了

## 优化器

* 优化器是在表里面有多个索引的时候，决定使用哪个索引；或者在一个语句有多表关联（join）的时候，决定各个表的连接顺序

## 执行器


* 你会在数据库的慢查询日志中看到一个rows_examined的字段，表示这个语句执行过程中扫描了多少行
* **在有些场景下，执行器调用一次，在引擎内部则扫描了多行，因此引擎扫描行数跟rows_examined并不是完全相同的**


## Misc

* Oracle会在分析阶段判断语句是否正确，表是否存在，列是否存在等。猜测MySQL也这样