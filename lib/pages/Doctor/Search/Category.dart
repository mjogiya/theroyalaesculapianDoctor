import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        SizedBox(height: 100),
        Text('What are you searching for?', style: TextStyle(
          fontSize: 30
        )),
        SizedBox(height: 50),

        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            child: Icon(Icons.search),
          ),
          title: Text('Medicines and Essentials'),
          trailing: Image(image: AssetImage('Logos/patient1.png')),
        ),
        SizedBox(height: 20),

        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            child: Icon(Icons.search),
          ),
          title: Text('Doctors'),
          trailing: Image(image: AssetImage('Logos/patient1.png')),
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            child: Icon(Icons.search),
          ),
          title: Text('Checkups'),
          trailing: Image(image: AssetImage('Logos/patient1.png')),
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            child: Icon(Icons.search),
          ),
          title: Text('Medical Stores'),
          trailing: Image(image: AssetImage('Logos/patient1.png')),
        ),
        SizedBox(height: 20),
        ListTile(

          leading: Container(

            width: 40,
            height: 40,
            child: Icon(Icons.search),
          ),
          title: Text('Lab-Tests'),
          trailing: Image(image: AssetImage('Logos/patient1.png')),
        ),
        SizedBox(height: 20),
      ],
    ),
    );
  }
}
