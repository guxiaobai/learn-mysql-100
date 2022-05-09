# 第 8 章 字符集

## 8.2 Unicode 简述

**ISO-10646 标注采用 4 字节编码，因此简称 UCS-4**

* 第一个字节代表组(group)，第二个字节代笔面(plane), 第三个字节代表行(row), 第四个字节代表格(ceil)
* 第32位必须为0, 且每个面的最后两个码位保留不用

**Unicode 1.0**

* 将 Unicode 编码并入 ISO-10646 的 0 组 0字面，称之为基本多语言文字面(Basic Multi-Lingual Plane, BMP)
* UCS-2

## 8.5 MySQL 支持的字符集简介


```
show character set;
SHOW COLLATION LIKE 'utf8%';
```

* 字符集: CHARACTER
* 排序规则: COLLATION

排序规则命名

* `_ci`: 大小写不敏感
* `_cs`: 大小写敏感
* `_bin`: 比较字符编码的值

## 8.6 MySQL 字符集的设置

### 8.6.1 服务器字符集和排序规则


* `character-set-server`
* `show variables like 'character_set_server';`
*  `show variables like 'collation_server';`

### 8.6.2 数据库字符集和排序规则


* `show variables like 'character_set_database';`
*  `show variables like 'collation_database';`