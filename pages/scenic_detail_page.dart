import 'package:flutter/material.dart';
import '../model/scenic.dart';
import '../utils/utils.dart';

class ScenicDetail extends StatelessWidget{
  final ScenicItemModal item;

  ScenicDetail({Key key,@required this.item}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    /*
    第二步: 实现标题行
    首先，你可以构建标题部分左侧列。添加如下代码到 MyApp 类的 build() 方法内顶部。
    */
    Widget titleSection = Container(
      decoration: new BoxDecoration(
          color: Color(0xFFCEE3F6), // 底色
          borderRadius: new BorderRadius.circular((10.0)), // 圆角度
          //boxShadow: [BoxShadow(color: Color(0xFfCEE3F6), offset: Offset(5.0, 5.0),blurRadius: 10.0, spreadRadius: 2.0)]
      ),
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            //1
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //2
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    item.name,//星湖
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  item.type,//肇庆 中国
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          //3
          Icon(
            Icons.star,
            color: Colors.yellow[500],
          ),
          Text('205'),
        ],
      ),
    );

    /*
     1. 将 Column 元素放到 Expanded widget 中可以拉伸该列，以利用该行中所有剩余的闲置空间。设置 crossAxisAlignment 属性值为
        CrossAxisAlignment.start，这会将该列放置在行的起始位置。
     2. 将第一行文本放入 Container 容器中使得你可以增加内间距。列中的第二个子元素，同样为文本，显示为灰色。
     3. 标题行中的最后两项是一个红色星形图标，和文字”41”。整行都在一个 Container 容器布局中，而且每条边都有 32 像素的内间距。
      */


    /*
    第三步: 实现按钮行
    按钮区域包含三列使用相同布局－一行文本上面一个图标。此行的各列被等间隙放置，文本和图标被着以初始色。
    由于构建每列的代码基本相同，因此可以创建一个名为 buildButtonColumn() 的私有辅助函数，以颜色、图标和文本为入参，
    返回一个以指定颜色绘制自身 widgets 的一个 column 列对象。
    这个函数直接将图标添加到这列里。文本在以一个仅有上间距的 Container 容器中，使得文本与图标分隔开。
    */
    //构建按钮组中单个按钮 参数为图标及文本
    Widget _buildButtonColumn(Color color, IconData icon, String label) {
      //垂直布局
      return Column(
        children: [
          //上面图标部分
          Icon(icon, color: color),
          Container(

            //距离上面图标一定间距
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    /*
    通过调用函数并传递针对某列的颜色，Icon 图标和文本，来构建包含这些列的行。然后在行的主轴方向通过使用 MainAxisAlignment.spaceEvenly ，
    将剩余的空间均分到每列各自的前后及中间。
     */
    //按钮组部分
    Widget buttonSection = Container(

      padding: EdgeInsets.all(15),
      //水平布局
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,       //水平方向均匀排列每个元素
        children: [
          _buildButtonColumn(
              Theme.of(context).primaryColor, Icons.call, 'CALL'),
          _buildButtonColumn(
              Theme.of(context).primaryColor, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(
              Theme.of(context).primaryColor, Icons.share, 'SHARE'),
        ],
      ),
    );


    /*
    第四步: 实现文本区域
    将文本区域定义为一个变量。将文本放置到一个 Container 容器中，然后为每条边添加内边距。
    通过设置 softwrap 为 true，文本将在填充满列宽后在单词边界处自动换行。
    */
    //风景区介绍文本部分
    Widget textSection = Container(
      //设置上下左右内边距
      padding: const EdgeInsets.all(15),
      //文本块一定是用'''来引用起来
      child: Text(
        '景区详情:\n'
        +item.desc,
        style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w200
        ),
        softWrap: true,
      ),
    );

    Widget nameSection = Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.network(item.imageUrl),
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            '180011103666植泽麒',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );

    /*Widget routeSection = Container(
      padding: const EdgeInsets.all(5),
      child: RaisedButton(
        onPressed:(){
          Navigator.pushNamed(context, '/second');
        },
        child: Text(
          '美食',
          style: TextStyle(fontSize: 10.0),),

      ),
    );*/

    /*
    第五步: 实现图片区域
    四个列元素中的三个已经完成了，只剩下图片部分了。如下添加图片文件到示例工程中：
    在工程的顶部创建一个 images 目录。
    添加 lake.jpg。
     */

    /*
    第六步: 最终的收尾
     在最后的步骤中，需要在一个 ListView 中排列好所有的元素，而不是在一个 Column 中，因为当 app 运行在某个小设备上时，
     ListView 支持 app body 的滚动。
     */

    return Scaffold(
      appBar: AppBar(
        //页面标题
        title: Text(item.name),
      ),
      //使用列表视图默认为垂直布局,并且子元素能够上下滚动
      body: ListView(
        children: [
          //第五步: 实现图片区域  风景图片
          /*Image.asset(
            'demo/7code1.jpg',//assets/demo/7code1.jpg
            height: 240,
            fit: BoxFit.cover,  //图片填充整个父容器
          ),*/

          nameSection,
          titleSection,
          buttonSection,
          textSection,
          //routeSection,
        ],
      ),
    );
  }
}