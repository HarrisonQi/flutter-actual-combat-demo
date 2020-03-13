import 'package:flutter/material.dart';

class PageThird extends StatefulWidget {
  PageThird({Key key}) : super(key: key);
  @override
  _PageThirdState createState() => _PageThirdState();
}

class _PageThirdState extends State<PageThird> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '页面三',
        ),
      ),
    );
  }
}