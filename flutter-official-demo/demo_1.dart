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
          new MyAppBar(
            title: new Text(
              'Layla 💕💕💕'
            ),
          ),
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
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
  ));
}
