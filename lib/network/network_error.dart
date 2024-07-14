import 'package:flutter/material.dart';

class network_error extends StatelessWidget {
  const network_error({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250,
              ),
              Image.asset("assets/images/network_error.png"),
              SizedBox(
                height: 5,
              ),
              Title(
                color: Colors.black,
                child: Text(
                  "No Internet Connection",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {},
                child: Text(
                  "Try Again",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
