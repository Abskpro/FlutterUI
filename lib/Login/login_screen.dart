import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeroday/Login/components/body.dart';
import 'package:zeroday/landing/landing_screen.dart';
import 'package:zeroday/models/user.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    print(user);

    //return Home or authenticate widgetj

    if (user == null) {
      return Scaffold(
        body: Body(),
      );
    } else {
      return LandingPage();
    }
  }
}
