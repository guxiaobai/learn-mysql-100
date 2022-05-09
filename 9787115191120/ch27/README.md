# 第 27 章 全球化和本地化

|本期版本| 上期版本
|:---:|:---:
`Fri Dec 10 13:16:24 CST 2021` | -

### 27.2 使用字符集和校对顺序

* `SHOW CHARACTER SET`: 字符集列表
* `SHOW COLLATION;`
* `_cs`: 区分大小写
* `_ci`: 不区分大小写

```
DEFAULT CHARACTER SET utf8 COLLATE utf8;
```

* SELECT 使用 COLLATE 指定一个备用的校对顺序
* 字符集转换: `Cast`、`Convert()`
