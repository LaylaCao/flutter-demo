import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        "Cao Jiali",
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red[200],
          decorationColor: Colors.white,
          decorationStyle: TextDecorationStyle.wavy,
        ),
      ),

    );
  }
}
