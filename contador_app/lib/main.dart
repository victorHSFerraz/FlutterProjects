import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contador",
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _statusText = "Disponível";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$_statusText",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    child: Text(
                      "- 1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_people > 0) {
                          _people--;
                        }
                        if (_people != 10) {
                          _statusText = "Disponível";
                        } else {
                          _statusText = "Lotado";
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    child: Text(
                      "+ 1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_people < 10) {
                          _people++;
                        }
                        if (_people != 10) {
                          _statusText = "Disponível";
                        } else {
                          _statusText = "Lotado";
                        }
                      });
                    },
                  ),
                )
              ],
            ),
            Text(
              "Pessoas: $_people",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
