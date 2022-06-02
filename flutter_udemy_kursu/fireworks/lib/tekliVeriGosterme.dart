// ignore_for_file: prefer_const_constructors, avoid_print, avoid_function_literals_in_foreach_calls, non_constant_identifier_names, unused_local_variable, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

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

  @override
  void initState() {
    super.initState();
    //kullaniciGetir();
    //kimlikIleKullaniciGetir();
    //kullaniciSirala();
    //kullaniciSorgula();
    //kullaniciCokluSorgu();
    //kullaniciOlustur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //normalde builder kullandıgımız zaman daha sonra yeniwidgetler ekleyebiliyorduk. futurebuilderin farkı ise gecikmeli
      //işlemin tamamlanmasını bekleyip tamamlandıktan sonra işlem yapabilmesidir
      body: FutureBuilder(
        future: db.collection("Kullanicilar").doc("BdclUveRnfi2T36xEUeZ").get(),
        //builder kullanımı degişmiş video182 den farklı
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //hasData : data yükleniyor mu yani var mı demek
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
            //CircularProgressIndicator : yükleniyor animasyon widgeti
          }
          Kullanici kullanici = Kullanici.dokumandanUret(snapshot.data);
          //return Center(child: Text(snapshot.data["isim"]));
          return ListTile(
            title: Text(kullanici.isim! + " " + kullanici.soyAd!),
            subtitle: Text(kullanici.ePosta!),
            leading: Image.network(
              kullanici.avatar!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
