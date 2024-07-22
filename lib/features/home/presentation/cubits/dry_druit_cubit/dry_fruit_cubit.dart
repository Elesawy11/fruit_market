import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../data/models/collection_details.dart';

part 'dry_fruit_state.dart';

class DryFruitCubit extends Cubit<DryFruitState> {
  DryFruitCubit() : super(DryFruitInitial());

  List<CollectionDetails> collectionDetails = [];
  CollectionReference<Map<String, dynamic>> firestore =
      FirebaseFirestore.instance.collection('Dry Fruits');

  void getDryFruitData() {
    emit(DryFruitLoading());
    try {
      firestore.snapshots().listen((event) {
        collectionDetails.clear();
        collectionDetails = event.docs
            .map((doc) => CollectionDetails.fromJson(doc.data()))
            .toList();
        emit(DryFruitSuccess(collectionDetails: collectionDetails));
      });
    } catch (e) {
      emit(
        DryFruitFailure(
          e.toString(),
        ),
      );
    }
  }
}
