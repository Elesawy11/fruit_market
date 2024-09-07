import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';

abstract class FavoriteFirebase {
  CollectionReference favorites =
      FirebaseFirestore.instance.collection('favorite product');

  void addProductToFavorite({required ProductDetails product,required String docID }) async {
    await favorites.doc(docID).set(product);
  }

  void deleteProductFromFavorite()async{
    await favorites.doc().delete();
  }
}
