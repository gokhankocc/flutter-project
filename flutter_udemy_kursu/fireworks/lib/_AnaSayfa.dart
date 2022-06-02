// ignore_for_file: prefer_const_constructors, avoid_print, file_names, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireworks/services/benimAuthServisim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key? key}) : super(key: key);
  cikisYap() {
    FirebaseAuth.instance.signOut();
  }

  providerDeneme(BuildContext context) {
    var _benimautservisim =
        Provider.of<BenimAutservisim>(context, listen: false);
    _benimautservisim.cikisYap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () => providerDeneme(context), child: Text("çıkıs yap")),
      ),
    );
  }
}
