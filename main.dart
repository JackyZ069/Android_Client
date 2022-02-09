import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'loading.dart';
import 'app.dart';
import 'package:flutter/rendering.dart';


void main() {
//    debugPaintBaselinesEnabled = true;
//     debugPaintSizeEnabled = true;
  runApp(MaterialApp(
//    debugShowCheckedModeBanner: false,
    title: '家乡门户APP',
    //自定义主题
    theme: mDefaultTheme,
    //添加路由
    routes: <String, WidgetBuilder>{
      "app": (BuildContext context) => App(),
      "company_info": (BuildContext context) =>
          WebviewScaffold(
            url: "https://www.baidu.com",
            appBar: AppBar(
              title: Text('公司介绍'),
              leading: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  //路由到主界面
                  Navigator.of(context).pushReplacementNamed('app');
                },
              ),
            ),
          ),
    },
    //指定加载页面
    home: LoadingPage(),

  ));
}

//自定义主题
final ThemeData mDefaultTheme = ThemeData(
  primaryColor: Colors.blue,
);
