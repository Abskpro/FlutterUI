import 'package:flutter/material.dart';
import 'package:zeroday/Components/social_media_button.dart';

class SocialLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(text: "Facebook",textColor: Colors.white, bgColor: Colors.blue),
        SizedBox(
          width: 20,
        ),
        SocialButton(text: "Google",textColor: Colors.white,bgColor: Colors.redAccent),
      ],
    );
  }
}
