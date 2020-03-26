import 'package:bottom_navigation/page_first.dart';
import 'package:bottom_navigation/page_second.dart';
import 'package:bottom_navigation/page_third.dart';
import 'package:flutter/material.dart';

// 导航页
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 创建集合对象, 存储底部选项集合
  List<BottomNavigationBarItem> barItems = [
    BottomNavigationBarItem(
        // 图标(普通状态)
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        // 图标(选中状态)
        activeIcon: Icon(
          Icons.menu,
          color: Colors.blue,
        ),
        // 文字内容
        title: Text("页面一"),
        // 背景色
        backgroundColor: Colors.blue),
    BottomNavigationBarItem(
        // 图标(普通状态)
        icon: Icon(
          Icons.grade,
          color: Colors.black,
        ),
        // 图标(选中状态)
        activeIcon: Icon(
          Icons.grade,
          color: Colors.blue,
        ),
        // 文字内容
        title: Text("页面二"),
        // 背景色
        backgroundColor: Colors.blue),
    BottomNavigationBarItem(
        // 图标(普通状态)
        icon: Icon(
          Icons.supervised_user_circle,
          color: Colors.black,
        ),
        // 图标(选中状态)
        activeIcon: Icon(
          Icons.supervised_user_circle,
          color: Colors.blue,
        ),
        // 文字内容
        title: Text("页面三"),
        // 背景色
        backgroundColor: Colors.blue),
  ];

  // 导航目标页集合
  final pages = [
    PageFirst(),
    PageSecond(),
    PageThird(),
  ];

  /// 当前选中的导航下标, 默认第一个
  int _currentNavIndex = 0;

  /// pageView控制器
  PageController _pageViewController = PageController();

  // 当点击导航栏按钮时, 触发此函数
  void _changeCurrentNavIndex(int index) {
    // 细节: 当用户点击的导航和当前一致, 则不发生变化, 节省系统资源
    if (index != _currentNavIndex) {
      // 切换导航下标
      _currentNavIndex = index;
      _pageViewController.jumpToPage(index);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        children: pages,
        onPageChanged: (index) => _changeCurrentNavIndex(index),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: barItems,
          // 当前下标
          currentIndex: _currentNavIndex,
          // 点击后进行何种操作, index为当前点击的导航按钮下标
          onTap: (index) {
            _changeCurrentNavIndex(index);
          }),
    );
  }
}
