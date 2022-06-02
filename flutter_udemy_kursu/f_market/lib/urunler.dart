// ignore_for_file: camel_case_types

import 'package:f_market/kategori.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

class urunler extends StatefulWidget {
  const urunler({Key? key}) : super(key: key);

  @override
  State<urunler> createState() => _urunlerState();
}

class _urunlerState extends State<urunler> with SingleTickerProviderStateMixin {
  //
  TabController? televizyonKontrolcusu;
  //
  @override
  void initState() {
    super.initState();
    televizyonKontrolcusu = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          controller: televizyonKontrolcusu,
          indicatorColor: Colors.red[100],
          labelColor: Colors.red[400],
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          //isScrollable: aşşağidaki yazan mesela birinci kanal telefonun ekranınıa sıgdırmak için
          //alt alta yazar ama bu widget ile yan yana yazarak fazladan taşan kısımları kaydırarak oluşturur.
          labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
          //labelStyle: aşşagıdaki textlere tek tek yazmak yerine bu widet ile hepsi için geçerli yapabiliriz.
          tabs: [
            Tab(child: Text("Temel Gıda")),
            Tab(child: Text("Şekerleme")),
            Tab(child: Text("İçecekler")),
            Tab(child: Text("Temizlik")),
          ],
        ),
        //Container(
        //height: 250.0,
        Expanded(
          //expanded:bu widget container yerine kullanılır fark olarak boyut vermeyiz kendisi butun ekrani kaplar..
          child: TabBarView(
            controller: televizyonKontrolcusu,
            children: <Widget>[
              Kategori(
                kategori: "Temel Gıda",
              ),
              Kategori(
                kategori: "Şekerleme",
              ),
              Kategori(
                kategori: "İçecekler",
              ),
              Kategori(
                kategori: "Temizlik",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
