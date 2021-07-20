import 'package:flutter/material.dart';

class Page5 extends StatefulWidget {
  const Page5({Key key}) : super(key: key);

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.popUntil(context, ModalRoute.withName("/login")),
        child: Container(
          child: Center(
            child: Text("HOME"),
          ),
        ),
      ),
    );
  }
}
