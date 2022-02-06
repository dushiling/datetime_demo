import 'package:flutter/material.dart';
import 'package:flutter_datetime_demo/app_logic.dart';
class TimeZonePage extends StatefulWidget {
  const TimeZonePage({Key? key}) : super(key: key);

  @override
  _TimeZonePageState createState() => _TimeZonePageState();
}

class _TimeZonePageState extends State<TimeZonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DateTime Demo'),centerTitle: true),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text('说明：请在手机的"设置"中查找"时区"进行修改，\n查看变化',style: TextStyle(color: Colors.grey)),
            SizedBox(height: 50),


            Text('时区简称:',style: TextStyle(color: Colors.red)),
            Text('${DateTime.now().timeZoneName}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),

            SizedBox(height: 30),

            Text('时间偏移量：',style: TextStyle(color: Colors.red)),
            Text('${DateTime.now().timeZoneOffset}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
            Text('缩写：${AppLogic().timeZoneOffset}',style: TextStyle(color: Colors.grey)),


          ],
        ),
      ),
    );
  }
}
