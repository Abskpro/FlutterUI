import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  Background({Key key, this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          width: double.infinity,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Let's Get Started",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Create an account to Q allure to get all feature"),
              SizedBox(height: 40),
              child,
            ],
          )),
    );
  }
}
