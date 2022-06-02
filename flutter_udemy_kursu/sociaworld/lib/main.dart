// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sociaworld/gonderiKarti.dart';
import 'package:sociaworld/profilSayfasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  tikla(){
    setState(() {
      showModalBottomSheet(
                  //showBottomSheet: butona tıklayınca aşşadan yukarıya bir menü gösterir bize eger Modal eklemezsek scaffold bulunamadihatasi aliriz
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      children: <Widget>[
                        Text(
                          "Meü Argümanlari",
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    );
                  });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(child: Text("menü")),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[100], //grey in açık tonu
        elevation: 0.0, //gölgeleri kaldırdık
        /*leading: IconButton(
          //leading:appbarın ilk kısmı
          icon: Icon(Icons.menu),
          color: Colors.red,
          iconSize: 32.0,
          onPressed: () {},
        ),*/

        title: Text(
          "socialworld",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        centerTitle: true, //başlıgı ortala demek

        actions: <Widget>[
          //actions: appbarın sonu demek
          IconButton(
            onPressed: tikla,
            icon: Icon(Icons.notifications),
            color: Colors.purple[300],
          )
        ],
      ),
      body: ListView(children: <Widget>[
        Container(
          //width: double.infinity, bu konu için video 120 e bak
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                //boxShadow: gölge eklememizi saglar.
                color: Colors.grey,
                offset: Offset(5.0, 0.0), //x ve y eksenine göre gölgeyi ayarlar
                blurRadius: 5.0, //Gölgeyi giderek bulanıklaştırır
              ),
            ],
          ),

          child: ListView(
            scrollDirection: Axis.horizontal, //yatay olarak kullanmak için
            children: <Widget>[
              profilkrtiolustur(
                  "alikoccc2200",
                  "https://cdn.pixabay.com/photo/2020/09/27/23/39/cow-5608144_960_720.jpg",
                  "Ali Koç",
                  "https://cdn.pixabay.com/photo/2018/03/17/04/07/tunnel-3233082__340.jpg"),
              profilkrtiolustur(
                  "apo",
                  "https://cdn.pixabay.com/photo/2020/10/04/10/43/horse-5625922_960_720.jpg",
                  "Apdullah Sezgin",
                  "https://cdn.pixabay.com/photo/2016/02/07/17/19/eye-1185148__340.png"),
              profilkrtiolustur(
                  "gkhankocc",
                  "https://cdn.pixabay.com/photo/2021/01/05/13/21/man-5891130__340.jpg",
                  "Gökhan Koç",
                  "https://cdn.pixabay.com/photo/2021/01/05/13/21/man-5891130__340.jpg"),
              profilkrtiolustur(
                  "ayse4785",
                  "https://cdn.pixabay.com/photo/2017/04/05/10/45/girl-2204622_960_720.jpg",
                  "Ayşe Deggirmen",
                  "https://cdn.pixabay.com/photo/2021/12/07/07/01/psychology-6852458__340.jpg"),
              profilkrtiolustur(
                  "osmn42",
                  "https://cdn.pixabay.com/photo/2018/03/27/00/33/music-3264716_960_720.jpg",
                  "Osman Kurt",
                  "https://cdn.pixabay.com/photo/2017/06/01/16/42/book-2363912__340.jpg"),
              profilkrtiolustur(
                  "banusun",
                  "https://cdn.pixabay.com/photo/2017/04/05/20/38/girl-2206248_960_720.jpg",
                  "Banu Ateş",
                  "https://cdn.pixabay.com/photo/2017/04/05/20/38/girl-2206248_960_720.jpg"),
              profilkrtiolustur(
                  "Cevo",
                  "https://cdn.pixabay.com/photo/2016/04/13/19/20/binary-1327493_960_720.jpg",
                  "Cevdet Kasım",
                  "https://cdn.pixabay.com/photo/2017/07/27/18/45/view-2546328__340.png"),
              profilkrtiolustur(
                  "huso61",
                  "https://cdn.pixabay.com/photo/2020/12/12/17/24/little-egret-5826070_960_720.jpg",
                  "Huseyin Haklı",
                  "https://cdn.pixabay.com/photo/2017/10/12/21/29/trabzonspor-2846058__340.jpg"),
              /*profilkrtiolustur("Aykut",
                  "https://cdn.pixabay.com/photo/2020/05/17/20/21/cat-5183427_960_720.jpg"),
              profilkrtiolustur("Mustafa",
                  "https://cdn.pixabay.com/photo/2020/05/11/11/23/woman-5157666__340.jpg"),
              profilkrtiolustur("bayram",
                  "https://cdn.pixabay.com/photo/2013/07/12/13/46/sherlock-holmes-147255__340.png"),*/
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        GonderiKarti(
          aciklama: "hi everyone",
          gecenSure: "1 saat öce",
          isim: "Gökhan",
          soyisim: "Koç",
          gonderiResimLinki:
              "https://cdn.pixabay.com/photo/2016/03/27/16/54/face-1283106__340.jpg",
          profilResimLinki:
              "https://cdn.pixabay.com/photo/2021/01/05/13/21/man-5891130__340.jpg",
        ),
        GonderiKarti(
          aciklama: "good morning",
          gecenSure: "az önce",
          isim: "Mesut",
          soyisim: "Kara",
          gonderiResimLinki:
              "https://cdn.pixabay.com/photo/2018/03/27/00/33/music-3264716__340.jpg",
          profilResimLinki:
              "https://cdn.pixabay.com/photo/2016/07/22/16/54/portrait-1535266__340.jpg",
        ),
      ]),
    );
  }

  Widget profilkrtiolustur(String kullniciAdi, String resimAdresi,
      String ismSoyism, String kapakResimLink) {
    return Material(
      //Inkwelli tıklandıgında mürekkep sıcramasi eklmek istiyorak material eklemeliyiz
      child: InkWell(
        //Inkwell: bununla profil kartını tıklanabilir hale getiriyoruz
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ProfilSayfasi(
                  profilResimLinki: resimAdresi,
                  kullaniciAdi: kullniciAdi,
                  isimSoyIsim: ismSoyism,
                  kapakResimLinki: kapakResimLink,
                ),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          //columnun sadece sagına ve soluna padding ekledik
          child: Column(
            children: <Widget>[
              Stack(
                //stack ile üst üste widget ekleyebiliriz
                alignment: Alignment.topRight,
                //aligment ile stack üstüne eklenen widgeti sağ üste yerleştiririz
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.0, color: Colors.green),
                      //border: containerin kenarlarına çerceve ekledik
                      borderRadius: BorderRadius.circular(35.0),
                      image: DecorationImage(
                        image: NetworkImage(resimAdresi),
                        fit: BoxFit.cover,
                        //fit: containere yerleştirilen resimlerin içine tam olarak oturmasini sağlarF
                      ),
                    ),
                  ),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.0,
              ), //kullanici ismi ile profil arasini açar
              Text(
                kullniciAdi,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//video 120 kesinlikle izle
//video 132 kesinlikle izle
//video 136 kesinlikle izle
//video 140 bidaha bak
//video 141 kesinlikle izle ve not çıkar
//video150 ve 151 izlendi ama uygulanmadi
