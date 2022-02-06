import 'package:flutter/material.dart';
import 'package:flutter_datetime_demo/page/home.dart';
import 'package:flutter_datetime_demo/page/mine.dart';

import 'app_logic.dart';


class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage>  with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
// TODO: 从后台切换前台，界面可见.
        print('resumed-------');
        //重新获取时间区间间隔
        AppLogic().getTimeZoneOffset();
        break;
      case AppLifecycleState.inactive:
        print('inactive-------');
        break;
      case AppLifecycleState.paused:
// TODO: 界面不可见，后台.
        print('paused-------');
        break;
      case AppLifecycleState.detached:
// TODO: APP结束时调用.
        print('detached-------');
        break;
    }
  }


  List<Widget> pages = <Widget>[
    HomePage(),
    MinePage(),

  ];

   var _pageController = PageController();
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 13,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          _renderNavigationBarItem('tab0_select', 'tab0_unselect', "首页"),
          _renderNavigationBarItem('tab1_select', 'tab1_unselect', "我的"),

        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),

    );
  }


  BottomNavigationBarItem _renderNavigationBarItem(
      String selectStr, String unselectStr, String label) {
    return BottomNavigationBarItem(
        activeIcon: Image.asset('assets/tab/$selectStr.png', width: 25, height: 25),
        icon: Image.asset('assets/tab/$unselectStr.png', width: 25, height: 25),
        label: label,
    );
  }
}

