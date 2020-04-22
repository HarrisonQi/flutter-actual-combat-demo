import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(EasyLocalization(
    child: MyApp(),
    // 支持的语言
    supportedLocales: [Locale('zh', 'CN'), Locale('en', 'US')],
    // 语言资源包目录
    path: 'resources/langs',
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 国际化: 多语言处理',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Hi, 国际化!'),
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

    /// 修改语言函数
    void showChangeLanguageDialog(){
      showDialog(context: context, builder: (BuildContext context){
        return SimpleDialog(
          title: Text("Language"),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("中文"),
              onPressed: (){
                EasyLocalization.of(context).locale = Locale('zh', 'CN');
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: Text("English"),
              onPressed: (){
                EasyLocalization.of(context).locale = Locale('en', 'US');
                Navigator.pop(context);
              },
            )
          ],
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.language), onPressed: ()=>showChangeLanguageDialog(),)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              tr("title"),
              // 加大字体, 便于演示
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
