// ignore_for_file: unnecessary_null_comparison, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireworks/models/kullanici.dart';

class BenimAutservisim {
  final FirebaseAuth _firebseauth = FirebaseAuth.instance;
  //eger metod basına alttan cizgi eklersek o metod sadece o sinifta kullanılacak demektir.
  Kullanici? kullaniciolustur(User? firebsekullanici) {
    //
    return firebsekullanici == null
        ? null
        : Kullanici.firebasenUret(firebsekullanici);
  }

  Stream<Kullanici?> get durumTakipcisi {
    //map metoduna aldıgı firebaseUser objelesini kullanıcı objesine dönüştüren bir fonksiyon giremiz lazım
    return _firebseauth.authStateChanges().map(kullaniciolustur);
  }

  Future<Kullanici?> anonimGiris() async {
    var autResulth = await FirebaseAuth.instance.signInAnonymously();
    return kullaniciolustur(autResulth.user);
  }

  Future<void> cikisYap() {
    return FirebaseAuth.instance.signOut();
  }
}
