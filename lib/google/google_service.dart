part of '../firebase_service.dart';

class GoogleService {
  late FirebaseAuth _auth;
  late GoogleSignIn _googleSignIn;
  googleInit() {
    _auth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
  }

  googleDispose() {
    _googleSignIn.disconnect();
  }

  get isNotLogin => _auth.currentUser == null;

  get getCurrentUser => _auth.currentUser!;

  Future<void> signIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, UserCredential Sign-in
      await _auth.signInWithCredential(credential);
    } catch (error) {
      // ignore: avoid_print
      print('Google sign in error on: $error');
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (error) {
      // ignore: avoid_print
      print('Google sign out error on: $error');
    }
  }
}
