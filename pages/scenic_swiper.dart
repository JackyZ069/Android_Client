import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_website/model/scenic.dart';
import 'package:flutter_website/services/scenic.dart';
import 'scenic_detail_page.dart';

class ScenicBannerWidget extends StatelessWidget {
  List<dynamic> banners;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width * 540.0 / 1080.0;
    return Container(
      width: width,
      height: height,
      child: FutureBuilder(future:getScenicResult(),builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData){
          banners = snapshot.data;
          //轮播组件
          return Swiper(
            itemBuilder: (BuildContext context, index){
              ScenicItemModal item =ScenicItemModal.fromJson(banners[index]);

              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScenicDetail(item:item)),
                  );
                },
                child: Container(
                  //图片左右外边距
                  margin: EdgeInsets.only(left: 5, right: 5),
                  // 加载网络图片
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      new Container(
                        child: Image.network(
                          item.imageUrl,
                          width: width,
                          height: height,
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
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );

            },
            //轮播数量
            itemCount: banners.length,
            //方向
            scrollDirection: Axis.horizontal,
            //是否自动播放
            autoplay: true,
          );

        }else{
          // 没有数据时显示loading动画
          return RefreshProgressIndicator();

        }


      },),
    );
  }
}



