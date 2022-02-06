import 'package:flutter/material.dart';

import '../app_logic.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  String timeStr = '2022-01-21 08:28:29.000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo'),centerTitle: true),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text('说明：请在手机的"设置"中查找"时区"进行修改，\n刷新页面查看变化',style: TextStyle(color: Colors.grey)),

            SizedBox(height: 50),
            Text('原始(0时区时间):',style: TextStyle(color: Colors.red)),
            Text(timeStr,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),

            SizedBox(height: 40),

            Text('转化成手机本地时间区间后：',style: TextStyle(color: Colors.red)),
            Text('${utcTime()}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.blue)),




          ],
        ),
      ),
    );
  }


  String utcTime(){


    DateTime convertedTime = DateTime.parse(timeStr);

    print('convertedTime====${convertedTime}');
    print('AppLogic().timeZoneOffset====${AppLogic().timeZoneOffset}');

    int index= AppLogic().timeZoneOffset.indexOf(':');
    String hour=  AppLogic().timeZoneOffset.substring(0,index);//相差的消失
    String minutes=  AppLogic().timeZoneOffset.substring(index+1,index+3);//相差的分钟
    print('hour====${hour}');
    print('minutes====${minutes}');

    String convertedTime2= convertedTime.add(new Duration(hours: int.parse(hour),minutes: int.parse(minutes))).toString();//时间加减
    print('转化后的结果是====${convertedTime2}');
    return convertedTime2;
  }


}
