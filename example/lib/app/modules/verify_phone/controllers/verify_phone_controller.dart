import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerifyPhoneController extends GetxController {
  final GlobalKey formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  @override
  void onInit() {
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
  }
}
