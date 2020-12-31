import 'package:flutter/material.dart';
import 'package:zeroday/Login/components/body.dart';
import 'package:zeroday/repositories/user_repository.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;
  LoginScreen({this.userRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(userRepository: userRepository),
    );
  }
}
