import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService{
  
  // Get collection of orders
  final CollectionReference orders = 
    FirebaseFirestore.instance.collection('orders');

  // save order to DB
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'date' : DateTime.now(),
      'order' : receipt,

      
      // Add more if needed

    });
  }
}