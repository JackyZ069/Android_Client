import 'package:http/http.dart' as http;
import 'dart:convert';
import '../conf/configure.dart';

//给我们留言
contactCompany(String msg) async {

  String url = 'http://' + Config.IP + ':' + Config.PORT + '/?action=contactCompany&msg=$msg';

  var res = await http.get(url);
  String body = res.body;

  var info = body;
  print(info);

  return info;

}