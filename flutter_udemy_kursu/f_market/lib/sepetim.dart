// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

class sepetim extends StatelessWidget {
  const sepetim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Text(
            "Sepetim",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
          ),
        ),
        //listTile: Listviewi fayanslara böler vve alt alta koyar.
        ListTile(
          title: Text("Çikolatali Gofret"),
          subtitle: Text("2 adet x 3.5 ₺"),
          trailing: Text("7 ₺"),
        ),
        ListTile(
          title: Text("Çikolatali Gofret"),
          subtitle: Text("2 adet x 3.5 ₺"),
          trailing: Text("7 ₺"),
        ),
        ListTile(
          title: Text("Çikolatali Gofret"),
          subtitle: Text("2 adet x 3.5 ₺"),
          trailing: Text("7 ₺"),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Toplam Tutar",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  Text(
                    "50",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 45.0,
            decoration: BoxDecoration(
              color: Colors.orange[700],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text("Alışverişi Tamamla",style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),),
            ),
          ),
        )
      ],
    );
  }
}
