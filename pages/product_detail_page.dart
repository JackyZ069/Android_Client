import 'package:flutter/material.dart';
import '../model/product.dart';
import '../utils/utils.dart';


class ProductDetail extends StatelessWidget{
  final ProductItemModal item;

  ProductDetail({Key key,@required this.item}) : super(key:key);


  @override
  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            item.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(item.desc),
          ),
        ],
      ),
    );

  }

}*/

  Widget build(BuildContext context) {

    Paint pg = Paint();
    pg.color = Color(0xFFCECEF6);

    //标题部分
    final titleText = Container(
      decoration: new BoxDecoration(
          color: Color(0xFFF8E0E0), // 底色
          borderRadius: new BorderRadius.circular((10.0)), // 圆角度
          boxShadow: [BoxShadow(color: Color(0xFfF6CECE), offset: Offset(5.0, 5.0),blurRadius: 10.0, spreadRadius: 2.0)]
        ),
      padding: EdgeInsets.all(15),
      child: Text(
        item.name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    );

    //说明部分
    final subTitle = Text(
      item.desc,
      textAlign: TextAlign.left,
      style: TextStyle(

        background: pg,
        fontFamily: 'Georgia',
        fontSize: 15,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w200
      ),
    );

    var ratings = new Container(
      decoration: new BoxDecoration(
          border: new Border.all(color: Color(0xFF000000), width: 0.5),//bs
        color: Color(0xFFffffff),
          borderRadius: new BorderRadius.circular((10.0)), // 圆角度
      ),
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Icon(Icons.star, color: Colors.black, size: 15,),
              new Icon(Icons.star, color: Colors.black,size: 15),
              new Icon(Icons.star, color: Colors.black,size: 15),
              new Icon(Icons.star, color: Colors.black,size: 15),
              new Icon(Icons.star, color: Colors.black,size: 15),
            ],
          ),
          new Text(
            '170 Reviews',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 15.0,
              decoration: TextDecoration.underline
            ),
          ),
        ],
      ),
    );

    //定义字体样式
    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 10.0,
      height: 2.0,
    );

    //iconList 变量定义了图标行
    var iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new Column(
              children: [
                new Icon(Icons.kitchen, color: Colors.green[500],size: 20),
                new Text('PREP:'),
                new Text('25 min'),
              ],
            ),
            new Column(
              children: [
                new Icon(Icons.timer, color: Colors.green[500],size: 20),
                new Text('COOK:'),
                new Text('1 hr'),
              ],
            ),
            new Column(
              children: [
                new Icon(Icons.restaurant, color: Colors.green[500],size: 20),
                new Text('FEEDS:'),
                new Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    //图片部分
    final mainImage = Column(
      children:[
        Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(item.imageUrl),
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              '180011103666植泽麒',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
]
    );


    //描述+评论部分
    var leftColumn = new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: new Column(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

//    final mainImage = Image.asset(
//      'assets/demo/pavlova.jpg',
//      fit: BoxFit.cover,
//    );



    //最后在 Scaffold中组装出完整界面
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: ListView(
              children: [
                mainImage,
                new Container(
                  width: 480,
                  child: leftColumn,
                ),

              ],
            ),
          );

  }
}

