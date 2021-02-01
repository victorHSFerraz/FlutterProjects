import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HistoricoCalculadora extends StatefulWidget {
  @override
  _HistoricoCalculadoraState createState() => _HistoricoCalculadoraState();
}

class _HistoricoCalculadoraState extends State<HistoricoCalculadora> {
  Future<List> _getData() async {
    http.Response response;

    response = await http
        .get("https://dev.api.amanet.com.br/v1/Calculadora/listar/117");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: _getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Container(
                    width: 200.0,
                    height: 200.0,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 5.0,
                    ),
                  );
                default:
                  if (snapshot.hasError)
                    return Container(
                      color: Colors.black,
                    );
                  else
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 80.0,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Operação Id: ${snapshot.data[index]["operacao_id"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 15.0),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          "VALOR X: ${snapshot.data[index]["calculadora_x"]}",
                                          style: TextStyle(fontSize: 12.0),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          "VALOR Y: ${snapshot.data[index]["calculadora_y"]}",
                                          style: TextStyle(fontSize: 12.0),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          "RESULTADO: ${snapshot.data[index]["calculadora_resultado"]}",
                                          style: TextStyle(fontSize: 12.0),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    icon: Icon(Icons.all_inbox),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
              }
            },
          ),
        ],
      ),
    );
  }
}
