import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product_details.dart';

part 'get_vegetables_product_state.dart';

class GetVegetablesProductCubit extends Cubit<GetVegetablesProductState> {
  GetVegetablesProductCubit() : super(GetVegetablesProductInitial());
  List<ProductDetails> productDetails = [];
 String collectionName = 'Vegetables';
  void getVegetablesProduct({required String docId}) {
    emit(GetVegetablesProductLoading());
    try {
      FirebaseFirestore.instance
          .collection(collectionName)
          .doc(docId)
          .collection('products')
          .snapshots()
          .listen((event) {
        productDetails.clear();
        productDetails = event.docs
            .map((doc) => ProductDetails.fromJson(doc.data()))
            .toList();
        emit(GetVegetablesProductSuccess(productDetails: productDetails));
      });
    } on Exception catch (e) {
      emit(GetVegetablesProductFailure(e.toString()));
    }
  }
}
