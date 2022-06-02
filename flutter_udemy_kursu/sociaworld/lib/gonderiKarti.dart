// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class GonderiKarti extends StatefulWidget {
  var isim;
  var soyisim;
  var aciklama;
  var gecenSure;
  var gonderiResimLinki;
  var profilResimLinki;

  GonderiKarti(
      //constructer kullanimini dartta nasıl oluyor iyice ögren
      {this.isim,
      this.soyisim,
      this.aciklama,
      this.gecenSure,
      this.gonderiResimLinki,
      this.profilResimLinki});

  @override
  State<GonderiKarti> createState() => _GonderiKartiState();
}

class _GonderiKartiState extends State<GonderiKarti> {
  tiklanandeger() {
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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        //containeri daha belirginyapmak için kullanırız
        elevation: 7.0,
        borderRadius: BorderRadius.circular(
            15.0), //buryada ekledik çünkü aşşagıdaki borderradius bozulmasın diye
        child: Container(
          padding: EdgeInsets.all(
              15.0), //içeriyede padding ekledi çünku içine ekleyecegimiz materyaller containera yapışmasın diye
          width: double.infinity,
          height: 390.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //gönderi kartı,üstteki row satiri ve açıklma satirini ayni hizaya getirdik
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //spacebetween rowdan sonraki elemanlari eşit parçaya böler
                children: [
                  Row(
                    //bu rowu ekleme sebebimiz yukarıda kullandıgımız spacebetween yüzünden kullnici resmi text bilgileri ve iconumuz eşit boşluklardaydi
                    //biz kullnici resmi ile textlerin yan yana olmasini istiyoruz büyüzden ikinci bir row açtık...
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(30.0),
                          image: DecorationImage(
                              image: NetworkImage(widget
                                  .profilResimLinki), //burasi profil resmi dikkat et
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Column(
                        //bu coloumnu row satırında textleri alt alta koymak için ekledik eger koymasaydık yan yana yazıyor olacaktı
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //crossAxisaligment : aşşagıdaki widgetlari ayni hizaya koymak için kullandık
                        children: [
                          Text(
                            widget.isim + " " + widget.soyisim,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[100]),
                          ),
                          Text(
                            widget.gecenSure,
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[300]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: tiklanandeger, icon: Icon(Icons.more_vert))
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                widget.aciklama,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[300]),
              ),
              SizedBox(
                height: 15.0,
              ),
              Image.network(
                //bunu kullnarak direkt olarak resim çekebiliriz
                widget.gonderiResimLinki,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //
                  Ikonlubutonum(
                    ikonum: Icons.favorite,
                    yazi: "Beğen",
                    fonksiyonum: () {},
                  ),
                  Ikonlubutonum(
                    ikonum: Icons.comment,
                    yazi: "Yorum Yap",
                    fonksiyonum: () {},
                  ),

                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.grey,
                    ),
                    label: Text(
                      "paylaş",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey[300]),
                    ),
                  ),
                  //
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ikonlubutonum extends StatelessWidget {
  final ikonum; //IconData tipinde video 136 bi hata alıyoruz burada neden araştir
  final yazi;
  final fonksiyonum;

  Ikonlubutonum({this.ikonum, this.yazi, this.fonksiyonum});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      //eger continer içinde yapsaydık ınkwell gözükmezdi çünkü inkwell material üstüne sıçrıyor
      child: InkWell(
        //ınkwell: bu widget butona tıkladıgımız zaman sıçrayan mürekkep özelliği verir...
        //bunu kullanmak için ondoubletap yani iki kere tıklama gibi bir cok metod kullanılabilir
        //ıbkwell material olmadan çalışmaz çünkü mürekkebin dökülecegi bir ortam gerekidir...
        highlightColor: Colors.red,
        onTap: fonksiyonum,
        child: Container(
          padding: EdgeInsets.all(5.0), //8 olunca hata verdi neden araştır?
          //decoration: BoxDecoration(color: Colors.grey[100]),
          child: Row(
            children: [
              Icon(
                ikonum,
                color: Colors.grey,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                yazi,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
