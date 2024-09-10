import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
import 'package:meta/meta.dart';
part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  List<ProductDetails> productDetails = [];
String collectionName = 'fruit';
  void getFruitProduct({required String docId}) {
    emit(GetProductsLoading());
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
        emit(GetProductsSuccess(productDetails: productDetails));
      });
    } on Exception catch (e) {
      emit(GetProductsFailure(e.toString()));
    }
  }
}
