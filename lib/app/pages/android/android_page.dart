import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'android_controller.dart';

class AndroidPage extends StatefulWidget {
  final String title;
  const AndroidPage({Key key, this.title = "Android"}) : super(key: key);

  @override
  _AndroidPageState createState() => _AndroidPageState();
}

class _AndroidPageState extends ModularState<AndroidPage, AndroidController> {
  Widget botaozinho(valor, {child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 10,
      ),
      child: RawMaterialButton(
        onPressed: () => controller.displayInput(valor),
        child: Center(
          child: child,
        ),
        shape: CircleBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Observer(
                      builder: (context) {
                        bool value = controller.hasConnected;

                        return PopupMenuButton<String>(
                          onSelected: (String result) {
                            if (result == "connect") {
                              controller.alterConnect(true);
                            } else {
                              controller.alterConnect(false);
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            value
                                ? const PopupMenuItem<String>(
                                    value: "desconnect",
                                    child: Text('Desconectar da API'),
                                  )
                                : const PopupMenuItem<String>(
                                    value: "connect",
                                    child: Text('Conectar com a API'),
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.only(
                    right: 12,
                  ),
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Observer(
                      builder: (context) {
                        return AutoSizeText(
                          controller.display,
                          style: TextStyle(
                            fontSize: 82,
                            fontWeight: FontWeight.w300,
                          ),
                          maxLines: 1,
                          minFontSize: 32,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Color(0xFF3C4042),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: botaozinho(
                                        "7",
                                        child: Text(
                                          "7",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: botaozinho(
                                        "8",
                                        child: Text(
                                          "8",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: botaozinho(
                                        "9",
                                        child: Text(
                                          "9",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: botaozinho(
                                        "4",
                                        child: Text(
                                          "4",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: botaozinho(
                                        "5",
                                        child: Text(
                                          "5",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: botaozinho(
                                        "6",
                                        child: Text(
                                          "6",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: botaozinho(
                                        "1",
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: botaozinho(
                                        "2",
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: botaozinho(
                                        "3",
                                        child: Text(
                                          "3",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: botaozinho(
                                        ".",
                                        child: Text(
                                          ".",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: botaozinho(
                                        "0",
                                        child: Text(
                                          "0",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: botaozinho(
                                        "=",
                                        child: Text(
                                          "=",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          color: Color(0xFF5F6267),
                          child: Column(
                            children: [
                              Expanded(
                                child: botaozinho(
                                  "DEL",
                                  child: Text(
                                    "DEL",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: botaozinho(
                                  "÷",
                                  child: Text(
                                    "÷",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: botaozinho(
                                  "×",
                                  child: Text(
                                    "×",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: botaozinho(
                                  "−",
                                  child: Text(
                                    "−",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: botaozinho(
                                  "+",
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
