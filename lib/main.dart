import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyg_vendor/features/bottom%20navigation/presentation/bottom_nav.dart';

import 'features/authentication/presentation/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TYG-vendor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
