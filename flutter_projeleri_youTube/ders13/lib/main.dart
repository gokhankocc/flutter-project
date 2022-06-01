import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "uygulama çercevesi",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("boş uygulama"),
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
  //Ekrandaki durumları gösteren kısım kodlar genellikle buraya yazılır

  String blokYazisi = 'Bloga hosgeldiniz';

  void martGoster() {
    setState(() {
      blokYazisi = 'martvndsnjvnbsdıhcnsdvclsdnvı';
    });
  }

  void nisangoster() {
    setState(() {
      blokYazisi = 'nisanjscndkncıvecsdvsmsdnvcsdc';
    });
  }

  void mayisgoster() {
    setState(() {
      blokYazisi = 'mayis göster';
    });
  }

  void hazirangoster() {
    setState(() {
      blokYazisi = 'haziran göster';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        //merkeze widget koyar
        child: Column(
          //column widget içinde başka widgetleri alt alta koyar
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //mainAx.. coloumn'u ortalar
            Text(blokYazisi),
            RaisedButton(
              onPressed: martGoster,
              child: Text('Mart Yazısı'),
            ),
            RaisedButton(
              onPressed: nisangoster,
              child: Text('nisan yazisi'),
            ),
            RaisedButton(
              onPressed: mayisgoster,
              child: Text('mayis göster'),
            ),
            RaisedButton(
              onPressed: hazirangoster,
              child: Text('haziran göster'),
            ),
          ],
        ),
      ),
    );
  }
}
