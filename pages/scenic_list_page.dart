import 'package:flutter/material.dart';
import '../model/scenic.dart';
import '../services/scenic.dart';
import '../style/index.dart';
import 'scenic_detail_page.dart';

class ScenicResultListWidget extends StatelessWidget {
  //列表数据
  final ScenicListModal list;

  //获取下一页数据
  final VoidCallback getNextPage;

  ScenicResultListWidget(this.list, {this.getNextPage});

  @override
  Widget build(BuildContext context) {
    return list.data.length == 0
        ? Center(
          child: CircularProgressIndicator(),
    )
        : ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        //列表项数
        itemCount: list.data.length,
        //列表项构建
        itemBuilder: (BuildContext context, int i) {
          //列表项数据
          ScenicItemModal item = list.data[i];
          //加载一页
          if ((i + 4) == list.data.length) {
            getNextPage();
          }

          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ScenicDetail(item:item)),
              );

            },
            //列表项背景
            child: Container(
              color: ProductColors.bgColor,
              padding: EdgeInsets.only(
                top: 5.0,
                right: 5.0,
              ),
              child:
              Row(

                children: <Widget>[
                  //产品图片
                  Container(
                    width: 120.0,
                    height: 120.0,
                      child:Stack(
                        alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          new Container(
                            child: Image.network(
                              item.imageUrl,
                              width: 120.0,
                              height: 120.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          new Container(
                            decoration: new BoxDecoration(
                              color: Colors.black45,
                            ),
                            child: new Text(
                              '180011103666植泽麒',
                              style: new TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),

                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color:ProductColors.divideLineColor,
                              )
                          )
                      ),
                      //产品信息垂直布局
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.desc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              //产品类型
                              Text(
                                item.type,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color:ProductColors.typeColor,
                                ),
                              ),
                              //产品特点
                              item.point == null ? SizedBox():Container(
                                child: Text(
                                  item.point,
                                  style: TextStyle(
                                    color:ProductColors.piontColor,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                margin: EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(border: Border.all(width: 1,color: ProductColors.piontColor)),
                              ),
                            ],
                          ),
                          Text(
                            item.name,
                            style: ProductFonts.itemNameStype,
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }
}
