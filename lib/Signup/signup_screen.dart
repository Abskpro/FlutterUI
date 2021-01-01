import 'package:flutter/material.dart';
import 'package:zeroday/Signup/components/body.dart';
import 'package:zeroday/repositories/user_repository.dart';

class SignUpScreen extends StatelessWidget {
  final UserRepository userRepository;
  SignUpScreen({this.userRepository});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        userRepository: userRepository,
      ),
      // appBar: buildAppBar(context),
    );
  }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       leading: IconButton(
//         icon: Image.asset('assets/icons/backArrow.png'),
//         onPressed: () => Navigator.pop(context),
//       ),
//     );
//   }
}
