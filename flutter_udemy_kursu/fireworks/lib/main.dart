// ignore_for_file: prefer_const_constructors, avoid_print, avoid_function_literals_in_foreach_calls, non_constant_identifier_names, unused_local_variable, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, avoid_types_as_parameter_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireworks/services/benimAuthServisim.dart';
//import 'package:fireworks/models/kullanici.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import '_YonlendirmeSayfasi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //provider birbirine uzak widgetlar arasi iiletim saglar ama öncelikle pubspec.yaml dosyasına provider eklentisi eklememiz lazım
    //providerin paylaştıgı bilgilere sadece providerin altındaki widgetler ulaşabilecek. bu yuzden olabildiğince en yukarı koymamız lazım.
    //provideri denemek için _AnaSayfa clasına git orda deneme fonksiyonu yazdım.
    //authentication objesini her clasta tanımlamak yerine sadece mainde yazdık ve hepsinden erişim sagladık bu konu önemli tekrar tekrar bak kafana yer et
    //listeni initstate içinde kullanabilmek için false yapmak lazım yoksa çalışmaz önemli unutma
    return Provider<BenimAutservisim>(
      //create: (_) => "merhaba",   önce bunu denedik
      create: (_) => BenimAutservisim(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projem',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: YonlendirmeSayfasi(),
      ),
    );
  }
}
