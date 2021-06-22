import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/verify_phone_controller.dart';

class VerifyPhoneView extends GetView<VerifyPhoneController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VerifyPhoneView'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller.phoneController,
              decoration: InputDecoration(hintText: 'Enter your phone number'),
              maxLength: 10,
            ),
          ),
        ),
      ),
    );
  }
}
