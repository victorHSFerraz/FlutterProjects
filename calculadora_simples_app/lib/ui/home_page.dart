import 'package:calculadora_simples_app/components/display_calculadora.dart';
import 'package:calculadora_simples_app/ui/historico_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora",
          style: TextStyle(fontSize: 18.0),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.auto_stories,
                semanticLabel: "Histórico",
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new HistoricoCalculadora()),
                );
              }),
        ],
        backgroundColor: Colors.grey,
      ),
      body: DisplayCalculadora(),
    );
  }
}
