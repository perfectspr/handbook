# 数据类型


## 类型转换
从环境变量读取配置信息
<!-- tabs:start -->
#### ** Javascript **
```javascript
// string to int
const expireDays = process.env.EXIPRE_DAYS | 0 || 7;
```
#### ** Python **
```python
import os
# string to int
expireDays =  int(os.environ.get('EXPIRE_DAYS', '7'));
```
<!-- tabs:end -->


