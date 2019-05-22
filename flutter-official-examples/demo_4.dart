import 'package:flutter/material.dart';

// StatefulWidgets是特殊的widget，
// 它知道如何生成State对象，然后用它来保持状态。

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: Counter(),
  ));
}
// StatefulWidget和State是单独的对象。这两种类型的对象具有不同的生命周期：
// Widget是临时对象，用于构建当前状态下的应用程序，
// 而State对象在多次调用build()之间保持不变，允许它们记住信息(状态)。
class Counter extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _increment method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child: new Text('Increment'),
        ),
        new Text('Count: $_counter')
      ],
    );
  }
}

// 事件流是“向上”传递的，而状态流是“向下”传递的