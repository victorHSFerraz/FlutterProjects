import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";

  void _resetField() {
    weightController.text = "";
    heightController.text = "";
    _infoText = "Informe seus dados";
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double resultado = weight / (height * height);
      if (resultado < 18.0) {
        _infoText =
            "IMC: ${resultado.toStringAsPrecision(4)} | Abaixo do peso ideal.";
      }
      if (resultado >= 18.0 && resultado < 25.0) {
        _infoText = "IMC: ${resultado.toStringAsPrecision(4)} | Peso ideal.";
      }
      if (resultado >= 25.0) {
        _infoText =
            "IMC: ${resultado.toStringAsPrecision(4)} | Acima do peso ideal.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _resetField();
                });
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Peso (kg)"),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                controller: weightController,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Altura (cm)"),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                controller: heightController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: _calculate,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "$_infoText",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
