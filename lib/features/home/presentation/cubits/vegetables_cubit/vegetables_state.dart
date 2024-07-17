part of 'vegetables_cubit.dart';

@immutable
sealed class VegetablesState {}

final class VegetablesInitial extends VegetablesState {}

final class VegetablesLoading extends VegetablesState {}

final class VegetablesSuccess extends VegetablesState {
  final List<CollectionDetails> collectionDetails;

  VegetablesSuccess({required this.collectionDetails});
}

final class VegetablesFailure extends VegetablesState {
  final String errMessage;

  VegetablesFailure(this.errMessage);
}
