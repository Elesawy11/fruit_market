import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/product_details.dart';

part 'get_cart_product_state.dart';

class GetCartProductCubit extends Cubit<GetCartProductState> {
  GetCartProductCubit() : super(GetCartProductInitial());
  List<ProductDetails> cartList = [];
  String collectionName = 'cart';
  void getFavoriteProduct() {
    emit(GetCartProductLoading());
    try {
      FirebaseFirestore.instance
          .collection(collectionName)
          .snapshots()
          .listen((event) {
        cartList.clear();

        cartList = event.docs
            .map((doc) => ProductDetails.fromJson(doc.data()))
            .toList();
        emit(GetCartProductSuccess(cartProduct: cartList));
      });
    } catch (e) {
      emit(GetCartProductFailure(e.toString()));
    }
  }
}
