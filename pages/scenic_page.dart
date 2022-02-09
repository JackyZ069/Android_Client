import 'package:flutter/material.dart';
import '../model/scenic.dart';
import '../services/scenic.dart';
import 'scenic_list_page.dart';


class ScenicPage extends StatefulWidget{
  @override
  ScenicPageState createState() => ScenicPageState();
}

class ScenicPageState extends State<ScenicPage>{


  ScenicListModal listData = ScenicListModal([]);

  int page = 0;

  //获取产品列表数据 同时回调使用
  void getScenicList() async {

    var data = await getScenicResult(page++);
    ScenicListModal list = ScenicListModal.fromJson(data);

    setState(() {

      listData.data.addAll(list.data);

    });

  }

  @override
  void initState(){
    getScenicList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScenicResultListWidget(listData,getNextPage: () => getScenicList(),);
  }

}