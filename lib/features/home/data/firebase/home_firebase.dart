import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:fruit_market/core/utils/firebase_service.dart';
import '../models/collection_details.dart';

class HomeFirebase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // get data from fire store
  List<CollectionDetails> collectionDetails = [];

  void getDataStore({required String collectionName}) {
    firestore.collection(collectionName).snapshots().listen((event) {
      collectionDetails.clear();
      collectionDetails = event.docs
          .map((doc) => CollectionDetails.fromJson(doc.data()))
          .toList();
    });
  }

// add data to fire store
  void addDataStore(
      {required String collectionName, required Map<String, dynamic> body}) {}


  // upload data to fire storage

  Future<void> uploadDataStorage({required File image}) async {
    final storageRef = FirebaseStorage.instance.ref('images');

    final images = storageRef.child("images");
    await images.putFile(image);
  }
}
