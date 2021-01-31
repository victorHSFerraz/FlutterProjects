import 'package:calculadora_simples_app/model/request_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DisplayCalculadora extends StatefulWidget {
  @override
  _DisplayCalculadoraState createState() => _DisplayCalculadoraState();
}

class _DisplayCalculadoraState extends State<DisplayCalculadora> {
  RequestModel _request;
  int userId = 117;
  String display = "0";
  String numX = "";
  String numY = "";
  List<String> displayNum = [];
  int position = 1;
  int operacao = 0;
  double resultado = 0;
  final numericRegex = RegExp(r'^[0-9]+$');

  Widget buttonPad(String valor) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 5.0,
      ),
      child: RawMaterialButton(
        fillColor: Colors.grey,
        onPressed: () async {
          if (valor == "SAVE") {
            final RequestModel request =
                await sendResult(userId, int.parse(numX), int.parse(numY));

            _request = request;
            print(_request);
          }
          setState(() {
            if (numericRegex.hasMatch(valor) && position == 1) {
              displayNum.add(valor);
              numX = displayNum.join("");
              display = numX;
            }
            if (numericRegex.hasMatch(valor) && position == 2) {
              displayNum.add(valor);
              numY = displayNum.join("");
              display = numY;
            }
            //if (valor == "SAVE") {
            //sendResult(userId, int.parse(numX), int.parse(numY));
            //}
            if (valor == "DEL") {
              displayNum = [];
              numX = "";
              numY = "";
              position = 1;
              display = "0";
              operacao = 0;
            }
            if (valor == "+") {
              position = 2;
              display = "";
              operacao = 1;
              displayNum = [];
            }
            if (valor == "_") {
              position = 2;
              display = "";
              operacao = 2;
              displayNum = [];
            }
            if (valor == "x") {
              position = 2;
              display = "";
              operacao = 3;
              displayNum = [];
            }
            if (valor == "÷") {
              position = 2;
              display = "";
              operacao = 4;
              displayNum = [];
            }
            if (valor == "=") {
              double x = double.parse(numX);
              double y = double.parse(numY);
              switch (operacao) {
                case (1):
                  resultado = x + y;
                  //numX = resultado.toString();
                  display = resultado.toString();
                  break;
                case (2):
                  resultado = x - y;
                  numX = resultado.toString();
                  display = resultado.toString();
                  break;
                case (3):
                  resultado = x * y;
                  numX = resultado.toString();
                  display = resultado.toString();
                  break;
                case (4):
                  resultado = x / y;
                  numX = resultado.toString();
                  display = resultado.toStringAsFixed(2);
                  break;
              }
            }
          });
        },
        child: Center(
          child: Text(
            valor,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        shape: CircleBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "$display",
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.grey,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(child: buttonPad("7")),
                      Expanded(child: buttonPad("8")),
                      Expanded(child: buttonPad("9")),
                      Expanded(
                        child: buttonPad("÷"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(child: buttonPad("4")),
                      Expanded(child: buttonPad("5")),
                      Expanded(child: buttonPad("6")),
                      Expanded(child: buttonPad("_")),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(child: buttonPad("1")),
                      Expanded(child: buttonPad("2")),
                      Expanded(child: buttonPad("3")),
                      Expanded(child: buttonPad("+")),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(child: buttonPad(".")),
                      Expanded(child: buttonPad("0")),
                      Expanded(child: buttonPad("=")),
                      Expanded(child: buttonPad("x")),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(child: buttonPad("SAVE")),
                      Container(),
                      Container(),
                      Expanded(child: buttonPad("DEL")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

Future<RequestModel> sendResult(int userId, int numX, int numY) async {
  var url = "https://dev.api.amanet.com.br/v1/Calculadora/somar";

  final http.Response response = await http.post(Uri.encodeFull(url),
      body: json.encode({
        "user_id": userId,
        "valor_x": numX,
        "valor_y": numY,
        "result": 0,
      }),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });

  if (response.statusCode == 200) {
    final String responseString = response.body;

    return requestModelFromJson(responseString);
  } else {
    print(response.statusCode);
    return null;
  }
}
