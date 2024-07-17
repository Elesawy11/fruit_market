import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../../../data/models/collection_details.dart';
part 'fruit_state.dart';

class FruitCubit extends Cubit<FruitState> {
  FruitCubit() : super(FruitInitial());

  List<CollectionDetails> collectionDetails = [];
  CollectionReference<Map<String, dynamic>> firestore =
      FirebaseFirestore.instance.collection('fruit');

  void getFruitData() {
    emit(FruitLoading());
    try {
      firestore.snapshots().listen((event) {
        collectionDetails.clear();
        collectionDetails = event.docs
            .map((doc) => CollectionDetails.fromJson(doc.data()))
            .toList();
        emit(FruitSuccess(collectionDetails: collectionDetails));
      });
    } catch (e) {
      emit(
        FruitFailure(
          e.toString(),
        ),
      );
    }
  }
}
