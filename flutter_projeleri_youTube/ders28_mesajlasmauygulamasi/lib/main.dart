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
      title: 'Mesajlasma Uygulamasi',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
        title: Text("mesajlaşma uygulamasi arayüzü"),
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

  List mesajListesi = [];

  mesajGonder(String metin) {
    setState(() {
      mesajListesi.insert(0, metin);
      //girilen mesajları üst üste degilde alt alta koyar
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40), //conteinera her yönden bosluk verir
      child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
                  reverse: true, //mesajları aşşadan yukarıya sıralar
                  itemCount: mesajListesi.length,
                  itemBuilder: (context, int indexNumarasi) =>
                      Text(mesajListesi[indexNumarasi]))),
          Row(
            //yazılan mesajla gönder butonunu yan yana koymak için kullandık
            children: <Widget>[
              Flexible(
                child: TextField(
                  onSubmitted:
                      mesajGonder, //mesajları enter ile göndermek içinkullandık ama elli bir parametre almasi lazım bu yüzden mesajgönder
                  controller:
                      t1, // fonksiyonuna parametre atadık ama bu islem butonu devre bırakıyor
                ),
              ),
              ElevatedButton(
                  onPressed: mesajGonder(t1.text), child: Text('mesaj gonder')),
            ],
          )
        ],
      ),
    );
  }
}
