import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
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
    // required String path
    final storageRef = FirebaseStorage.instance.ref('images');

    final images = storageRef.child("images");
    await images.putFile(image);
  }

  Future<String> getImageUrlStorage() async {
// required String path
    final storageRef = FirebaseStorage.instance.ref('images');
    final images = storageRef.child("images");

    return await images.getDownloadURL();
  }

  // send data to fireStore

  Future<void> sendDataToFireStore() async {
    //required String mainCollection
    //required String docID
    //required String secondCollection
    String imageUrl = await getImageUrlStorage();
    // CollectionReference allProducts = FirebaseFirestore.instance
    //     .collection('Dry Fruits')
    //     .doc('Dehiscent Dry Fruits')
    //     .collection('products');
    final product = FirebaseFirestore.instance
        .collection('Dry Fruits')
        .doc('Dehiscent Dry Fruits')
        .collection('products')
        .withConverter<ProductDetails>(
          fromFirestore: (snapshot, _) =>
              ProductDetails.fromJson(snapshot.data()!),
          toFirestore: (product, _) => product.toJson(),
        );

    await product
        .add(
          ProductDetails(
            name: 'Ahmed',
            price: '15000',
            image: imageUrl,
            rate: 5,
            productId: '12',
            mainCollection: 'fruit',
            department: 'melons'
          ),
        )
        .then(
          (value) => product.doc(value.id).update(
            {'productId': value.id},
          ),
        );
  }

  Future<void> updateProduct({
    required String docId,
    required String firstCollection,
    required String collectionDoc,
    required Map<String, dynamic> data,
  }) async {
    final product = FirebaseFirestore.instance
        .collection(firstCollection)
        .doc(collectionDoc)
        .collection('products');

    await product.doc(docId).update(data);
  }
}
