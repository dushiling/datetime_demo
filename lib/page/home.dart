import 'package:flutter/material.dart';

import 'child/base_use.dart';
import 'child/timezone_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List DateTimeList = ['获取手机当前时区和时间偏移量', '基本使用',];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DateTime Demo'),centerTitle: true),
      body: ListView(
        children: [
          ExpansionTile(
            initiallyExpanded: true,
            title: Text('DateTime'),
            children: DateTimeList.map((e) => ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 20),
              title: Text(e),
              onTap: (){
                int index= DateTimeList.indexOf(e);
                if(index==0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TimeZonePage()));
                }else if(index==1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BaseUsePage()));
                }else if(index==2){

                }else if(index==3){

                }

              },
            )).toList(),
          ),
        ],
      ),
    );
  }
}


