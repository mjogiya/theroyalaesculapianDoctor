import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}
final CollectionReference firebase = FirebaseFirestore.instance.collection("Appointment");
var Appointment = FirebaseFirestore.instance;
FirebaseFirestore db = FirebaseFirestore.instance;
final currentDoc = FirebaseAuth.instance.currentUser;

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    var firebase = Appointment
        .collection('Appointment')
        .where('DoctorId', isEqualTo: '${currentDoc!.uid}')
        .snapshots();

    return Scaffold(

      body: StreamBuilder<QuerySnapshot>(
        stream: firebase,
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot)
        {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, index) {
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
                          doc['DocImage'],
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
                              doc['DocName'],
                              style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              doc['DocAddress'],
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 8),
                            Text(
                              doc['DocMobile'],
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  doc['Available'] ? Icons.check_circle : Icons.cancel,
                                  color: doc['Available'] ? Colors.green : Colors.red,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  doc['Available'] ? 'Open Now' : 'Closed Now',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: doc['Available'] ? Colors.green : Colors.red,
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
          });
        }
      ),
    );
  }
}
