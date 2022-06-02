// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'gonderiKarti.dart';

class ProfilSayfasi extends StatelessWidget {
  var kullaniciAdi;
  var profilResimLinki;
  var kapakResimLinki;
  var isimSoyIsim;

  ProfilSayfasi(
      {this.isimSoyIsim,
      this.kapakResimLinki,
      this.kullaniciAdi,
      this.profilResimLinki});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              //
              Container(
                // width: double.infinity,
                height: 230,
                //color: Colors.yellow,
              ),
              //
              Container(
                //kapak resimi için
                // width: double.infinity,
                height: 180,

                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      image: NetworkImage(kapakResimLinki), //network ımage
                      fit: BoxFit.cover),
                ),
              ),
              //
              //positioned: stac içindeki belirli bir widgeti konumlandrmak için kulllanırız aslında biz aligment ile hizalama yapabiliyorduk
              //ama burdaki stackte aligment kullanırsak stack içideki butun widgetlari hizalamiş oluruz ama biz sadece profilimizin oldugu containeri
              //sol alt köşeye konumlandırmak istiyoruz.
              Positioned(
                left: 20.0,
                bottom: 0.0,
                child: Container(
                  //profil resimi için oluşturduk
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: NetworkImage(profilResimLinki),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(60.0),
                      border: Border.all(color: Colors.white, width: 2.0)),
                ),
              ),
              //
              Positioned(
                top: 190.0, //neden bottom da 40 verince olmadı öğren ?
                left: 140.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      //isim soyisim için
                      isimSoyIsim,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //
                    Text(
                      //kulllanıc adi için
                      kullaniciAdi,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 130.0,
                right: 15.0,
                child: Container(
                  height: 40.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add_circle,
                        size: 18.0,
                      ),
                      //
                      SizedBox(
                        width: 2.0,
                      ),
                      //
                      Text(
                        "Takip Et",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
              )
            ],
          ),
          //
          SizedBox(
            height: 20.0,
          ),
          //
          Container(
            height: 75.0,
            color: Colors.grey.withOpacity(0.1), //şeffaflık ayrı
            //
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //
                sayac("Takipçi Sayisi", "20K"),
                sayac("Takip", "500"),
                sayac("Paylaşım", "5")
              ],
            ),
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
        ],
      ),
    );
  }

  Widget sayac(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          sayi,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        //
        SizedBox(
          height: 1.0,
        ),
        //
        Text(
          baslik,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
//TextButton(onPressed: () {Navigator.pop(context);},child: Text("sırayı arkaya ver")),