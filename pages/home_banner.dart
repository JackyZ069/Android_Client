import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_website/model/product.dart';
import 'product_detail_page.dart';
class BannerWidget extends StatelessWidget {

  final ProductListModal list;
  BannerWidget(this.list );

@override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = width * 540.0 / 1080.0;
    return Container(
        width: width,
        height: height,
        //轮播组件
        child: Swiper(
          itemBuilder: (BuildContext context, int i){ProductItemModal item = list.data[i];
            return GestureDetector(
              onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetail(item:item)),);},
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
              );
            },
          //轮播数量
          itemCount: list.data.length,
          //方向
          scrollDirection: Axis.horizontal,
          //是否自动播放
          autoplay: true,
        )
    );
  }

  }