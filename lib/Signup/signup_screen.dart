import 'package:flutter/material.dart';
import 'package:zeroday/Signup/components/body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: buildAppBar(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset('assets/icons/backArrow.png'),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
