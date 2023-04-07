import 'package:flutter/material.dart';
import 'package:theroyalaesculapiandoctor/pages/Doctor/Widgets/MedicalList.dart';

class Medicals extends StatefulWidget {
  const Medicals({Key? key}) : super(key: key);

  @override
  State<Medicals> createState() => _MedicalsState();
}

class _MedicalsState extends State<Medicals> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 3, 55, 57),
            title: Text("Medicals"),
          ),
          body: MedicalList()
      ),
    );
  }
}
