import 'package:flutter/material.dart';

class network_error extends StatelessWidget {
  const network_error({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            Image.asset("assets/images/network_error.png"),
            const SizedBox(
              height: 5,
            ),
            Title(
              color: Colors.black,
              child: const Text(
                "No Internet Connection",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Try Again",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
