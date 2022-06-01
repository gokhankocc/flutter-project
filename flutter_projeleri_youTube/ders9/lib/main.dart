import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "uygulama çercevesi",
      home: AnaEkran(), //home baska bir widget çagırmak için kulanılır
    );
  }
}

class AnaEkran extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('boş uygulama çerçevesi'),
      ),
      body: Container(
        child:  Center(child :Text("merhaba")),
      ),
    );
  }
}