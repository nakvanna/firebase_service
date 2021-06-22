import 'package:example/app/routes/app_pages.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GoogleService _googleService = GoogleService();
  final title = 'Auth View';

  get isGoogleNotLogIn => _googleService.isNotLogIn;
  @override
  void onInit() {
    _googleService.googleInit();
    if (!isGoogleNotLogIn) {
      print(_googleService.getCurrentUser);
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _googleService.googleDispose();
  }

  Future<void> googleSignIn() async {
    await _googleService.signIn();
    Get.offAllNamed(Routes.HOME);
  }

  Future<void> googleSignOut() async {
    await _googleService.signOut();
    Get.offAllNamed(Routes.HOME);
  }
}
