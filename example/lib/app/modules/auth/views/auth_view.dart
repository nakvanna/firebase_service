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
            controller.isNotLogin
                ? RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      controller.googleSignIn();
                    },
                    child: Text('Sign in with Google'),
                  )
                : RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      controller.googleSignOut();
                    },
                    child: Text('Sign Out from Google'),
                  ),
          ],
        ),
      ),
    );
  }
}
