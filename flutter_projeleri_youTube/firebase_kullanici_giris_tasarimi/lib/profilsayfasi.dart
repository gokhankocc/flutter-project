// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_kullanici_giris_tasarimi/anasayfa.dart';
import 'package:firebase_kullanici_giris_tasarimi/main.dart';
import 'package:firebase_kullanici_giris_tasarimi/yazisayfasi.dart';
import 'package:flutter/material.dart';

class profilEkrani extends StatelessWidget {
  const profilEkrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profil Ekrani"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => AnaSayfa()),
                    (route) => true);
              }),
          //IconButton(icon: Icon(Icons.exit_to_app),onPressed: (){FirebaseAuth.instance.signOut().then((value) => null););
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((deger) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => Iskele()),
                    (route) => false);
              });
              //Navigator.pushAndRemoveUntil:kendinden önceki sayfaları kaldırır performansa da etkisi vardır.
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => YaziEkrani()),
                (route) => true);
            //buradaki degeri true yaparsak geçilen sayfada eger appbar varsa geri tüşü ekler
          }),
      body: Container(
        child: KullaniciYazilari(),
      ),
    );
  }
}

class KullaniciYazilari extends StatefulWidget {
  @override
  _KullaniciYazilariState createState() => _KullaniciYazilariState();
}

final user1 = FirebaseAuth.instance.currentUser;
//suan ki giriş yaptıgımız kullanıcı bilgilerini tıtmak için kullanılır

class _KullaniciYazilariState extends State<KullaniciYazilari> {
  Query blogYazilari = FirebaseFirestore.instance
      .collection('Yazilar')
      .where("kullaniciId", isEqualTo: user1?.uid);
  //Snapshot, veritabanının o anki değiştirilemez bir görüntüsünün oluşturulmasıdır, o anki fotoğrafını çekmek gibi düşünebilirsiniz.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: blogYazilari.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          //snapsootu map yapısiıyla alıp listwiew içinde liste yaparak gösterebiliriz bu kodu siteden hazır aldık unutma
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['baslik']),
              subtitle: Text(data['icerik']),
            );
          }).toList(), //toList ile listeye çevirdik
        );
      },
    );
  }
}
