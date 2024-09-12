import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../../../../home/data/firebase/home_firebase.dart';
import '../../../../home/data/models/product_details.dart';
part 'make_product_favorite_state.dart';

class MakeProductFavoriteCubit extends Cubit<MakeProductFavoriteState> {
  MakeProductFavoriteCubit(this.firebase) : super(MakeProductFavoriteInitial());
  final HomeFirebase firebase;
  CollectionReference favorite =
      FirebaseFirestore.instance.collection('favorite');
      
  Future<void> updateProductAndMakedFavorite({
    required String firstCollection,
    required String collectionDoc,
    required ProductDetails product,
  }) async {
    emit(MakeProductFavoriteLoading());
    try {
      if (!product.isFavorite) {
        await favorite.add(product.toJson()).then((value) {
          firebase.updateProduct(
              firstCollection: firstCollection,
              collectionDoc: collectionDoc,
              docId: product.productId,
              data: {
                'isFavorite': !product.isFavorite,
                'favoriteId': value.id,
              });

          favorite.doc(value.id).update(
            {
              'isFavorite': !product.isFavorite,
              'favoriteId': value.id,
            },
          );
        });
      } else {
        favorite.doc(product.favoriteId).delete();
        firebase.updateProduct(
            firstCollection: firstCollection,
            collectionDoc: collectionDoc,
            docId: product.productId,
            data: {
              'isFavorite': false,
              'favoriteId': FieldValue.delete(),
            });
      }

      emit(MakeProductFavoriteSuccess());
    } catch (e) {
      emit(MakeProductFavoriteFailure(e.toString()));
    }
  }
}
