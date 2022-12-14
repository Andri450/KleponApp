import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleponapps/screen/welcome.dart';

Future<void> main() async {
  // await dotenv.load(
  //   fileName: Environment.fileName);
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Welcome(),
    );
  }
}
