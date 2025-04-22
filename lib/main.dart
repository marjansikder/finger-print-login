import 'package:finger_print_login/finger_print_authentication.dart';
import 'package:finger_print_login/home_page.dart';
import 'package:flutter/material.dart';


void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fingerprint Auth",
      //home: HomePage(),
      home: FingerprintAuth(),
    );
  }
}