part of '../firebase_service.dart';

class PhoneNumberVerifyService {
  late FirebaseAuth _auth;

  googleInit() {
    _auth = FirebaseAuth.instance;
  }

  googleDispose() {}

  get isNotLogin => _auth.currentUser == null;

  get getCurrentUser => _auth.currentUser!;

  Future<String?> verifyPhoneNumber({required String phoneNumber}) async {
    String verifyCode = '';
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then(
                (value) => print(value),
              );
        },
        verificationFailed: (FirebaseAuthException e) {
          // ignore: avoid_print
          print('Verify failed: $e');
        },
        codeSent: (String verificationId, int? resendToken) {
          verifyCode = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verifyCode = verificationId;
        },
      );
      return verifyCode;
    } catch (e) {
      // ignore: avoid_print
      print('Verify phone number error: $e');
    }
  }

  Future<User?> onSubmitVerify(
      {required String pin, required String verifyCode}) async {
    try {
      await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verifyCode,
          smsCode: pin,
        ),
      );
      return _auth.currentUser;
    } catch (e) {
      // ignore: avoid_print
      print('On submit verify: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print('Sign out error on: $e');
    }
  }
}
