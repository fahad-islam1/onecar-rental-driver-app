import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:one_car_rental_driver_app/firebase_options.dart';
import 'package:one_car_rental_driver_app/presentation/views/auth/login_screen.dart';
import 'package:one_car_rental_driver_app/presentation/views/eraning/earning_screen.dart';
import 'package:one_car_rental_driver_app/res/colors/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'One Car Rental Driver ',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: white),
        scaffoldBackgroundColor: white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
