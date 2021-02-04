import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'geo_controller.dart';

class GeoPage extends StatefulWidget {
  final String title;
  const GeoPage({Key key, this.title = "Geo"}) : super(key: key);

  @override
  _GeoPageState createState() => _GeoPageState();
}

class _GeoPageState extends ModularState<GeoPage, GeoController> {
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
