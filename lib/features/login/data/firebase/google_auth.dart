import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  // dont't fgorget to add firebasea auth and google sign in package
  signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        // Create a new credential
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        // print('access token${authCredential.accessToken}');

        // Once signed in, return the UserCredential
        await auth.signInWithCredential(authCredential);
        //  print('User name  ${auth.currentUser?.displayName}');
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

// for sign out
  googleSignOut() async {
    await googleSignIn.signOut();
    auth.signOut();
  }
}
