import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'RobotoMono'),
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MoneyConv",
          style: TextStyle(
              fontSize: 25.0, fontFamily: 'RobotoMono', color: Colors.amber),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: new Tab(
                      icon: new Image.asset(
                        "assets/images/salario.png",
                      ),
                    ),
                    padding: EdgeInsets.all(10.0),
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      "\nCotaçõa Dólar R\$5,39 \n\nCotação Euro R\$6,54",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.topCenter,
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "REAL",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "DÓLAR",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "EURO",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
