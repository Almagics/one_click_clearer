import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_click_clearer/data/user/user_model.dart';

import '../auth/auth_service.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuthService _auth = FirebaseAuthService();

  Future<UserModel?> getDataByGuid() async {

    final useremail = await _auth.getCurrentUserUID();
    QuerySnapshot querySnapshot = await _firestore
        .collection('Users')
        .where('email', isEqualTo: useremail)
        .get();

    print('goooooood${_auth.getCurrentUserUID()}');

    if (querySnapshot.docs.isNotEmpty) {


      final doc = querySnapshot.docs.first;
      print('goooooood${_auth.getCurrentUserUID()}');
      return UserModel(
          address: doc['address'].toString(),
          email: doc['email'].toString(),
          fullName: doc['fullName'].toString(),
          password: doc['password'].toString(),
          phoneNumber: doc['phoneNumber'].toString(),
          role: doc['role'].toString(),
          username: doc['username'].toString()
      );
    }
    print('noooooooooooo');
    return null; // Return null if no matching document is found
  }
}
