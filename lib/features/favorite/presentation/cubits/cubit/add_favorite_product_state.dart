part of 'add_favorite_product_cubit.dart';

@immutable
sealed class AddFavoriteProductState {}

final class AddFavoriteProductInitial extends AddFavoriteProductState {}
final class AddFavoriteProductLoading extends AddFavoriteProductState {}
final class AddFavoriteProductFailure extends AddFavoriteProductState {
  final String errMessage;

  AddFavoriteProductFailure(this.errMessage);
}
final class AddFavoriteProductSuccess extends AddFavoriteProductState {}
