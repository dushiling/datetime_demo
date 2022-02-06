# datetime_demo
 DateTime类的相关使用。获取手机当前时区、时间偏移量等。

## 运行环境
`提示：null-safe环境`
```
[✓] Flutter (Channel stable, 2.8.1, on macOS 12.0.1 21A559 darwin-x64, locale zh-Hans-CN)
[✓] Android toolchain - develop for Android devices (Android SDK version 31.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 13.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2020.3)

```
## 本项目包括：

- 获取手机时区和偏移量、基本使用（获取当前时间、设置时间、创建UTC时间、解析时间、时间加减、比较时间、计算时间差、时间戳、打印当前时间）


## 代码说明
```
1、获取当前时间
var now = new DateTime.now();
print(now);//2022-02-07 04:12:18.125116

2、设置时间
var d =new DateTime(2022, 2, 7, 18, 37 , 26);
print(d);//2022-02-07 18:37:26.000

3、创建UTC时间
var ds = new DateTime.utc(2019, 10, 10, 9, 30);
print(ds);//2019-10-10 09:30:00.000Z

4、解析时间
var d1 = DateTime.parse('2018-10-10 09:30:36');
print(d1);//2020-10-10 09:30:36.000
var d2 = DateTime.parse('2018-10-10 09:30:30+0800');
print(d2);//2020-10-10 01:30:30.000Z

5、时间加减
var now = new DateTime.now();//2022-02-07 04:17:30.905388
print(now.add(new Duration(minutes: 10)));//加10分钟  2022-02-07 04:27:37.905388
print(now.add(new Duration(minutes: -10)));//减10分钟  2022-02-07 04:07:37.905388

print(now.add(new Duration(hours: 2)));//加2小时 2022-02-07 06:17:37.905388
print(now.add(new Duration(hours: -2)));//减2小时 2022-02-07 02:17:37.905388

6、 比较时间
var d3 = new DateTime(2019, 6, 20);
var d4 = new DateTime(2019, 7, 20);
var d5 = new DateTime(2019, 6, 20);

print(d3.isAfter(d4));//是否在d4之后 false
print(d3.isBefore(d4));//是否在d4之前 true
print(d3.isAtSameMomentAs(d5));//是否相同 true


7、计算时间差
var d6 = new DateTime(2019, 6, 19, 16 , 30);
var d7 = new DateTime(2019, 6, 20, 15, 20);
var difference = d7.difference(d6);
print([difference.inDays, difference.inHours,difference.inMinutes]);//d6与d7相差的天数与小时,分钟


8、时间戳
var now = new DateTime.now();
print(now.millisecondsSinceEpoch);//单位毫秒，13位时间戳  1644178922997
print(now.microsecondsSinceEpoch);//单位微秒，16位时间戳  1644178922997751


9、打印当前时间
var now = new DateTime.now();
// padLeft(int width,String sring)：如果字符串长度小于width，在左边填充sring
String  timeStr="${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
print(timeStr);

10、手机当前的时区
ptint('${DateTime.now().timeZoneName}');//CST

11、手机当前的时区的偏移量
ptint('${DateTime.now().timeZoneOffset}');//8:00:00.000000  缩写为+8.00

```
