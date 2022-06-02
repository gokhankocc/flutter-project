// ignore_for_file: prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireworks/models/kullanici.dart';
import 'package:fireworks/services/benimAuthServisim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GirisSayfasi extends StatelessWidget {
  const GirisSayfasi({Key? key}) : super(key: key);
  anonomGirisYap(BuildContext context) async {
    var _benimautservisim =
        Provider.of<BenimAutservisim>(context, listen: false);
    Kullanici? kullanici = await _benimautservisim.anonimGiris();
    //return kullanici?.id; şuan bir deger dönmediği için kapattık
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          width: 120,
          color: Colors.grey,
          child: Center(
              child: InkWell(
                  onTap: () => anonomGirisYap(context),
                  child: Text("giriş yap"))),
        ),
      ),
    );
  }
}
