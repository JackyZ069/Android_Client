import 'package:flutter/material.dart';
import '../model/news.dart';



class NewsDetailPage extends StatelessWidget{
  final NewsItemModal item;

  NewsDetailPage({Key key,@required this.item}) : super(key:key);


  @override
  Widget build(BuildContext context) {

    Paint pg = Paint();
    pg.color = Color(0xFFCECEF6);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title,
        ),

      ),
      body:  Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(item.content,
          style: TextStyle(

              background: pg,
              fontFamily: 'Georgia',
              fontSize: 15,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w200
          ),),
      ),
    );

  }

}