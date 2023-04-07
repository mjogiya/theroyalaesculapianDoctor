import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:theroyalaesculapiandoctor/pages/Doctor/Widgets/Loading.dart';

class MedicalList extends StatefulWidget {
  const MedicalList({Key? key}) : super(key: key);

  @override
  State<MedicalList> createState() => _MedicalListState();
}
var Medicals = FirebaseFirestore.instance;

class _MedicalListState extends State<MedicalList> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    var firebase = Medicals
        .collection('Medical')
        .snapshots();

    return Scaffold(
      body: StreamBuilder<QuerySnapshot> (
        stream: firebase,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) =>
        snapshot.hasData ?
        ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {

            final DocumentSnapshot doc = snapshot.data!.docs[index];

            return Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 120,
                        child: Image.network(
                          doc['photoUrl'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doc['name'],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              doc['street'],
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 8),
                            Text(
                              doc['contact'],
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  doc['status'] ? Icons.check_circle : Icons.cancel,
                                  color: doc['status'] ? Colors.green : Colors.red,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  doc['status'] ? 'Open Now' : 'Closed Now',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: doc['status'] ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

          },
        ) : Loading()
      ),
    );

  }

  @override
  void initState() {
    setState(() {
      sleep(Duration(microseconds: 100));
      isLoading = false;
    });
  }
}
