part of 'dry_fruit_cubit.dart';

@immutable
sealed class DryFruitState {}

final class DryFruitInitial extends DryFruitState {}
final class DryFruitLoading extends DryFruitState {}
final class DryFruitFailure extends DryFruitState {
  final String errMessage;

  DryFruitFailure(this.errMessage);
}
final class DryFruitSuccess extends DryFruitState {
  final List<CollectionDetails> collectionDetails;

  DryFruitSuccess({required this.collectionDetails});

}
