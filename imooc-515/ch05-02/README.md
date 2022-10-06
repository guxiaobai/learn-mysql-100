## 5-2 WHERE查询太慢，怎么办

|本期版本|上期版本
|:---:|:---:
`Thu Oct  6 13:07:42 CST 2022` | -

<img src="./01.png" />

```sql
show create table
insert into xx select * from yy;
```



```
CREATE TABLE `inventory_1` (
  `inventory_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `film_id` smallint unsigned NOT NULL,
  `store_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_id`),
  KEY `idx_fk_film_id` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

```
insert into inventory_1 select * from inventory;
```

**扫描**

```
mysql> explain select store_id, film_id from inventory_1 where store_id = 1;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | inventory_1 | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 4581 |    10.00 | Using where |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------------+
```

**索引**

```
mysql> explain select store_id, film_id from inventory where store_id = 1;
+----+-------------+-----------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys        | key                  | key_len | ref   | rows | filtered | Extra       |
+----+-------------+-----------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | inventory | NULL       | ref  | idx_store_id_film_id | idx_store_id_film_id | 1       | const | 2270 |   100.00 | Using index |
+----+-------------+-----------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)
```



```
mysql> show index from inventory;
+-----------+------------+----------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name             | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+----------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| inventory |          0 | PRIMARY              |            1 | inventory_id | A         |        4581 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| inventory |          1 | idx_fk_film_id       |            1 | film_id      | A         |         958 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| inventory |          1 | idx_store_id_film_id |            1 | store_id     | A         |           2 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| inventory |          1 | idx_store_id_film_id |            2 | film_id      | A         |        1521 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+----------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

**回表**

> `Extra`: `NULL`

```
mysql> explain select inventory_id, store_id, film_id, last_update from inventory where store_id = 1;
+----+-------------+-----------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys        | key                  | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | inventory | NULL       | ref  | idx_store_id_film_id | idx_store_id_film_id | 1       | const | 2270 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+----------------------+----------------------+---------+-------+------+----------+-------+
```