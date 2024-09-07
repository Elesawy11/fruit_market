import 'package:bloc/bloc.dart';
import 'package:fruit_market/features/favorite/data/favorite_firebase.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
import 'package:meta/meta.dart';

part 'add_favorite_product_state.dart';

class AddFavoriteProductCubit extends Cubit<AddFavoriteProductState> {
  AddFavoriteProductCubit(this.instance) : super(AddFavoriteProductInitial());

  final FavoriteFirebase instance;

  void addFavoriteProduct({required ProductDetails product}) {
    emit(AddFavoriteProductLoading());

    try {
      instance.addProductToFavorite(product: product,docID: '0');
      emit(AddFavoriteProductSuccess());
    } catch (e) {
      emit(AddFavoriteProductFailure(e.toString()));
    }
  }
}
