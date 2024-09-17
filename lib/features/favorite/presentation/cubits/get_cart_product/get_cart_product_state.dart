part of 'get_cart_product_cubit.dart';

@immutable
sealed class GetCartProductState {}

final class GetCartProductInitial extends GetCartProductState {}
final class GetCartProductLoading extends GetCartProductState {}
final class GetCartProductSuccess extends GetCartProductState {
  final List<ProductDetails>cartProduct;

  GetCartProductSuccess({required this.cartProduct});
}
final class GetCartProductFailure extends GetCartProductState {
  final String errMessage;

  GetCartProductFailure(this.errMessage);
}
