// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:f_market/sepetim.dart';
import 'package:f_market/urunler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projem',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Anaekran());
  }
}

class Anaekran extends StatefulWidget {
  const Anaekran({Key? key}) : super(key: key);

  @override
  State<Anaekran> createState() => _AnaekranState();
}

class _AnaekranState extends State<Anaekran> {
  int icerikNo = 1;
  late List<Widget> _icerkler; // neden late ekledi
  //eger bir liste tanımlarken başına _ koyarsak o liste içini dolmurmamız gerektiği anlamına gelir. kodda herhangi bir ye _ yazarak o listeye bakabiliriz

  @override
  void initState() {
    super.initState();
    _icerkler = [urunler(), sepetim()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Uçarak Gelsin",
          style: TextStyle(
              color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: _icerkler[icerikNo],
      //
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: icerikNo,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "ürünler"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "sepetim"),
        ],
        //BottomNavigationBar: bu boton appbar gibi sadece yeri aşşağida içerisinde itemler var iki tane icon almak zorunda tek de hata verir.
        //hangisine tıkladıgımızı belirlemek için ontap kullanıyoruz.
        onTap: (int tiklananbuton) {
          setState(() {
            icerikNo = tiklananbuton;
          });
        },
      ),
    );
  }
}


//video 155 bidaha izle insstate kullanımı var orda