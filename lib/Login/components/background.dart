import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.jpg",
              width: size.width,
              height: size.height / 2.5,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
