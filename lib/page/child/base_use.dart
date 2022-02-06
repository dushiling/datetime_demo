import 'package:flutter/material.dart';

import '../../app_logic.dart';
class BaseUsePage extends StatefulWidget {
  const BaseUsePage({Key? key}) : super(key: key);

  @override
  _BaseUsePageState createState() => _BaseUsePageState();
}

class _BaseUsePageState extends State<BaseUsePage> {

String currentTimeStr= '${DateTime.now()}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('基本使用'),centerTitle: true),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),

            //1、获取当前时间
            Text('当前时间：',style: TextStyle(color: Colors.red)),
            Text(currentTimeStr,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),

            SizedBox(height: 30),

          TextButton(child: Text('获取当前时间'),onPressed: (){
            var now = new DateTime.now();
            currentTimeStr='${now}';
            print(now);
            setState(() {});
          } ),

            TextButton(child: Text('设置时间'),onPressed: (){
              var d =new DateTime(2022, 2, 7, 18, 37 , 26);
              print(d);
            } ),

            TextButton(child: Text('创建UTC时间'),onPressed: (){
              var ds = new DateTime.utc(2019, 10, 10, 9, 30);
              print(ds);
            } ),

            TextButton(child: Text('解析时间'),onPressed: (){
              var d1 = DateTime.parse('2020-10-10 09:30:36');
              print(d1);
              var d2 = DateTime.parse('2020-10-10 09:30:30+0800');
              print(d2);
            } ),

            TextButton(child: Text('时间加减'),onPressed: (){
              var now = new DateTime.now();
              print(now.add(new Duration(minutes: 10)));//加10分钟
              print(now.add(new Duration(minutes: -10)));//减10分钟

              print(now.add(new Duration(hours: 2)));//加2小时
              print(now.add(new Duration(hours: -2)));//减2小时
            } ),

            TextButton(child: Text('比较时间'),onPressed: (){
              var d3 = new DateTime(2019, 6, 20);
              var d4 = new DateTime(2019, 7, 20);
              var d5 = new DateTime(2019, 6, 20);

              print(d3.isAfter(d4));//是否在d4之后 false
              print(d3.isBefore(d4));//是否在d4之前 true
              print(d3.isAtSameMomentAs(d5));//是否相同 true
            } ),

            TextButton(child: Text('计算时间差'),onPressed: (){
              var d6 = new DateTime(2019, 6, 19, 16 , 30);
              var d7 = new DateTime(2019, 6, 20, 15, 20);
              var difference = d7.difference(d6);
              print([difference.inDays, difference.inHours,difference.inMinutes]);//d6与d7相差的天数与小时,分钟
            } ),

            TextButton(child: Text('时间戳'),onPressed: (){
              var now = new DateTime.now();
              print(now.millisecondsSinceEpoch);//单位毫秒，13位时间戳
              print(now.microsecondsSinceEpoch);//单位微秒，16位时间戳
            } ),

            TextButton(child: Text('打印当前时间'),onPressed: (){
              var now = new DateTime.now();
              // padLeft(int width,String sring)：如果字符串长度小于width，在左边填充sring
            String  timeStr="${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
              print(timeStr);
            } ),

            // TextButton(child: Text('格式化'),onPressed: (){
            //   DateTime date=DateTime(2022, 2, 7);
            //   String dateString = DateFormat('yyyy-MM-dd HH:mm:ss').format(date).toString();
            //
            //   DateTime now = DateTime.now();
            //   String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
            //    print(formattedDate);
            // } ),

          ],
        ),
      ),
    );
  }
}
