import 'package:flutter/material.dart';
import 'package:openbanking/Pages/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:openbanking/Pages/LoginPage.dart';
import 'package:openbanking/RouteGenerator.dart';
import 'package:openbanking/Pages/Splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Color(0xFF2A5C5B)),
    debugShowCheckedModeBanner: false,
    initialRoute: "/splash",
    onGenerateRoute: RouteGenerator.generateRoute,
    home: LoginPage(),
  ));
}