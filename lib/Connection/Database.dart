import'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });
  final CollectionReference Doctors = FirebaseFirestore.instance.collection('Doctor');
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future RegisterUserData(String name, String email, String mobile, String password) async {
    return await Doctors.doc(uid).set({
      'name': "Dr. $name",
      'email': email,
      'mobile': mobile,
      'password': password,
      'role' : "Doctor"
    });
  }
  Future<String> getRoleData() async {
    String role;
    return await db.collection("Doctor").doc(uid).get().then((event) {
      print(uid);
      print(event.data()?['role']);
      if (event.data()?['role'] == "Doctor") {
        role = "Doctor";
      } else {
        role = "";
      }
      return role;
    });
  }

}
