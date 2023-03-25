import 'package:flutter/material.dart';

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
          title: Text("Patient"),
        ),
        body: GridView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            childAspectRatio: .25 * 3,
          ),
          children: <Widget>[
            Patients(catImage: 'Logos/patient1.png', title: 'Mayur Jogiya' ),
            Patients(catImage: 'Logos/Doctor/Covid.jpg', title: 'Mansi Kakadiya' ),
            Patients(catImage: 'Logos/Doctor/Covid.jpg', title: 'Romil Desai' ),
            Patients(catImage: 'Logos/Doctor/Covid.jpg', title: 'Hinali Dhameliya' ),
            Patients(catImage: 'Logos/Doctor/Covid.jpg', title: 'Darshit Kothari' ),
            Patients(catImage: 'Logos/Doctor/Covid.jpg', title: 'Vishwa trada' ),
            Patients(catImage: 'Logos/Doctor/Covid.jpg', title: 'Mayur Jogiya' ),


          ],
        ),
      ),
    );
  }
}

Widget Patients({catImage, title}) {
  return AspectRatio(
      aspectRatio: 2 / 2,
      child: Hero(
        tag: title,
        child: GestureDetector(
          onTap: () {

          },
          child: Column(
            children: <Widget>[
              Container(
                height: 120,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(
                        catImage,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ));
}

