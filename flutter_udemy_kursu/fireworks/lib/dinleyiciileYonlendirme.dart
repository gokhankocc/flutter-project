// ignore_for_file: prefer_const_constructors, avoid_print, avoid_function_literals_in_foreach_calls, non_constant_identifier_names, unused_local_variable, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, avoid_types_as_parameter_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireworks/models/kullanici.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: YonlendirmeSayfasi(),
    );
  }
}

class YonlendirmeSayfasi extends StatefulWidget {
  const YonlendirmeSayfasi({Key? key}) : super(key: key);

  @override
  State<YonlendirmeSayfasi> createState() => _YonlendirmeSayfasiState();
}

class _YonlendirmeSayfasiState extends State<YonlendirmeSayfasi> {
  late bool isAuth = false;

  anonomGirisYap() async {
    var autResult = await FirebaseAuth.instance.signInAnonymously();
    //giriş kartının içindeki bilgilere ulaşmak için user'ı seceriz
    print(autResult.user?.uid);
    print(autResult.user?.email);
    print(autResult.user?.displayName);
    //displayName : kullanıcının görünen adı.
  }

  @override
  // ignore: override_on_non_overriding_member
  cikisYap() {
    FirebaseAuth.instance.signOut();
  }

  Widget girisSayfasi() {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          width: 120,
          color: Colors.grey,
          child: Center(
              child: InkWell(
                  onTap: () => anonomGirisYap(), child: Text("giriş yap"))),
        ),
      ),
    );
  }

  Widget anaSayfa() {
    return Scaffold(
      body: Center(
        child: InkWell(onTap: () => cikisYap(), child: Text("çıkıs yap")),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((Kullanici) {
      //bur bir dinleyicidir kullanıcıyı takip eder ve o anki durumuna göre isAunt'u degiştik aşagıda
      if (Kullanici != null) {
        print(
            "kullanıci giris yapmis durumda, simdi giris yapmıs ya da uygulamayı yeni açmış olabilir.");
        setState(() {
          isAuth = true;
        });
      } else {
        print(
            "kullanici giris yapmamış! yeni çıkış yapmıs ya da uygulamayı yeni açmış olabilir.");
        setState(() {
          isAuth = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? anaSayfa() : girisSayfasi();
    //bu kullanım kısa kullanımdır isAuth eger true ise anasayfa degilse giris sayfası döndürür.
  }
}
