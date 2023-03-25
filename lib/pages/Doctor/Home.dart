import 'package:flutter/material.dart';
import 'package:theroyalaesculapiandoctor/pages/Doctor/Search/Category.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(
          children: [
            SizedBox(height: 50),
         Container(
           width: 400,
           height: 45,
           child: ElevatedButton.icon(
             icon: Icon(
               Icons.search,
               color: Colors.grey,
               size: 30.0,
             ),
             label: Text('Search Here', style: TextStyle(
               color: Colors.black
             ),),
             onPressed: () {
               Navigator.of(context).push(new MaterialPageRoute(
                 builder: (BuildContext context) {
                   return Category();
                 },
               ));
             },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.grey[300],
               shape: new RoundedRectangleBorder(
                 borderRadius: new BorderRadius.circular(20.0),
               ),
             ),
           ),
         ),
//Search button over


     ],
        ),
    );
  }
}
