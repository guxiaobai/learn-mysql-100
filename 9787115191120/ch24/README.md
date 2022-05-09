# 第 24 章 使用游标

|本期版本| 上期版本
|:---:|:---:
`Fri Dec 10 12:54:22 CST 2021` | -

### 24.2.1 创建游标

* `DECLARE` 命名游标，并定义相应的SELECT语句

```
DECLARE ordernums CURSOR
FOR
SELECT order_num FROM orders;
```

### 24.2.2 打开和关闭游标

* `OPEN`、`CLOSE`

### 24.2.3 使用游标数据

* 可以使用 `FETCH` 语句分别访问它的每一行

```
DECLARE done BOOLEAN DEFAULT 0;

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' set done = 1;


REPEAT
UNTIL done END REPEAT
```