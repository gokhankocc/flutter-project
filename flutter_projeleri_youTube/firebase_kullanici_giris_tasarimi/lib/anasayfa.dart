// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
//buradaki codu Realtime changes den hazır aldık
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TumYazilar(),
    );
  }
}

class TumYazilar extends StatefulWidget {
  @override
  _TumYazilarState createState() => _TumYazilarState();
}

class _TumYazilarState extends State<TumYazilar> {
  final Stream<QuerySnapshot> blogYazilari =
      FirebaseFirestore.instance.collection('Yazilar').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: blogYazilari,
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
//Map yapısı aslında bir koleksiyon yapısıdır. Aynı zamanda bir sözlük gibi de düşünebiliriz. Bu yapı sayesinde key ve value değerleri ile kolay
//// bir tanım sağlayabilmekteyiz.
