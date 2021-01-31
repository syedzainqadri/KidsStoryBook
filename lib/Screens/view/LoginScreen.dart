import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsstorybook/Widgets/LoginButtonFb.dart';
import 'package:kidsstorybook/Widgets/LoginButtonGoogle.dart';
import 'Home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 100,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    'Please Login To kidsstorybook',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          LoginButtonGoogle(),
          SizedBox(
            height: 20,
          ),
          LoginButtonFb(),
          SizedBox(
            height: 40,
          ),
          InkWell(
            child: Text(
              'Skip For Now',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                fontFamily: 'Roboto',
              ),
            ),
            onTap: () {
              Get.to(Home());
            },
          ),
        ],
      ),
    );
  }
}
