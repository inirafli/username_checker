import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:username_checker/firebase_options.dart';
import 'package:username_checker/utils/data_helper.dart';
import 'package:username_checker/views/username_checker_screen.dart';

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
    return MaterialApp(
      title: 'Username Checker',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: UsernameCheckerScreen(),
    );
  }
}