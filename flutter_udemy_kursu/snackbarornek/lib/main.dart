import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.green,
      ),
      home: Mesaj(),
    );
  }
}

class Mesaj extends StatelessWidget {
  const Mesaj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: yeni(),
    );
  }
}

class yeni extends StatelessWidget {
  const yeni({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("merhaba",
                style: TextStyle(
                  color: Colors.red,
                ))));
      },child: Text("mesaj at"),
    );
  }
}
