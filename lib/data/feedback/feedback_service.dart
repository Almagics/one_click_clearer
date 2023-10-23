import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:one_click_clearer/data/orders/OrderModel.dart';

import '../auth/auth_service.dart';

class FeedBackService{

  final FirebaseAuthService _auth = FirebaseAuthService();
  final  store = FirebaseFirestore.instance;

  Future<bool> NewFeedBack(

 String supject

      ) async{


    final userMail = await _auth.getCurrentUserUID();


    await store.collection("FeedBack")

        .add({

      "supject":supject,
      "username":userMail,





    }).then((DocumentReference document) {
      print('Document added with ID: ${document.id}');
      return true;
    }).catchError((error) {
      print('Error adding document: $error');
      return false;
    });;


    return false;


  }




}