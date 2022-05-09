# 2-3 MySQL配置

重设密码

```
skip-grant-tables
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
```

## Ref

* [B.3.3.2 How to Reset the Root Password](https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html)
* [6.4.3.2 Password Validation Plugin Options and Variables](https://dev.mysql.com/doc/refman/5.7/en/validate-password-options-variables.html)