import'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });
  final CollectionReference Users = FirebaseFirestore.instance.collection('Users');

  Future RegisterUserData(String name, String email, String mobile, String password) async {
    return await Users.doc(uid).set({
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password,

    });
  }


}
