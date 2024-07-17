part of 'fruit_cubit.dart';

@immutable
sealed class FruitState {}

final class FruitInitial extends FruitState {}

final class FruitLoading extends FruitState {}

final class FruitSuccess extends FruitState {
  final List<CollectionDetails> collectionDetails;

  FruitSuccess({required this.collectionDetails});
}

final class FruitFailure extends FruitState {
  final String errMessage;

  FruitFailure(this.errMessage);
}
