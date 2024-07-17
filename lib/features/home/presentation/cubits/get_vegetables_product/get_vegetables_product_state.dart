part of 'get_vegetables_product_cubit.dart';

@immutable
sealed class GetVegetablesProductState {}

final class GetVegetablesProductInitial extends GetVegetablesProductState {}
final class GetVegetablesProductLoading extends GetVegetablesProductState {}
final class GetVegetablesProductFailure extends GetVegetablesProductState {
  final String errMessage;

  GetVegetablesProductFailure(this.errMessage);
}
final class GetVegetablesProductSuccess extends GetVegetablesProductState {
  final List<ProductDetails> productDetails;

  GetVegetablesProductSuccess({required this.productDetails});

  
}
