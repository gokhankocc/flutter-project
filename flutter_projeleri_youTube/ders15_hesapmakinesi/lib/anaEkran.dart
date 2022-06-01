import 'package:flutter/material.dart';

class anaEkran extends StatefulWidget {
  const anaEkran({Key? key}) : super(key: key);

  @override
  State<anaEkran> createState() => _anaEkranState();
}

class _anaEkranState extends State<anaEkran> {
  num sayi = 0, sayi1 = 0, sonuc = 0;

  TextEditingController t1 =
      TextEditingController(); //textfieldin içini okuyacak
  TextEditingController t2 = TextEditingController();

  sayiTopla() {
    setState(() {
      sayi = num.parse(t1.text);
      sayi1 = num.parse(t2.text);
      sonuc = sayi + sayi1;
    });
  }

  sayiCikar() {
    setState(() {
      sayi = num.parse(t1.text);
      sayi1 = num.parse(t2.text);
      sonuc = sayi - sayi1;
    });
  }

  sayiCarp() {
    setState(() {
      sayi = num.parse(t1.text);
      sayi1 = num.parse(t2.text);
      sonuc = sayi * sayi1;
    });
  }

  sayiBol() {
    setState(() {
      sayi = num.parse(t1.text);
      sayi1 = num.parse(t2.text);
      sonuc = sayi / sayi1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50), //her yönden boşluk verme
      child: Center(
          child: Column(
        children: <Widget>[
          Text("$sonuc"),
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, //butonları ortaya alır
            children: <Widget>[
              //row widget satır kullanarak yan yana yazar
              RaisedButton(
                onPressed: sayiTopla,
                child: Text("Topla"),
              ),
              RaisedButton(
                onPressed: sayiCikar,
                child: Text("Çıkar"),
              ),
              RaisedButton(
                onPressed: sayiBol,
                child: Text("Böl"),
              ),
              RaisedButton(
                onPressed: sayiCarp,
                child: Text("Çarp"),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
