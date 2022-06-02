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
  }

//çekilen çoklu veriyi ekrana getirme. verileri listeye aktaracagız.
  Future<List<Kullanici>> kullaniciGetir() async {
    var Snapshot = await db.collection("Kullanicilar").get();
    List<Kullanici> kullanicilar =
        Snapshot.docs.map((doc) => Kullanici.dokumandanUret(doc)).toList();
    return kullanicilar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Kullanici>>(
        future: kullaniciGetir(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var length;
          return ListView.builder(
              itemCount: snapshot.data.length,
              //itemcount : bununla listenin kaç tane eleman alması gerektiğini söylüyoruz
              // ignore: avoid_types_as_parameter_names
              itemBuilder: (context, pozisyon) {
                return ListTile(
                  title: Text(snapshot.data[pozisyon].isim),
                  subtitle: Text(snapshot.data[pozisyon].ePosta),
                  //normalde videoda Futurebuilder'ın yanına <List<Kulanıci>> ekleyince editörün bize yardımcı olması lazımdı ama olmuyor nedenini öğren
                );
              });
        },
      ),
    );
  }
}


//normalde videoda Futurebuilder'ın yanına <List<Kulanıci>> ekleyince editörün bize yardımcı olması lazımdı ama olmuyor mesela 
//snapshot.sata.[pzisyon]. dan sonra isim vs. göstermesi lazımdı ama gösetermiyor nedenini öğren ?????????