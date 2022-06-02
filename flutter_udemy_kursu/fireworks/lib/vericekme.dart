// ignore_for_file: prefer_const_constructors, avoid_print, avoid_function_literals_in_foreach_calls, non_constant_identifier_names, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/kullanici.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await Firebase.initializeApp();
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
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final db = FirebaseFirestore.instance;
  //kolaylık olsun diye database db seklinde kısalttık
  //
  kullaniciGetir() async {
    var Snapshot = await db.collection("Kullanicilar").get();
    Snapshot.docs.forEach((doc) {
      print(doc.data()["isim"]);
    });
  }

  kimlikIleKullaniciGetir() async {
    //yukarıdaki fonsiyondan farklı olarak sadece doc kullandık ve bu bize sadece bir tane dokümanı getirir demek.
    //doc yazıp parantez içine kullanıcıya ait olan ıdyi yapıştırırız ve o id ye ait bir kullanici varmı diye kontrol yapariz.
    var doc =
        await db.collection("Kullanicilar").doc("BdclUveRnfi2T36xEUeZ").get();

    if (doc.exists) {
      print(doc.data());
    } else {
      print("böyle bir kullanici yok");
    }
  }

  kullaniciSirala() async {
    var Snapshot = await db.collection("Kullanicilar").orderBy("yas").get();
    //orderby ile yasa göre sıralama yaptık eger buyukten küçüğe sıralama yapmak istersek descending : true deriz istemezsek sileriz
    Snapshot.docs.forEach((doc) {
      print(doc.data()["isim"]);
    });
  }

  kullaniciSorgula() async {
    var Snapshot =
        await db.collection("Kullanicilar").where("yas", isEqualTo: 45).get();
    Snapshot.docs.forEach((doc) {
      print(doc.data()["isim"]);
    });
  }

  kullaniciCokluSorgu() async {
    // DİKKAT : video 179 da çoklu sorgu yaparken dizin ekleme hatası çıkıyordu ama burda dizin eklemeden sorgu yapabildik. tamam tamam isgreaterThan
    //kullanınca geldi. çıkan hatada linki kopyala ve googla yapıştır. ama linki debug consoleden al hata mesajında eksik olabilir. daha sonra create indexe tıkla
    //ve bitir..
    var Snapshot = await db
        .collection("Kullanicilar")
        .where("soyAd", isEqualTo: "Koc")
        .where("yas", isGreaterThan: 22)
        .limit(1)
        .get();
    //limit 1 dersek sadece 1 kişi ekrana çıkar.
    Snapshot.docs.forEach((doc) {
      print(doc.data()["isim"]);
    });
  }

  kullaniciOlustur() async {
    var doc =
        await db.collection("Kullanicilar").doc("BdclUveRnfi2T36xEUeZ").get();
    Kullanici kullanici1 = Kullanici.dokumandanUret(doc);
    //video 181 de kullaanıcı makinesi ürettik istersek aşşagıdaki yapıyıda kullanabilirdik. burada factory ile datadan veri çektik.
    /*var kullanici1 = Kullanici(
      id: doc.id,
      isim: doc.data()!["isim"],
      soyAd: doc.data()!["soyAd"],
      avatar: doc.data()!["avatar"],
      ePosta: doc.data()!["mail"],
    );*/
    print(kullanici1.id);
    print(kullanici1.isim);
    print(kullanici1.soyAd);
    print(kullanici1.avatar);
    print(kullanici1.ePosta);
  }

  @override
  void initState() {
    super.initState();
    //kullaniciGetir();
    //kimlikIleKullaniciGetir();
    //kullaniciSirala();
    //kullaniciSorgula();
    //kullaniciCokluSorgu();
    kullaniciOlustur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 60,
          height: 50,
          child: Text("merhaba"),
        ),
      ),
    );
  }
}
