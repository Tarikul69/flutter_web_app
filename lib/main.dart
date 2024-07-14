import 'package:flutter/material.dart';
import 'package:web_app/network/error_screen.dart';
import 'package:web_app/network/network_error.dart';
import 'package:web_app/splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
      //home: network_error(),
    );
  }
}
