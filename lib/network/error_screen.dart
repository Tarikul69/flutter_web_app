// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class error_Screen extends StatelessWidget {
  const error_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/network_error.png"),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Title(
              color: Colors.black,
              child: const Text(
                "Check Your Internet Connection",
                style: TextStyle(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
