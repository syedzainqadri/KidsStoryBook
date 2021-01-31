import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Controllers/bindings/bindings.dart';
import 'Utils/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      title: 'kidsstorybook',
      theme: ThemeData(
        fontFamily: "NotoNastaliqUrdu",
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
      home: Root(),
    );
  }
}
