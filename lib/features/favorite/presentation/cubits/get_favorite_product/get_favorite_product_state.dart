part of 'get_favorite_product_cubit.dart';

@immutable
sealed class GetFavoriteProductState {}

final class GetFavoriteProductInitial extends GetFavoriteProductState {}
final class GetFavoriteProductLoading extends GetFavoriteProductState {}
final class GetFavoriteProductSuccess extends GetFavoriteProductState {
  final List<ProductDetails>favoriteList;

  GetFavoriteProductSuccess({required this.favoriteList});
}
final class GetFavoriteProductFailure extends GetFavoriteProductState {
  final String errMessage;

  GetFavoriteProductFailure(this.errMessage);
}
