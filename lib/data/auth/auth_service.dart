


import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthService{

  FirebaseAuth _auth = FirebaseAuth.instance;


//sign up
  Future<User?> signupWithEmailAndPassword(String email,String password) async{


    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      if(userCredential.user !=null){

        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return null;

  }

//sign in
  Future<User?> signInWithEmailAndPassword(String email,String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      final prefs = await SharedPreferences.getInstance();

      prefs.remove('userEmail');
      prefs.remove('userPassword');

      prefs.setString('userEmail', email);
      prefs.setString('userPassword', password);

      return credential.user;
    } catch (e) {
      print(e);
    }

    return null;
  }



  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print("Error signing out: $e");
      return false;
    }

  }



  // Get the current user's UID
  Future<String?> getCurrentUserUID() async {
    final prefs = await SharedPreferences.getInstance();
    final userEmail = prefs.getString('userEmail');
    //final userPassword = prefs.getString('userPassword');

    if (userEmail != null) {
      return userEmail;
    }
    return null; // Return null if the user is not authenticated
  }


}