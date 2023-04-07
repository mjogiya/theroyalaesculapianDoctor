import 'package:flutter/material.dart';
import 'package:theroyalaesculapiandoctor/pages/Doctor/Widgets/AppointmentList.dart';

class Patient extends StatefulWidget {
  const Patient({Key? key}) : super(key: key);

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 55, 57),
          title: const Text('Patients'),

        ),
        body:
        AppointmentList(),
      ),
    );
  }
}

