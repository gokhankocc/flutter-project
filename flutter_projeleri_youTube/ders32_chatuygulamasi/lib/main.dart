import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Uygulamasi',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Uygulamasi"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      mesajListesi.insert(0, mesajNesnesi);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    //kendi widgetimizi yazabiliyoruz
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Flexible(
            //textfieldi flexible ile sarmamız gerekiyo çünkü naacagını bilmiyor
            child: TextField(
              controller: t1,
            ),
          ),
          IconButton(
              onPressed: () => listeyeEkle(t1.text), icon: Icon(Icons.send))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                reverse: true,
                itemCount: mesajListesi.length,
                itemBuilder: (context, indexNumarasi) =>
                    mesajListesi[indexNumarasi]),
          ),
          Divider(
            //Dvider uzunlamaina çizgi çeker
            thickness: 10,
          ),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Kullanici1";

class MesajBalonu extends StatelessWidget {
  var mesaj;
  /*MesajBalonu(String mesaj) {
    this.mesaj = mesaj;
  }*/
  MesajBalonu({this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Text(isim[0]),
          ), //bizim sosyal medyadaki yuvarlak profil resmi
          Column(
            children: <Widget>[
              Text(mesaj),
              Text(isim),
            ],
          ),
        ],
      ),
    );
  }
}
