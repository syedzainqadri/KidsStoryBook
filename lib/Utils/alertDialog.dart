import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsstorybook/Controllers/userController.dart';
import 'package:kidsstorybook/Screens/view/LoginScreen.dart';
import 'package:kidsstorybook/Screens/view/PrivacyPolicy.dart';
import 'package:kidsstorybook/Screens/view/TermsOfUse.dart';

AlertDialog alertDialog(BuildContext context) {
  return AlertDialog(
    actions: [
      MaterialButton(
          child: Text(
            'LogIn',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }),
      MaterialButton(
        child: Text(
          'DashBoard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => DashBoard()));
        },
      ),
      MaterialButton(
        child: Text(
          'Privacy Policy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PrivacyPolicy()));
        },
      ),
      MaterialButton(
        child: Text(
          'Terms of Use',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TermOfUse()));
        },
      ),
      MaterialButton(
          child: Text(
            'LogOut',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            signOut();
          }),
    ],
  );
}

void signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    Get.back();
    Get.find<UserController>().clear();
  } catch (e) {
    Get.snackbar('Error Signing Out', e.message,
        snackPosition: SnackPosition.BOTTOM);
  }
}

Future createAlertDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return alertDialog(context);
      });
}
