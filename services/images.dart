
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_website/conf/configure.dart';

// 从服务器请求 Loading 图片
Future<String> getLoadingImageUrl() async{
  String url = 'http://' + Config.IP + ':' + Config.PORT + '/?action=LoadingImageUrl';

  var res = await http.get(url);
  var body = res.body;
  print(body);
  return jsonDecode(body)["imageUrl"];
}
// 从服务器请求图片 URL
Future<String> getCompanyImageUrl() async{
  String url = 'http://' + Config.IP + ':' + Config.PORT + '/?action=CompanyImageUrl';

  var res = await http.get(url);
  var body = res.body;
  print(body);
  return jsonDecode(body)["imageUrl"];
}
