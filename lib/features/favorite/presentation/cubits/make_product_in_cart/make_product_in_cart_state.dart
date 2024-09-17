part of 'make_product_in_cart_cubit.dart';

@immutable
sealed class MakeProductInCartState {}

final class MakeProductInCartInitial extends MakeProductInCartState {}
final class MakeProductInCartLoading extends MakeProductInCartState {}
final class MakeProductInCartSuccess extends MakeProductInCartState {}
final class MakeProductInCartFailure extends MakeProductInCartState {
  final String errMessage;

  MakeProductInCartFailure(this.errMessage);
}
