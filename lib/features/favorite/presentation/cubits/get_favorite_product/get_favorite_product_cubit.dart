import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../../../../home/data/models/product_details.dart';
part 'get_favorite_product_state.dart';

class GetFavoriteProductCubit extends Cubit<GetFavoriteProductState> {
  GetFavoriteProductCubit() : super(GetFavoriteProductInitial());
  List<ProductDetails> favoriteList = [];
  String collectionName = 'favorite';
  void getFavoriteProduct() {
    emit(GetFavoriteProductLoading());
    try {
      FirebaseFirestore.instance
          .collection(collectionName)
          .snapshots()
          .listen((event) {
        favoriteList.clear();

        favoriteList = event.docs
            .map((doc) => ProductDetails.fromJson(doc.data()))
            .toList();
        emit(GetFavoriteProductSuccess(favoriteList: favoriteList));
      });
    } catch (e) {
      emit(GetFavoriteProductFailure(e.toString()));
    }
  }
}
