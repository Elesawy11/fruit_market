part of 'get_dry_fruit_product_cubit.dart';

@immutable
sealed class GetDryFruitProductState {}

final class GetDryFruitProductInitial extends GetDryFruitProductState {}
final class GetDryFruitProductLoading extends GetDryFruitProductState {}
final class GetDryFruitProductFailure extends GetDryFruitProductState {
  final String errMessage;

  GetDryFruitProductFailure(this.errMessage);
}
final class GetDryFruitProductSuccess extends GetDryFruitProductState {
  final List<ProductDetails> productDetails;

  GetDryFruitProductSuccess({required this.productDetails});

}
