# 第 6 章 表类型（存储引擎）的选择

## 6.1 MYSQL  存储引擎概述

查看当前的默认存储引擎

```
show variables like 'default_storage_engine';
```

查询当前数据库支持的存储引擎

```
show engines \G;
```

取值|含义
---|---
`DEFAULT` | 支持并启用,并且为默认引擎
`YES` | 支持并启用
`NO` | 不支持
`DISABLED` | 支持，但是数据库启动的时候被禁用

创建新表的时候指定引擎

```
ENGINE=InnoDB
```

## 6.2 各种存储引擎的特性

### 6.2.2 InnoDB

暂时关闭外键的检查

```
SET FOREIGN_KEY_CHECKS=1;
```

**存储方式**

* `innodb_data_home_dir`
* `innodb_data_file_path`
* `innodb_file_per_table`

### 6.2.3 MEMORY

* 默认使用 HASH 索引
* 使用 `--init-file`

```
create index mem_hash USING BTREE on tab_memory
SHOW INDEX FROM tab_memory
```