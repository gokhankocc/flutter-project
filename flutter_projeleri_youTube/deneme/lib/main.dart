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
      title: 'yok',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: AnaEkran(),
    );
  }
}


class AnaEkran extends StatefulWidget {
  

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  var sayi=0;
  say(){
    setState(() {
      sayi++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("yok"),
      ),
      body: Text("bardak sayisi $sayi"),
      floatingActionButton: FloatingActionButton(onPressed:say,),
    );
  }
}
