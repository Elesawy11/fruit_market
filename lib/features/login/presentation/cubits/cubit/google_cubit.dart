import 'package:bloc/bloc.dart';
import 'package:fruit_market/features/login/data/firebase/google_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'google_state.dart';

class GoogleCubit extends Cubit<GoogleState> {
  GoogleCubit(this.firebaseServices) : super(GoogleInitial());
  final FirebaseAuthServices firebaseServices;
  googleAuth() async {
    emit(GoogleLoading());

    try {
      await firebaseServices.signInWithGoogle();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogin',true);

      emit(GoogleSuccess());
    } catch (e) {
      emit(
        GoogleFailure(e.toString()),
      );
    }
  }
}
