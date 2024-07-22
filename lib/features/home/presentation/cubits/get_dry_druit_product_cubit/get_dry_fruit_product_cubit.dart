import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product_details.dart';

part 'get_dry_fruit_product_state.dart';

class GetDryFruitProductCubit extends Cubit<GetDryFruitProductState> {
  GetDryFruitProductCubit() : super(GetDryFruitProductInitial());
  List<ProductDetails> productDetails = [];

  void getDryFruitProduct({required String docId}) {
    emit(GetDryFruitProductLoading());
    try {
      FirebaseFirestore.instance
          .collection('Dry Fruits')
          .doc(docId)
          .collection('products')
          .snapshots()
          .listen((event) {
        productDetails.clear();
        productDetails = event.docs
            .map((doc) => ProductDetails.fromJson(doc.data()))
            .toList();
        emit(GetDryFruitProductSuccess(productDetails: productDetails));
      });
    } on Exception catch (e) {
      emit(GetDryFruitProductFailure(e.toString()));
    }
  }
}
