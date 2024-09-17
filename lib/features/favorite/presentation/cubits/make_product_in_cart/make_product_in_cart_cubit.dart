import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/firebase/home_firebase.dart';
import '../../../../home/data/models/product_details.dart';

part 'make_product_in_cart_state.dart';

class MakeProductInCartCubit extends Cubit<MakeProductInCartState> {
  MakeProductInCartCubit(this.firebase) : super(MakeProductInCartInitial());
  final HomeFirebase firebase;
  CollectionReference cart = FirebaseFirestore.instance.collection('cart');

  Future<void> updateProductAndMakedFavorite({
    required String firstCollection,
    required String collectionDoc,
    required ProductDetails product,
  }) async {
    emit(MakeProductInCartLoading());
    try {
      if (!product.isCartProduct) {
        await cart.add(product.toJson()).then((value) {
          firebase.updateProduct(
              firstCollection: firstCollection,
              collectionDoc: collectionDoc,
              docId: product.productId,
              data: {
                'isCartProduct': !product.isCartProduct,
                'cartId': value.id,
              });

          cart.doc(value.id).update(
            {
              'isCartProduct': !product.isCartProduct,
              'cartId': value.id,
            },
          );
        });
      } else {
        cart.doc(product.cartId).delete();
        firebase.updateProduct(
            firstCollection: firstCollection,
            collectionDoc: collectionDoc,
            docId: product.productId,
            data: {
              'isCartProduct': false,
              'cartId': FieldValue.delete(),
            });
      }

      emit(MakeProductInCartSuccess());
    } catch (e) {
      emit(MakeProductInCartFailure(e.toString()));
    }
  }
}
