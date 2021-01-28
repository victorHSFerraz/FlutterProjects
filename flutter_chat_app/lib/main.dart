import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_app/chat_screen.dart';

void main() {
  runApp(HomePage());
  Firestore.instance
      .collection("col")
      .document("doc")
      .setData({"texto": "Harambe"});
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
      ),
      home: ChatScreen(),
    );
  }
}
