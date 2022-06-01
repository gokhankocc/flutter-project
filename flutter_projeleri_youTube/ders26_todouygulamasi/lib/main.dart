import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo uygulamasi",
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
        title: Text("Alişveris Listesi Uygulamasi"),
      ),
      body: anaEkran(),
    );
  }
}

class anaEkran extends StatefulWidget {
  const anaEkran({Key? key}) : super(key: key);

  @override
  State<anaEkran> createState() => _anaEkranState();
}

class _anaEkranState extends State<anaEkran> {
  TextEditingController t1 = TextEditingController();
  List alisverisListesi = [];

  elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: alisverisListesi.length,
                itemBuilder: (context, indexnumarasi) => ListTile(
                  subtitle: Text("alışveriş ürünleri"),
                      title: Text(alisverisListesi[indexnumarasi]),
                    )),
          ),
          TextField(
            controller: t1,
          ),
          ElevatedButton(onPressed: elemanCikar, child: Text("eleman cikar")),
          ElevatedButton(onPressed: elemanEkle, child: Text("eleman ekle")),
        ],
      ),
    );
  }
}
