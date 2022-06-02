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
            FlutterLogo(
              size: 70,
              textColor: Colors.green,
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
            Container(
              alignment: Alignment.topRight, //hizalama sag uste hizalar
              //width: 350.0, //en kendimiz deger vermek istersek
              width: MediaQuery.of(context).size.width - 70.0,
              //ekranın yatay boyutuna göre saglı sollu ayarlama
              height: 180.0, //boy
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.all(25),//padding containeri içten magin ise dıstan sarar
                //padding: EdgeInsets.all(25),
                width: 100,
                height: 100,
                color: Colors.red,
              )
              
            )
          ],
        ),
      ),
    );
  }
}
