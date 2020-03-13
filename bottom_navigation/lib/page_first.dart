import 'package:flutter/material.dart';

class PageFirst extends StatefulWidget {
  PageFirst({Key key}) : super(key: key);
  @override
  _PageFirstState createState() => _PageFirstState();
}

class _PageFirstState extends State<PageFirst> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '页面一',
        ),
      ),
    );
  }
}