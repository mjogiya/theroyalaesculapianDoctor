import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theroyalaesculapiandoctor/pages/Doctor/DocDashboard.dart';
import 'WelcomeScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  void initState()  {
    // TODO: implement initState
    super.initState();
    const delay = const Duration(seconds: 3);
    Future.delayed(delay, () => GoToWelcome());
    // await Firebase.initializeApp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 3, 55, 57),
        body: Center(
          child: (
          Image(
            image: AssetImage('Logos/FIRST.jpeg'),
              height: 350,
              width:350,
          )
          ),
        ),
    );
  }
  void GoToWelcome(){
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return DocDashboard();
            } else {
              return WelcomeScreen();
            }
          },);
      },
    ));
  }
}
