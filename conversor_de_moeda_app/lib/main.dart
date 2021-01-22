import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const request =
    "https://api.hgbrasil.com/finance?format=json-cors&key=f45fa8fa";

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'RobotoMono'),
      home: Home(),
    ),
  );
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dolar;
  double euro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CurrencyConv",
          style: TextStyle(
              fontSize: 25.0, fontFamily: 'RobotoMono', color: Colors.amber),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  "Carregando dados...",
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Erro ao carregar dados",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                return SingleChildScrollView(
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
                                "\nCotaçõa Dólar R\$${dolar.toStringAsPrecision(3)} \n\nCotação Euro R\$${euro.toStringAsPrecision(3)}",
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
                          child: buildTextField("REAL", "R\$")),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                          child: buildTextField("DÓLAR", "US\$")),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: buildTextField("EURO", "€"),
                      )
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Widget buildTextField(String label, String prefix) {
  return TextField(
    keyboardType: TextInputType.numberWithOptions(),
    decoration: InputDecoration(
      labelText: label,
      prefixText: prefix,
      border: OutlineInputBorder(),
    ),
  );
}
