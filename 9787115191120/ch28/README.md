# 第 28 章 安全管理


|本期版本| 上期版本
|:---:|:---:
`Fri Dec 10 13:28:37 CST 2021` | -

### 28.2.1 创建用户账号

```
CREATE USER IDENTIFIED BY 'P@$$w0rd';
```

### 28.2.3 设置访问权限


```
SHOW GRANTS FOR user_name;
```

* `GRANT`、`REVOKE`

### 28.2.4 更改口令


```
SET PASSWORD FOR user = PASSWORD('n3w p@$$wOrd')
```