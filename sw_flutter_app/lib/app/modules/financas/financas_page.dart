import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'financas_controller.dart';

class FinancasPage extends StatefulWidget {
  final String title;
  const FinancasPage({Key key, this.title = "Finanças"}) : super(key: key);

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
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              MdiIcons.reload,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
