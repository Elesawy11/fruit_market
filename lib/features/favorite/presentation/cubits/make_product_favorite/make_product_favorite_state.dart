part of 'make_product_favorite_cubit.dart';

@immutable
sealed class MakeProductFavoriteState {}

final class MakeProductFavoriteInitial extends MakeProductFavoriteState {}
final class MakeProductFavoriteLoading extends MakeProductFavoriteState {}
final class MakeProductFavoriteSuccess extends MakeProductFavoriteState {}
final class MakeProductFavoriteFailure extends MakeProductFavoriteState {
  final String errMessage;

  MakeProductFavoriteFailure(this.errMessage);
}
