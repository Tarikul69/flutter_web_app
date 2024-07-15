import 'package:flutter/material.dart';
import 'package:web_app/web_view/home.dart';

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
    //Get.pu

    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const home(),
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
