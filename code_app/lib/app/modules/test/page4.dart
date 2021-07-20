import 'package:code_app/app/modules/test/page5.dart';
import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  const Page4({Key key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => Page5())),
        child: Container(
          child: Center(
            child: Text("AUTH"),
          ),
        ),
      ),
    );
  }
}
