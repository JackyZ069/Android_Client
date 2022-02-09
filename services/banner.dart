import 'dart:convert';
import 'package:flutter_website/conf/configure.dart';
import 'package:http/http.dart' as http;

// 从服务器请求 Banner URL
Future<List> getBannerImageUrl() async {
  String url = 'http://' + Config.IP + ':' + Config.PORT + '/?action=BannerImageUrl';

  var res = await http.get(url);
  var body = res.body;
  print(body);
  return jsonDecode(body) as List;

}
