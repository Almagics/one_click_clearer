import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:one_click_clearer/data/orders/OrderModel.dart';

import '../auth/auth_service.dart';

class OrderService{

  final FirebaseAuthService _auth = FirebaseAuthService();

  Future<bool> NewOrder(


  String customerName,
   String customerId,
   String providerName,
   String orderDate,
  String orderAmount,
   String orderStatus,
   String orderType,
   String countItems,
    String cleanmode,
    String recieving,
   String recievingdate,




      ) async{
    final  store = FirebaseFirestore.instance;

    final userMail = await _auth.getCurrentUserUID();


      await store.collection("Orders")

          .add({

        "customerName":customerName,
        "customerId":userMail,
        "providerName":providerName,

        "orderDate":orderDate,

        "orderAmount":orderAmount,

        "orderStatus":orderStatus,
        "orderType":orderType,
        "cleanmode":cleanmode,
        "recieving":recieving,
        "recievingdate":recievingdate,
        "countItems": countItems,



      }).then((DocumentReference document) {
        print('Document added with ID: ${document.id}');
        return true;
      }).catchError((error) {
        print('Error adding document: $error');
        return false;
      });;


    return false;


  }


  Future<List<OrderModel>> OrderListData() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final userMail = await _auth.getCurrentUserUID();
    QuerySnapshot querySnapshot = await _firestore
        .collection('Orders')
        .where('customerId', isEqualTo: userMail)
        .get();

    return querySnapshot.docs.map((doc) => OrderModel(
      customerName:  doc['customerName'],
      customerId: doc['customerId'],
      providerName: doc['providerName'],
      orderDate: doc['orderDate'],
      orderAmount: doc['orderAmount'],
      orderStatus: doc['orderStatus'],
      orderType: doc['orderType'],
      countItems: doc['countItems'],
      cleanmode: doc['cleanmode'],
      recieving: doc['recieving'],
      recievingdate: doc['recievingdate'],


      // Map other fields here
    )).toList();
  }

}