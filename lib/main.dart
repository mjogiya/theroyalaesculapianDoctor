import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:theroyalaesculapiandoctor/pages/Splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // initialRoute: First_Screen(),
    routes: {
      '/': (context) => Splashscreen(),
      //    '/register': (context) => register(),
    },

  ));
}

