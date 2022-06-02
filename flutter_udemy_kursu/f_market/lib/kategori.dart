// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

class Kategori extends StatefulWidget {
  var kategori;

  Kategori({Key? key, this.kategori}) : super(key: key);

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.kategori);
  }
}
