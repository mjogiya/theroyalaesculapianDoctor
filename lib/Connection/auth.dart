import 'package:firebase_auth/firebase_auth.dart';
import 'package:theroyalaesculapiandoctor/Connection/Database.dart';

class AuthService  {
   FirebaseAuth _auth = FirebaseAuth.instance;



  //Strem set up
  // Stream<User> get user {
  //   return _auth.userChanges().map(_userFromFirebaseUser());
  // }
// sign in with email and password

  Future SigninWithEmail(String email, String password) async {
    try{
      UserCredential result =  await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    }catch(e) {
      print(e.toString());
      return null;
    }
  }



  //register with email
Future registerWithEmail(String name, String email, String mobile, String password) async {
    try{
     UserCredential result =  await _auth.createUserWithEmailAndPassword(email: email, password: password );
      User? user = result.user;
      // adding data to firestore
     await DatabaseService(uid: user!.uid).RegisterUserData(name, email, mobile, password);
      return user;
    }catch(e) {
      print(e.toString());
      return null;
    }
}

  //sign out
  Future signOutEmail() async {
    try{
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}
