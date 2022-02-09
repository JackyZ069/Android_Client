import 'package:flutter/material.dart';
import 'home_banner.dart';
import '../services/product.dart';
import '../model/product.dart';
import 'home_product_page.dart';
import 'scenic_swiper.dart';

class HomePage extends StatefulWidget{

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  ProductListModal listData = ProductListModal([]);

  void getProductList() async{
    var data = await getProductResult();
    ProductListModal list = ProductListModal.fromJson(data);
    setState(() {
      listData.data.addAll(list.data);
    });
  }


  @override
  void initState(){
    getProductList();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(listData),
          //ScenicBannerWidget(),
          HomeProductPage(listData),

        ],
      ),
    );
  }

}