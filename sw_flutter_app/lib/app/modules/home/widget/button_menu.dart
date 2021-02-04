import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonHome extends StatelessWidget {
  final String texto;
  final String rota;

  ButtonHome(this.texto, this.rota);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: ButtonTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        minWidth: 200.0,
        height: 110,
        child: RaisedButton(
          padding: EdgeInsets.all(10.0),
          onPressed: () {
            Modular.to.pushNamed(rota);
          },
          child: Text(
            texto,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
