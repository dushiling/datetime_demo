import 'dart:async';


class AppLogic {
  factory AppLogic() => _instance;
  AppLogic._internal();
  static final AppLogic _instance = AppLogic._internal();

  //时区偏移量
  String timeZoneOffset='';


  Future<void> initAsync() async {
    //时区偏移量 +8:00 -5：00等
    getTimeZoneOffset();

  }




///获取时区偏移量
void getTimeZoneOffset(){
 String  timeOne= '${DateTime.now().timeZoneOffset}';//8:00:00.000000
  int index= timeOne.indexOf('.');
  String timeTwo=timeOne.substring(0,index-3);
  print('tt2==$timeTwo');//8:00

  timeZoneOffset=timeTwo.contains('-')?timeTwo:'+${timeTwo}';
  print('timeZoneOffset==$timeZoneOffset');
}



}