import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'financas_controller.dart';

class FinancasPage extends StatefulWidget {
  final String title;
  const FinancasPage({Key key, this.title = "Financas"}) : super(key: key);

  @override
  _FinancasPageState createState() => _FinancasPageState();
}

class _FinancasPageState
    extends ModularState<FinancasPage, FinancasController> {
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
