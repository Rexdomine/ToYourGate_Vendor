import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyg_vendor/constants/location.dart';
import 'package:tyg_vendor/features/bottom%20navigation/presentation/bottom_nav.dart';

import 'features/authentication/presentation/login.dart';
import 'firebase_messaging.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FireBaseApi().initNotifications();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final locationController = Get.put(GetGeoLocation());

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    locationController.determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
          var data = prefs.data;
          if (prefs.hasData) {
            final isUserLoggedIn = data!.getString('token');
            return GetMaterialApp(
              title: 'TYG-vendor',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: isUserLoggedIn == null
                  ? LoginScreen()
                  : BottomNavigationScreen(),
            );
          } else {
            return Container();
          }
        });
  }
}
