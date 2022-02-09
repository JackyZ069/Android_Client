import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage>{
  
  @override
  void initState(){
    super.initState();

    //在加载页面停顿3秒
    Future.delayed(Duration(seconds: 3),(){
      print('家乡门户App启动中...');
      Navigator.of(context).pushReplacementNamed("app");
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Stack(
          children: <Widget>[
            //加载页面背景图
            Image.asset(
              'assets/images/loading.jpeg'
            ),

            Center(
              child: Text(
                '家乡门户',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  decoration: TextDecoration.none
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
  
}