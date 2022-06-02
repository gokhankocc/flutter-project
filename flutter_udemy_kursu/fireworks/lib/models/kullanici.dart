// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Kullanici {
  final String? id;
  final String? isim;
  final String? soyAd;
  final String? avatar;
  final String? ePosta;

  Kullanici(
      {required this.id,
      this.isim = '',
      this.soyAd = '',
      this.avatar = '',
      this.ePosta = ''});

  //factory : telefon santrali gibi davranır yani bir aracı gibi düşünüleilir.

  factory Kullanici.dokumandanUret(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic>? data = doc.data()!;
    return Kullanici(
      id: doc.id,
      isim: data.containsKey("isim") ? data["isim"] : '',
      soyAd: data.containsKey("soyAd") ? data["soyAd"] : '',
      avatar: data.containsKey("avatar") ? data["avatar"] : '',
      ePosta: data.containsKey("mail") ? data["mail"] : '',
    );
  }

  factory Kullanici.firebasenUret(User kullanici) {
    return Kullanici(
      id: kullanici.uid,
      isim: kullanici.displayName,
      avatar: kullanici.photoURL,
      ePosta: kullanici.email,
    );
  }
}
