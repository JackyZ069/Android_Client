import 'package:flutter/material.dart';
import '../model/news.dart';
import '../services/news.dart';
import 'news_detail_page.dart';

//新闻页面
class NewsPage extends StatefulWidget {
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  NewsListModal listData = NewsListModal([]);

  //获取新闻列表数据
  void getNewsList() async {
    var data = await getNewsResult();
    NewsListModal list = NewsListModal.fromJson(data);

    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //带分隔线的List
      body: ListView.separated(
        //排列方向 垂直和水平
        scrollDirection: Axis.vertical,
        //分隔线构建器
        separatorBuilder: (BuildContext contex, int index) => Divider(
              height: 1.0,
              color: Colors.grey,
            ),
        itemCount: listData.data.length,
        //列表项构建器
        itemBuilder: (BuildContext contex, int index) {

          //新闻列表项数据
          NewsItemModal item = listData.data[index];

          return ListTile(
            title: Text(item.title,
              style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.underline
              ),
            ),
            subtitle: Text(item.content,overflow: TextOverflow.ellipsis),
            leading: Icon(Icons.fiber_new),
            trailing: Icon(Icons.arrow_forward),
            contentPadding: EdgeInsets.all(10.0),
            enabled: true,
            //跳转至新闻详情页面
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetailPage(item: item)),
              );
            },
          );
        },
      ),
    );
  }
}
