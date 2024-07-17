import 'package:fruit_market/core/utils/firebase_service.dart';

import '../models/collection_details.dart';

class HomeFirebase extends FirebaseService {
  // get data from fire store
  List<CollectionDetails> collectionDetails = [];
  @override
  void getDataStore({required String collectionName}) {
    firestore.collection(collectionName).snapshots().listen((event) {
      collectionDetails.clear();
      collectionDetails = event.docs
          .map((doc) => CollectionDetails.fromJson(doc.data()))
          .toList();
    });
  }

  // List<CollectionDetails> getFruitDataFire() {
  //   return firestore.collection('fruit').snapshots().listen((event) {
  //     collectionDetails.clear();
  //     collectionDetails = event.docs
  //         .map((doc) => CollectionDetails.fromJson(doc.data()))
  //         .toList();
  //   }) as List<CollectionDetails>;
  // }

  @override
  void addDataStore(
      {required String collectionName, required Map<String, dynamic> body}) {
    // TODO: implement addDataStore
  }
}
