import 'package:bloc/bloc.dart';
import 'package:fruit_market/features/login/data/firebase/google_auth.dart';
import 'package:meta/meta.dart';

part 'google_state.dart';

class GoogleCubit extends Cubit<GoogleState> {
  GoogleCubit(this.firebaseServices) : super(GoogleInitial());
  final FirebaseServices firebaseServices;
  googleAuth() async {
    emit(GoogleLoading());

    try {
      await firebaseServices.signInWithGoogle();
      emit(GoogleSuccess());
    } catch (e) {
      emit(
        GoogleFailure(e.toString()),
      );
    }
  }
}
