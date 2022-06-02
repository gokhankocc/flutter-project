// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireworks/models/kullanici.dart';
import 'package:fireworks/services/benimAuthServisim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '_GirisSayfasi.dart';
import '_AnaSayfa.dart';

class YonlendirmeSayfasi extends StatefulWidget {
  const YonlendirmeSayfasi({Key? key}) : super(key: key);

  @override
  State<YonlendirmeSayfasi> createState() => _YonlendirmeSayfasiState();
}

class _YonlendirmeSayfasiState extends State<YonlendirmeSayfasi> {
  @override
  Widget build(BuildContext context) {
    //var firebaseAuth = Provider.of<FirebaseAuth>(context, listen: false);
    //listeni initstate içinde kullanabilmek için false yapmak lazım yoksa çalışmaz önemli unutma

    return StreamBuilder(
        stream: Provider.of<BenimAutservisim>(context, listen: false)
            .durumTakipcisi,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //connectionstate : bağlantı durum bilgisine ulaşmamızı saglıyor.
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            Kullanici aktifkullanici = snapshot.data;
            //burasi çok önemli aktifkullanici. dan sonra veri elemanlarına ulaşmak için user tipinde yazdık anlamadıysan bidaha izle video191
            print("kullanıcı");
            print(aktifkullanici.id);
            return AnaSayfa();
          } else {
            return GirisSayfasi();
          }
        });
  }
}
