import 'package:flutter/cupertino.dart';
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
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return card(context, index);
          }),
    );
  }
}

Widget card(BuildContext context, int index) {
  return Card(
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 80.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "SOMA",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 15.0),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "VALOR X: 5",
                  style: TextStyle(fontSize: 12.0),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "VALOR Y: 10",
                  style: TextStyle(fontSize: 12.0),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "RESULTADO: 15",
                  style: TextStyle(fontSize: 12.0),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 180.0, top: 8.0),
            alignment: Alignment.topRight,
            height: 80,
            child: Text("12:34:22"),
          )
        ],
      ),
    ),
  );
}
