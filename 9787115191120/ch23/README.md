# 第 23 章 使用存储过程


|本期版本| 上期版本
|:---:|:---:
`Fri Dec 10 12:41:38 CST 2021` | -

### 23.3.1 执行存储过程

* MySQL 称存储过程的执行为调用，因此MySQL执行存储过程的语句为 CALL

### 23.3.2 创建存储过程

```
DELIMITER //

CREATE PROCEDURE
BEGIN
END //

DELIMITER ;
```

**mysql命令行客户机的分割符**

* `;`: 默认分隔符
* `DELIMITER //`: 临时更改分隔符


### 23.3.4 使用参数

> 变量名都必须以@开始

* `OUT`: 从存储过程中传出
* `IN`: 传递给存储过程
* `INOUT`: 对存储过程传入传出


### 23.3.5 建立智能存储过程


**DECLARE局部变量**

```
DECLARE taxrate INT DEFAULT 6;
```

* 变量名、数据类型、默认值


