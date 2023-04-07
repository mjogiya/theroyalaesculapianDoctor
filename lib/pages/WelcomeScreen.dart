import 'package:flutter/material.dart';
import 'package:theroyalaesculapiandoctor/pages/Login_Doc.dart';
import 'package:theroyalaesculapiandoctor/pages/DocRegister.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 3, 55, 57),
        appBar: AppBar(
          title: Text("Welcome to the Royal Aesculapian"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 3, 55, 57),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('Logos/FIRST.jpeg'),
              height: 250,
              width: 450,
            ),


            Container(
              width: 300,
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Login_Doctor();
                    },
                  ));
                },
                style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(34, 93, 42, 100),
                    padding: const EdgeInsets.all(15),
                    textStyle: const TextStyle(fontSize: 30)),
                child: const Text("Login as Doctor"),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: 300,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) {
                      return register();
                    },
                  ));
                },
                style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(34, 93, 42, 100),
                    padding: const EdgeInsets.all(15),
                    textStyle: const TextStyle(fontSize: 30)),
                child: const Text("Register as Doctor"),
              ),
            ),
          ],
        ));
  }
}
