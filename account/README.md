# Account

|本期版本| 上期版本
|:---:|:---:
`Mon May  9 14:58:44 CST 2022` | -

[`default_authentication_plugin`](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_default_authentication_plugin)

```bash
echo 'default_authentication_plugin= mysql_native_password' | sudo tee -a /etc/mysql/mysql.conf.d/mysqld.cnf
```

[13.7.1.1 ALTER USER Statement](https://dev.mysql.com/doc/refman/8.0/en/alter-user.html)

```bash
sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by '';"
```

[13.7.1.7 RENAME USER Statement](https://dev.mysql.com/doc/refman/8.0/en/rename-user.html)

```bash
sudo mysql -u root -e "RENAME USER 'root'@'localhost' TO 'root'@'%';"
```

[`bind_address`](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_bind_address)

```bash
sudo sed -i -r 's/(^bind-address\s+).*/\1= 0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql.service
```

* [B.3.3.2 How to Reset the Root Password](https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html)
* [--skip-grant-tables](https://dev.mysql.com/doc/refman/8.0/en/server-options.html#option_mysqld_skip-grant-tables)
* [6.4.3.2 Password Validation Plugin Options and Variables](https://dev.mysql.com/doc/refman/5.7/en/validate-password-options-variables.html)

```bash
echo 'skip-grant-tables' | sudo tee -a /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql.service
```