import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'ios_controller.dart';

class IosPage extends StatefulWidget {
  final String title;
  const IosPage({Key key, this.title = "Ios"}) : super(key: key);

  @override
  _IosPageState createState() => _IosPageState();
}

class _IosPageState extends ModularState<IosPage, IosController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
