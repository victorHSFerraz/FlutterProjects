import 'package:code_app/app/modules/test/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();

  @override
  String get routeName => '/login';
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                settings: RouteSettings(name: Page2().routeName),
                builder: (_) => Page2())),
        child: Container(
          child: Center(
            child: Text("LOGIN"),
          ),
        ),
      ),
    );
  }
}

mixin NamedRoute implements Widget {
  String get routeName;
}
