import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 20,
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }
}