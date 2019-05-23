// 父widget管理widget的state

// 在以下示例中，TapboxB通过回调将其状态导出到其父项。
// 由于TapboxB不管理任何状态，因此它的父类为StatelessWidget。

import 'package:flutter/material.dart';

// ParentWidget类：
// 实现_handleTapboxChanged(), 当盒子被点击时调用的方法
// 当状态改变时，调用setState() 更新UI

class ParentWidget extends StatefulWidget {
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active : false, @required this.onChanged}) : super(key : key);

  final bool  active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'Cao Jiali',
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('Cao Jiali'),
      ),
      body: new Center(
        child: new ParentWidget(),
      ),
    ),
  ));
}