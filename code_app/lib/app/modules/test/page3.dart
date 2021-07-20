import 'package:code_app/app/modules/test/page4.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({Key key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => Page4())),
        child: Container(
          child: Center(
            child: Text("CREATE 2"),
          ),
        ),
      ),
    );
  }
}
