import 'package:flutter/material.dart';

class PageSecond extends StatefulWidget {
  PageSecond({Key key}) : super(key: key);
  @override
  _PageSecondState createState() => _PageSecondState();
}

class _PageSecondState extends State<PageSecond> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '页面二',
        ),
      ),
    );
  }
}