// _TapboxState类：
// 定义_active: 确定盒子的当前颜色的布尔值
// 定义_handleTap() 函数，该函数在点击该盒子时更新_active,并调用setState()更新UI
// 实现widget的所有交互行为

// TapboxA管理自身状态

import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : "Inactive",
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

//class MyApp extends StatelessWidget {
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Flutter Demo',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Flutter Demo'),
//        ),
//        body: new Center(
//          child: new TapboxA(),
//        ),
//      ),
//    );
//  }
//}
void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: TapboxA(),
  ));
}