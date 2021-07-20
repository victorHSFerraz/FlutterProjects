import 'package:code_app/app/modules/test/page1.dart';
import 'package:code_app/app/modules/test/page3.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget with NamedRoute {
  const Page2({Key key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();

  @override
  String get routeName => "/create";
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => Page3())),
        child: Container(
          child: Center(
            child: Text("CREATE 1"),
          ),
        ),
      ),
    );
  }
}
