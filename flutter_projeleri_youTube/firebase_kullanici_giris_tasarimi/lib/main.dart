// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_kullanici_giris_tasarimi/profilsayfasi.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Iskele(),
    );
  }
}

class Iskele extends StatefulWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  State<Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  Future<void> kayitOl() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: t1.text, password: t2.text)
        .then((kullanici) {
      FirebaseFirestore.instance
          .collection("Kullanicilar")
          .doc(t1.text)
          .set({"kullaniciEposta": t1.text, "KullaniciSifre": t2.text});
    });
  }

  girisYap() {
    FirebaseAuth.instance //kullanici varsa giriş yapar
        .signInWithEmailAndPassword(email: t1.text, password: t2.text)
        .then((kullanici) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => profilEkrani()),
        (route) => false,
      );
    });
  }
  /*girisYap() {
    int kontrol = 1;
    if (kontrol == 1) {
      FirebaseAuth.instance //kullanici varsa giriş yapar
          .signInWithEmailAndPassword(email: t1.text, password: t2.text)
          .then((kullanici) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => profilEkrani()),
          (route) => false,
        );
      });
      kontrol = 0;
    }
    if (kontrol != 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Yanlış kullanıcı adı veya şifre"),
            content: new Text("Lütfen giriş bilgilerinizi gözden geçirin."),
            actions: <Widget>[
              // ignore: unnecessary_new, deprecated_member_use
              new FlatButton(
                child: new Text("Kapat"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "kullanici mail"),
                controller: t1,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "kullanici şifre"),
                controller: t2,
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: kayitOl, child: Text("kaydol")),
                  ElevatedButton(onPressed: girisYap, child: Text("giriş")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
