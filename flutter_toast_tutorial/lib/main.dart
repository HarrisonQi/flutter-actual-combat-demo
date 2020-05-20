import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '阿航的技术小站 Flutter toast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter toast实战'),
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
            RaisedButton(
              child: Text("弹出toast"),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "你今天真好看",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  fontSize: 16.0,
                  webShowClose: true,
                  webBgColor: "#00b09b",
                  webPosition: "center",
                );
              },
            ),
            RaisedButton(
              child: Text("隐藏toast"),
              onPressed: () => Fluttertoast.cancel(),
            )
          ],
        ),
      ),
    );
  }
}
