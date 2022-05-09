# 第 21 章 创建和操纵表

|本期版本| 上期版本
|:---:|:---:
`Thu Dec  9 13:23:56 CST 2021` | -

## 21.1 创建表

### 21.1.6 引擎类型

* `InnoDB`: 可靠的事物处理引擎，它不支持全文本搜索
* `MEMORY`: 功能等同于MyISAM, 但由于数据存储在内存中，速度很快
* `MyISAM`: 性能极高的引擎，它支持全文本搜索，但不支持事物处理


## 21.2 更新表

> 定义外键

```
ADD CONSTRAINT fk_orderitems_orders
FOREIGN KEY (order_num) REFERENCES orders (order_num);
```