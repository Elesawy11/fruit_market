import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../data/models/collection_details.dart';

part 'vegetables_state.dart';

class VegetablesCubit extends Cubit<VegetablesState> {
  VegetablesCubit() : super(VegetablesInitial());
  List<CollectionDetails> collectionDetails = [];
  CollectionReference<Map<String, dynamic>> firestore =
      FirebaseFirestore.instance.collection('Vegetables');

  void getFruitData() {
    emit(VegetablesLoading());
    try {
      firestore.snapshots().listen((event) {
        collectionDetails.clear();
        collectionDetails = event.docs
            .map((doc) => CollectionDetails.fromJson(doc.data()))
            .toList();
        emit(VegetablesSuccess(collectionDetails: collectionDetails));
      });
    } catch (e) {
      emit(
        VegetablesFailure(
          e.toString(),
        ),
      );
    }
  }
}
