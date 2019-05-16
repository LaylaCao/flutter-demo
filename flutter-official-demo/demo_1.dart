import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为final
  final Widget  title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 68.0, // 单位是逻辑上的像素，并非真实像素。
      padding: const EdgeInsets.only(top: 25.0), // 不受TextDirection的影响
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局(linear layout）
      child: new Row(
        // 列表项的类型是<Widget>
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null // null会禁用button
          ),
          // Expanded expands its child to fill the available space.
          // 中间的title widget被标记为Expanded,
          // 这意味着它会填充尚未被其他子项占用的的剩余可用空间。
          // Expanded可以拥有多个children, 然后使用flex参数来确定他们占用剩余空间的比例。
          new Expanded(
              child: title
          ),
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material是UI呈现的"一张纸"
    return new Material(
      // Column 是垂直方向的线性布局
      child: new Column(
        children: <Widget>[
          // 在Column的顶部，放置了一个MyAppBar实例，
          // 将一个Text widget作为其标题传递给应用程序栏。
          new MyAppBar(
            title: new Text(
              'Layla 💕💕💕'
            ),
          ),
          // MyScaffold使用了一个Expanded来填充剩余的空间，正中间包含一条message。
          new Expanded(
              child: new Center(
                  child: new Text('你好哇 曹佳丽！'),
              ),
          ),
        ],
      ),
    );
  }
}

void main() {
  // 为了继承主题数据，widget需要位于MaterialApp内才能正常显示，
  // 因此我们使用MaterialApp来运行该应用。
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
  ));
}
