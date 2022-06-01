import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/", //baslangıç ekranını bekirlemmizi saglar
      routes: {
        "/": (context) => GirisEkrani(),
        //contex,n önüne hangi ekrana gidecegimizi yazariz
        "/ProfilSayfasiRotasi": (context) => ProfilEkrani(),
      },
    );
  }
}

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({Key? key}) : super(key: key);

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  girisYap() {
    if (t1.text == "admin" && t2.text == "1234") {
      Navigator.pushNamed(context, "/ProfilSayfasiRotasi",
          arguments: veriModeli(kulllaniciAd: t1.text, sifre: t2.text));
      //bu metod calisinca bize profil ekranını göstrecek
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Yanlış kullanıcı adı veya şifre"),
            content: new Text("Lütfen giriş bilgilerinizi gözden geçirin."),
            actions: <Widget>[
               new FlatButton(
                child: new Text("Kapat"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GİRİŞ Ekrani"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(100),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Kullanıcı Adı"),
                //decoration girilecek yerin bilgisini verir.
                controller: t1,
              ), //dogrulama işleleri şifre kuralları gibi dogrulamalar yapabliyoruz
              TextFormField(
                decoration: InputDecoration(hintText: "kullanıcı şifre"),
                controller: t2,
              ),
              ElevatedButton(onPressed: girisYap, child: Text("Giriş Yap"))
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilEkrani extends StatefulWidget {
  const ProfilEkrani({Key? key}) : super(key: key);

  @override
  State<ProfilEkrani> createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  cikisyap() {
    Navigator.pop(context);
    //bu metod calisinca en son acılan ekranı kapatır.
  }

  @override
  Widget build(BuildContext context) {
    veriModeli iletilenArgumanlar =
        ModalRoute.of(context)!.settings.arguments as veriModeli;
    //bu widgetla iletilen verilerin içeriğine erişmiş olduk
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Ekrani"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: cikisyap, child: Text("Çikiş Yap")),
            Text(iletilenArgumanlar.kulllaniciAd),
            Text(iletilenArgumanlar.sifre),
          ],
        ),
      ),
    );
  }
}

class veriModeli {
  var kulllaniciAd, sifre;

  veriModeli({this.kulllaniciAd, this.sifre});
}
