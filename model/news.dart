//新闻列表项数据转换
class NewsItemModal {
  String author; //作者
  String title; //标题
  String content; //内容

  NewsItemModal({
    this.author,
    this.title,
    this.content,
  });

  factory NewsItemModal.fromJson(dynamic json) {
    return NewsItemModal(
      author: json['author'],
      title: json['title'],
      content: json['content'],
    );
  }
}

//新闻列表数据转换
class NewsListModal {
  List<NewsItemModal> data;

  NewsListModal(this.data);

  // factory NewsListModal.fromJson(List json) {
  //   return NewsListModal(json.map((i) => NewsItemModal.fromJson(i)).toList());
  // }
  factory NewsListModal.fromJson(List json) {
    return NewsListModal(
        json.map((item) {
          return NewsItemModal.fromJson(item);
        }).toList());
  }
}
