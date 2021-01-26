import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;

  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null) {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=PQbT76cmGMfkXQlyueGg5CLaLI7CNfTX&limit=20&rating=g");
    } else {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=PQbT76cmGMfkXQlyueGg5CLaLI7CNfTX&q=$_search&limit=19&offset=$_offset&rating=g&lang=en");
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                labelText: "Procurar",
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 17.0),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(width: 1.0, color: Colors.white)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(width: 1.0, color: Colors.white),
                ),
                hintText: "dogs",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.white),
              onSubmitted: (text) {
                setState(() {
                  _search = text;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
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
                      return Container();
                    else
                      return _creatGifTable(context, snapshot);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _creatGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: snapshot.data["data"].length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Image.network(
            snapshot.data["data"][index]["images"]["fixed_height"]["url"],
            height: 300.0,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
