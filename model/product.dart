//import 'date:convert';
//产品列表项数据转换
class ProductItemModal {
  String desc; //产品描述
  String type; //产品类型
  String name; //产品名称
  String imageUrl; //产品图片路径
  String point;
//构造方法
  ProductItemModal({
    this.desc,
    this.type,
    this.name,
    this.imageUrl,
    this.point,
  });

//  ProductItemModal.fromJson1(dynamic json) {
//    this.desc = json['desc'];
//    this.type = json['type'];
//    this.name = json['name'];
//    this.imageUrl = json['imageUrl'];
//    this.point = json['point'];
//  }


/*原版
  factory ProductItemModal.fromJson(dynamic json) {
    return ProductItemModal(
      desc: json['desc'],
      type: json['type'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      point: json['point'],
    );
  }
}*/


  //JSON解析工厂类，使用字典数据为对象初始化赋值
  factory ProductItemModal.fromJson(Map<String, dynamic> parsedJson){
    return ProductItemModal(
        desc: parsedJson['desc'],
        name : parsedJson['name'],
        type : parsedJson ['type'],
        imageUrl: parsedJson['imageUrl'],
        point: parsedJson['point'],
    );
  }
}

//产品列表数据转换
class ProductListModal {
  List<ProductItemModal> data;

  ProductListModal(this.data);

  factory ProductListModal.fromJson(List json) {
    return ProductListModal(
        json.map((i) => ProductItemModal.fromJson(i)).toList());
  }

}