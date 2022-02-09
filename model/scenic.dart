//产品列表项数据转换
class ScenicItemModal {
  String desc; //景区描述
  String type; //景区类型
  String name; //景区名称
  String imageUrl; //景区图片路径
  String point;

  ScenicItemModal({
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

  factory ScenicItemModal.fromJson(dynamic json) {
    return ScenicItemModal(
      desc: json['desc'],
      type: json['type'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      point: json['point'],
    );
  }
}

//产品列表数据转换
class ScenicListModal {
  List<ScenicItemModal> data;

  ScenicListModal(this.data);

  factory ScenicListModal.fromJson(List json) {
    return ScenicListModal(
        json.map((i) => ScenicItemModal.fromJson((i))).toList());
  }
}
