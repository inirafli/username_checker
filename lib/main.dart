import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:username_checker/common/styles.dart';
import 'package:username_checker/firebase_options.dart';
import 'package:username_checker/views/username_checker_screen.dart';

/// Main entry point of the application.
///
/// This function ensures that Flutter is properly initialized,
/// initializes Firebase with the specified options, and then runs the app.
void main() async {
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
      debugShowCheckedModeBanner: false,
      title: 'Username Checker',
      theme: appTheme,
      home: UsernameCheckerScreen(),
    );
  }
}