import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kidsstorybook/Controllers/authController.dart';
import 'package:kidsstorybook/Utils/Constants.dart';

class LoginButtonFb extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        colorBrightness: Brightness.light,
        color: kFbColor,
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
                  AssetImage('assets/fb.png'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Login With Facebook',
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
          // controller.signInFacebook();
        });
  }
}
