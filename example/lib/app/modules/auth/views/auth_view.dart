import 'package:example/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CButton(
              label: controller.isGoogleNotLogIn
                  ? 'Sign In with Google'
                  : 'Sign Out from Google',
              onPressed: () => controller.isGoogleNotLogIn
                  ? controller.googleSignIn()
                  : controller.googleSignOut(),
            ),
            SizedBox(
              height: 8.0,
            ),
            CButton(
              label: 'Sign In with Phone',
              onPressed: () => Get.toNamed(Routes.VERIFY_PHONE),
            ),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}

class CButton extends StatelessWidget {
  const CButton({
    required this.onPressed,
    required this.label,
    this.bgColor: Colors.blueAccent,
    this.color: Colors.white,
    Key? key,
  }) : super(key: key);

  final Function onPressed;
  final Color bgColor;
  final Color color;
  final String label;
  @override
  Widget build(BuildContext context) {
    ///For 2 platform IOS & Android
    return GetPlatform.isIOS
        ? CupertinoButton(
            color: bgColor,
            child: Text(
              label,
              style: TextStyle(
                color: color,
              ),
            ),
            onPressed: () => onPressed(),
          )
        : MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 64.0),
            elevation: 8.0,
            color: bgColor,
            onPressed: () => onPressed(),
            child: Text(
              label,
              style: TextStyle(
                color: color,
              ),
            ),
          );
  }
}
