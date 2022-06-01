import 'dart:html';

import 'package:flutter/material.dart';

import 'anaEkran.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //çatı widgeti
      title: 'Hesap Makinesi Uygulamasi', //başlık
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basit Hesap Makinesi'),
      ),
      body: anaEkran(),
    );
  }
}

