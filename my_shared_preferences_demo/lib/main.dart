import 'package:flutter/material.dart';
import 'package:my_shared_preferences_demo/shared_preferences_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences Demo',
      home: MyHomePage(title: 'SharedPreferences Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 保存的值
  String _savedValue = "加载中..";

  // 当前输入的值
  String _currentInputValue;

  @override
  void initState() {
    super.initState();
    SharedPreferencesUtil.getData<String>("myData").then((value) {
      setState(() {
        _savedValue = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 用于显示数据的Text
            Text(
              _savedValue == null ? "无数据" : _savedValue,
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            // 用于修改数据的输入框
            TextField(
              onChanged: (value) {
                _currentInputValue = value;
              },
              // 仅为美观, 增加输入框的边框
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 用于触发保存数据的按钮
                RaisedButton(
                  child: Text("保存"),
                  onPressed: () {
                    // 当点击按钮时, 调用存储数据的函数
                    SharedPreferencesUtil.saveData<String>(
                        "myData", _currentInputValue);

                    // 同时渲染当前显示的保存的值
                    setState(() {
                      _savedValue = _currentInputValue;
                    });
                  },
                ),
                RaisedButton(
                  child: Text("清空数据"),
                  onPressed: () {
                    // 当点击按钮时, 调用存储数据的函数
                    SharedPreferencesUtil.saveData<String>("myData", null);

                    // 同时渲染当前显示的保存的值
                    setState(() {
                      _savedValue = "无数据";
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
