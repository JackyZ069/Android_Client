import 'package:flutter/material.dart';
import 'package:flutter_website/services/images.dart';
import 'about_contact_page.dart';
import 'about_heart.dart';
import 'about_shape.dart';
class AboutUsPage extends StatefulWidget{
  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(future:getCompanyImageUrl(),builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasData){
                return Image.network(
                  snapshot.data,
                  fit: BoxFit.cover,
                );
              }
              return Image.asset(
                'assets/images/company.jpg',
                fit: BoxFit.cover,
              );
            },),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('公司介绍'),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => AboutHeartPage()));
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('公司优势'),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => AboutShapePage()));
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('联系我们'),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => AboutContactPage()));
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

}
