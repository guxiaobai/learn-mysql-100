# 4-5 InnoDB数据表是如何存储的

|本期版本|上期版本
|:---:|:---:
`Thu Oct  6 12:25:04 CST 2022` | -


```
show variables like 'datadir';
show variables like 'innodb_file_per_table';
```



<img src="./01.png" />
<img src="./02.png" />
<img src="./03.png" />
<img src="./04.png" />
<img src="./05.png" />
 

## Ref

* [datadir](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_datadir)
* [innodb\_file\_per\_table](https://dev.mysql.com/doc/refman/8.0/en/innodb-parameters.html#sysvar_innodb_file_per_table)
* [15.6.3.2 File-Per-Table Tablespaces](https://dev.mysql.com/doc/refman/8.0/en/innodb-file-per-table-tablespaces.html)