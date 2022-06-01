// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class YaziEkrani extends StatefulWidget {
  const YaziEkrani({Key? key}) : super(key: key);

  @override
  State<YaziEkrani> createState() => _YaziEkraniState();
}

class _YaziEkraniState extends State<YaziEkrani> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  var gelenYaziBasligi = "";
  var gelenYaziIcerigi = "";

  final user = FirebaseAuth.instance.currentUser;

  yaziEkle() {
    FirebaseFirestore.instance.collection("Yazilar").doc(t1.text).set({
      'kullaniciId': user?.uid,
      'baslik': t1.text,
      'icerik': t2.text
    }).whenComplete(() => print("yazi eklendi"));
  }

  yaziGuncelle() {
    FirebaseFirestore.instance
        .collection("Yazilar")
        .doc(t1.text)
        .update({'baslik': t1.text, 'icerik': t2.text}).whenComplete(
            () => print("yazi güncellendi"));
  }

  yaziSil() {
    FirebaseFirestore.instance
        .collection("Yazilar")
        .doc(t1.text)
        .delete()
        .whenComplete(() => print("yazi silindi"));
  }

  yaziGetir() {
    FirebaseFirestore.instance
        .collection("Yazilar")
        .doc(t1.text)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenYaziBasligi = gelenVeri.data()!['baslik'];
        gelenYaziIcerigi = gelenVeri.data()!['icerik'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("yazi ekrani"),
      ),
      body: Container(
        margin: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: t1,
              ),
              TextField(
                controller: t2,
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: yaziEkle, child: Text("ekle")),
                  ElevatedButton(
                      onPressed: yaziGuncelle, child: Text("güncelle")),
                  ElevatedButton(onPressed: yaziSil, child: Text("sil")),
                  ElevatedButton(
                      onPressed: yaziGetir, child: Text("yazigetir")),
                ],
              ),
              ListTile(
                title: Text(gelenYaziBasligi),
                subtitle: Text(gelenYaziIcerigi),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
