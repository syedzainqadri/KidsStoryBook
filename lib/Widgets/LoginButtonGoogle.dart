import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kidsstorybook/Controllers/authController.dart';
import 'package:kidsstorybook/Utils/Constants.dart';

class LoginButtonGoogle extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        colorBrightness: Brightness.light,
        color: Colors.blueAccent,
        splashColor: kSplashColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 200,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconTheme(
                data: IconThemeData(
                  color: Colors.white,
                ),
                child: ImageIcon(
                  AssetImage('assets/google.webp'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Login With Google',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          controller.signInWithGoogle();
        });
  }
}
