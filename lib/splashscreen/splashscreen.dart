import 'package:flutter/material.dart';
import 'package:web_app/web_view/home.dart';
import 'package:web_app/web_view/home1.dart';
import 'package:web_app/web_view/home2.dart';
import 'package:web_app/web_view/home3.dart';
import 'package:web_app/web_view/reload.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    _navigatetoscreen();
  }

  _navigatetoscreen() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => home2(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/splash_screen.jpg"),
      ),
    );
  }
}
