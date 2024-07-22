import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

// add data to fire store
  void addDataStore(
      {required String collectionName, required Map<String, dynamic> body});
  //     {
  //   firestore.collection(collectionName).add(body);
  // }

// get data from data store
  void getDataStore({required String collectionName});
}
