// ignore_for_file: prefer_const_constructors

import 'dart:ui';

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
        primarySwatch: Colors.purple,
      ),
      home: GirisSayfasi(),
    );
  }
}

class GirisSayfasi extends StatelessWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 45.0, //boş bir görünmez kutu
            ),
            /*FlutterLogo(
              size: 70,
              textColor: Colors.green,
            ),*/
            Container(
              //logo tasarimi için
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/robot.png"))),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              "Experience",
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 35.0,
            ),
            Material(
              //material: gölge eklemek için kullanılır 3 boyutlu yapar
              borderRadius: BorderRadius.circular(20.0),
              elevation:
                  20.0, //elevation: yukseklik demek gölgenin boyunu belirler
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //buyuk conteinerin içindekileri ortaya düzgün yerleştirmek için
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        //conteiner ile button yapma
                        alignment: Alignment.center,
                        child: Text(
                          "mail ile giriş",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        width: double.infinity,
                        height: 52.0,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        //yatay buton eklemek için
                        children: <Widget>[
                          Expanded(
                            //expended: içinde bulundugu row (coloumn da olabilir) bos yer kalmayacak şekilde kaplar
                            child: Container(
                              alignment: Alignment.center,
                              height: 52.0,
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                "facebook ile giriş",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            width: 20,
                          ), //facebook ile gmail arasına boşluk için
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.red,
                              ),
                              child: Text(
                                "Gmail ile giriş",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  //containerin butun dekarosyanlarını bunun içinde yaparız
                  gradient: LinearGradient(
                    //renk ayarı yapar belli bir yerden baslar belli bir yeredogru renk degişir
                    begin: Alignment.topLeft, //conteinerin baslayacagı yer
                    end: Alignment.bottomRight, //bitecegi yer
                    colors: [
                      Colors.purple.shade300,
                      Colors.purple.shade100,
                    ],
                  ),

                  borderRadius: BorderRadius.circular(
                      20.0), //containerin kenarlarını bombeli yapar
                ),
                alignment: Alignment.topRight, //hizalama sag uste hizalar ????

                //width: 350.0, //en kendimiz deger vermek istersek
                width: MediaQuery.of(context).size.width - 70.0,
                //ekranın yatay boyutuna göre saglı sollu ayarlama
                height: 180.0, //boy
              ),
            )
          ],
        ),
      ),
    );
  }
}


//video 111 de kaldık....
//video 113 de enum kullnaımı var ona bidaha bak önemli bişe
//video 115 istediğimiz rengi eklemeyi gösteriyor 