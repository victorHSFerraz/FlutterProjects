import 'package:flutter/material.dart';

class HistoricoCalculadora extends StatefulWidget {
  @override
  _HistoricoCalculadoraState createState() => _HistoricoCalculadoraState();
}

class _HistoricoCalculadoraState extends State<HistoricoCalculadora> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(),
    );
  }
}
